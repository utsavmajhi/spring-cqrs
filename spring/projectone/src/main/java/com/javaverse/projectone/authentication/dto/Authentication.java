package com.javaverse.projectone.authentication.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;

/**
 * View Model object for storing a user's credentials.
 */

public class Authentication {

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class In {
        @NotEmpty
        private String username;

        @NotEmpty
        private String password;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Out {
        @NotEmpty
        private String token;
    }

}
