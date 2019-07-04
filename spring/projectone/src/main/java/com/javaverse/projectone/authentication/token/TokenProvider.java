package com.javaverse.projectone.authentication.token;

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
    private static final int TOKEN_VALIDITY = 60 * 60 * 24; // Value in second
    private static final String AUTHORITIES_KEY = "auth";
    private static final Base64.Encoder encoder = Base64.getEncoder();

    private String secretKey;

    private long tokenValidityInMilliseconds;

    @PostConstruct
    public void init() {
        secretKey = encoder.encodeToString(SALT_KEY.getBytes(StandardCharsets.UTF_8));
        tokenValidityInMilliseconds = 1000 * TOKEN_VALIDITY;
    }

    public String createToken(Authentication authentication) {
        String authorities = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));

        Date issuedAt = new Date();
        Date expiration = new Date(issuedAt.getTime() + this.tokenValidityInMilliseconds);
        String compact = Jwts.builder()
                .setSubject(authentication.getName())
                .setIssuedAt(issuedAt)
                .claim(AUTHORITIES_KEY, authorities)
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .setExpiration(expiration)
                .compressWith(CompressionCodecs.DEFLATE)
                .compact();
        log.debug("compact " + compact);
        return compact;
    }

    public Authentication getAuthentication(String token) {
        if (StringUtils.isEmpty(token) || !validateToken(token)) {
            throw new BadCredentialsException("Invalid token");
        }
        Claims claims = Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody();
        Collection<? extends GrantedAuthority> authorities = Arrays
                .stream(claims.get(AUTHORITIES_KEY).toString().split(","))
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
        return new UsernamePasswordAuthenticationToken(new User(claims.getSubject(), Strings.EMPTY, authorities), token, authorities);
    }

    public boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
            return true;
        } catch (SignatureException e) {
            log.info("Invalid Signature.");
            log.trace("Invalid Signature trace: {}", e);
        } catch (MalformedJwtException e) {
            log.info("Invalid Token.");
            log.trace("Invalid Token trace: {}", e);
        } catch (ExpiredJwtException e) {
            log.info("Expired Token.");
            log.trace("Expired Token trace: {}", e);
        } catch (UnsupportedJwtException e) {
            log.info("Unsupported Token.");
            log.trace("Unsupported Token trace: {}", e);
        } catch (IllegalArgumentException e) {
            log.info("Token compact of handler are invalid.");
            log.trace("Token compact of handler are invalid trace: {}", e);
        }
        return false;
    }
}
