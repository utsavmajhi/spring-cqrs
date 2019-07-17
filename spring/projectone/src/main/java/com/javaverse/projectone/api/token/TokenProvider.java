package com.javaverse.projectone.api.token;

import io.jsonwebtoken.*;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.util.Strings;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.PostConstruct;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.stream.Collectors;

@Log4j2
@Component
public class TokenProvider {

    private static final String SALT_KEY = "SmF2YXZlcnNlIFRlY2hub2xvZ3kgQ28uLCBMdGQu";
    private static final long TOKEN_VALIDITY = 60L * 60L * 24L; // Value in second // 1 day
    private static final String AUTHORITIES_KEY = "auth";
    private static final Base64.Encoder encoder = Base64.getEncoder();

    private String secretKey;

    private long tokenValidityInMilliseconds;

    @PostConstruct
    public void init() {
        secretKey = encoder.encodeToString(SALT_KEY.getBytes(StandardCharsets.UTF_8));
        tokenValidityInMilliseconds = 1_000L * TOKEN_VALIDITY;
    }

    public String token(Authentication authentication) {
        var authorities = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));

        var issuedAt = new Date();
        var expiration = new Date(issuedAt.getTime() + this.tokenValidityInMilliseconds);
        var compact = Jwts.builder()
                .setSubject(authentication.getName())
                .setIssuedAt(issuedAt)
                .claim(AUTHORITIES_KEY, authorities)
                .setExpiration(expiration)
                .compressWith(CompressionCodecs.DEFLATE)
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
        log.debug("compact token" + compact);
        return compact;
    }

    public String refreshToken(Authentication authentication) {
        // no expire for this version
        var issuedAt = new Date();
        var compact = Jwts.builder()
                .setId(UUID.randomUUID().toString())
                .setSubject(authentication.getName())
                .setIssuedAt(issuedAt)
                .claim(AUTHORITIES_KEY, AuthoritiesConstants.REFRESH_TOKEN)
                .compressWith(CompressionCodecs.DEFLATE)
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
        log.debug("compact refresh token" + compact);
        return compact;
    }

    public Authentication perform(String token) {

        validateToken(token);

        var claims = Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody();

        var authorities = Arrays
                .stream(claims.get(AUTHORITIES_KEY).toString().split(","))
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
        return new UsernamePasswordAuthenticationToken(new User(claims.getSubject(), Strings.EMPTY, authorities), token, authorities);
    }

    public void validateToken(String token) {
        if (StringUtils.isEmpty(token)) {
            throw new BadCredentialsException("Token cannot be Empty");
        }
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
        } catch (SignatureException e) {
            log.error("Invalid Signature.");
            throw new BadCredentialsException("Invalid Signature.");
        } catch (MalformedJwtException e) {
            log.error("Invalid Token.");
            throw new BadCredentialsException("Invalid Token.");
        } catch (ExpiredJwtException e) {
            log.error("Expired Token.");
            throw new BadCredentialsException("Expired Token.");
        } catch (UnsupportedJwtException e) {
            log.error("Unsupported Token.");
            throw new BadCredentialsException("Unsupported Token.");
        } catch (IllegalArgumentException e) {
            log.error("Token compact of handler are invalid.");
            throw new BadCredentialsException("Token compact of handler are invalid.");
        }
    }
}
