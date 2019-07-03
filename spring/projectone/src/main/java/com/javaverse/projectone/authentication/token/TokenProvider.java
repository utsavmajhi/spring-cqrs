package com.javaverse.projectone.authentication.token;

import io.jsonwebtoken.*;
import lombok.extern.log4j.Log4j2;
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

    private static final String SALT_KEY = "JpxM4e858rc673syopdZnMFb*ExeqJtUc0HJ_iOxu~jiSYu+yPdPw93OBBjF";
    private static final int TOKEN_VALIDITY = 60 * 60 * 24; // Value in second

    private static final String AUTHORITIES_KEY = "auth";

    private final Base64.Encoder encoder = Base64.getEncoder();

    private String secretKey;

    private long tokenValidityInMilliseconds;

    @PostConstruct
    public void init() {
        this.secretKey = encoder.encodeToString(SALT_KEY.getBytes(StandardCharsets.UTF_8));
        System.out.println("secretKey : " + secretKey);
        this.tokenValidityInMilliseconds =
                1000 * TOKEN_VALIDITY;
    }

    public String createToken(Authentication authentication) {
        String authorities = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));
        log.info("authorities : {}", authorities);

        long now = (new Date()).getTime();
        Date validity = new Date(now + this.tokenValidityInMilliseconds);

        return Jwts.builder()
                .setSubject(authentication.getName())
                .claim(AUTHORITIES_KEY, authorities)
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .setExpiration(validity)
                .compact();
    }

    public Authentication getAuthentication(String token) {
        if (StringUtils.isEmpty(token) || !validateToken(token)) {
            throw new BadCredentialsException("Invalid token");
        }
        Claims claims = Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody();

        Collection<? extends GrantedAuthority> authorities =
                Arrays.stream(claims.get(AUTHORITIES_KEY).toString().split(","))
                        .map(SimpleGrantedAuthority::new)
                        .collect(Collectors.toList());

        User principal = new User(claims.getSubject(), "", authorities);

        return new UsernamePasswordAuthenticationToken(principal, token, authorities);
    }

    public boolean validateToken(String authToken) {
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(authToken);
            return true;
        } catch (SignatureException e) {
            log.info("Invalid JWT signature.");
            log.trace("Invalid JWT signature trace: {}", e);
        } catch (MalformedJwtException e) {
            log.info("Invalid JWT token.");
            log.trace("Invalid JWT token trace: {}", e);
        } catch (ExpiredJwtException e) {
            log.info("Expired JWT token.");
            log.trace("Expired JWT token trace: {}", e);
        } catch (UnsupportedJwtException e) {
            log.info("Unsupported JWT token.");
            log.trace("Unsupported JWT token trace: {}", e);
        } catch (IllegalArgumentException e) {
            log.info("JWT token compact of handler are invalid.");
            log.trace("JWT token compact of handler are invalid trace: {}", e);
        }
        return false;
    }
}
