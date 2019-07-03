package com.javaverse.projectone.authentication.component;

import org.apache.logging.log4j.util.Strings;
import org.springframework.http.HttpHeaders;
import org.springframework.web.server.ServerWebExchange;

import java.util.Optional;

/**
 * Utility class for Spring Security.
 */
public final class SecurityUtils {

    private SecurityUtils() { }

    public static String getAuthorization(ServerWebExchange exchange) {
        return Optional.ofNullable(exchange
                .getRequest()
                .getHeaders()
                .getFirst(HttpHeaders.AUTHORIZATION))
                .orElse(Strings.EMPTY);
    }

}
