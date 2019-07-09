package com.javaverse.projectone.authentication.controller;

import com.javaverse.projectone.authentication.dto.Authentication;
import com.javaverse.projectone.authentication.token.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.*;
import org.springframework.security.core.context.ReactiveSecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import javax.validation.*;
import java.util.function.Consumer;


@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/authorize")
public class AuthenticationController {

    private final Validator validator;
    private final TokenProvider provider;
    private final TokenManager manager;

    @PostMapping
    public Mono<Authentication.Response> authorize(@Valid @RequestBody Authentication.Request req) {
        if (!validator.validate(req).isEmpty()) {
            return Mono.error(new RuntimeException("Bad request"));
        }
        org.springframework.security.core.Authentication authenticationToken = new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword());
        ReactiveSecurityContextHolder.withAuthentication(authenticationToken);
        return manager.authenticate(authenticationToken)
                .doOnError(throwBadCredentialsException())
                .map(auth -> new Authentication.Response(provider.token(auth), provider.refreshToken(auth)));

    }

    private Consumer<Throwable> throwBadCredentialsException() {
        return throwable -> {
            throw new BadCredentialsException("Bad Credentials Exception");
        };
    }

}
