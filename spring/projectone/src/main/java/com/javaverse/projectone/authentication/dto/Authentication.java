package com.javaverse.projectone.authentication.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;

/**
 * View Model object for storing a user's credentials.
 */

public final class Authentication {

    private Authentication() {}

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Request {
        @NotEmpty
        private String username;

        @NotEmpty
        private String password;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Response {
        @NotEmpty
        private String token;
        @NotEmpty
        private String refreshToken;
    }

}
