package com.javaverse.projectone.api.token;

/**
 * Constants for Spring Security authorities.
 */
public final class AuthoritiesConstants {

    public static final String ADMIN = "ROLE_ADMIN";

    public static final String USER = "ROLE_USER";
    public static final String REFRESH_TOKEN = "ROLE_REFRESH_TOKEN";

    private AuthoritiesConstants() {}
}
