package com.javaverse.projectone.authentication.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;

/**
 * View Model object for storing a user's credentials.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthenticationRequest {

    @NotEmpty
    private String username;

    @NotEmpty
    private String password;

}
