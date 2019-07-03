package com.javaverse.projectone.authentication.controller;

import com.javaverse.projectone.authentication.dto.*;
import com.javaverse.projectone.authentication.token.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
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
    private final TokenReactiveAuthenticationManager manager;

    @PostMapping
    public Mono<AuthenticationResponse> authorize(@Valid @RequestBody AuthenticationRequest request) {
        if (!validator.validate(request).isEmpty()) {
            return Mono.error(new RuntimeException("Bad request"));
        }
        Authentication authenticationToken = new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword());
        ReactiveSecurityContextHolder.withAuthentication(authenticationToken);
        return manager.authenticate(authenticationToken)
                .doOnError(throwBadCredentialsException())
                .map(auth -> new AuthenticationResponse(provider.createToken(auth)));

    }

    private Consumer<Throwable> throwBadCredentialsException() {
        return throwable -> {
            throw new BadCredentialsException("Bad Credentials Exception");
        };
    }

}
