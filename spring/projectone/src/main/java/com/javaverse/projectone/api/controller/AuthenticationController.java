package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.dto.Authentication;
import com.javaverse.projectone.api.token.TokenManager;
import com.javaverse.projectone.api.token.TokenProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.ReactiveSecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import javax.validation.Valid;
import javax.validation.Validator;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/authenticate")
public class AuthenticationController {

    private final Validator validator;
    private final TokenProvider provider;
    private final TokenManager manager;

    @PostMapping
    public Mono<Authentication.Response> authorize(@Valid @RequestBody Authentication.Request req) {
        if (!validator.validate(req).isEmpty()) {
            return Mono.error(new BadCredentialsException("Bad Credentials Exception"));
        }
        var authenticationToken =
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword());
        ReactiveSecurityContextHolder.withAuthentication(authenticationToken);
        return manager
                .authenticate(authenticationToken)
                .doOnError(e -> new BadCredentialsException("Bad Credentials Exception"))
                .map(
                        authenticate ->
                                new Authentication.Response(
                                        provider.token(authenticate), provider.refreshToken(authenticate)));
    }
}
