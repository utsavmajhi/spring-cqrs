package com.javaverse.projectone.authentication.component;

import com.javaverse.projectone.authentication.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.*;

@Log4j2
@Component
@RequiredArgsConstructor
public class ReactiveUserDetailsServiceImpl implements ReactiveUserDetailsService {

    private final UserRepository repository;

    @Override
    public Mono<UserDetails> findByUsername(String username) {
        Optional<com.javaverse.projectone.authentication.entity.User> optional = repository.findByUsername(username);
        return Mono.justOrEmpty(optional)
                .filter(Objects::nonNull)
                .switchIfEmpty(errorBadCredentialsException(username))
                .map(this::createSpringSecurityUser);
    }

    private Mono<com.javaverse.projectone.authentication.entity.User> errorBadCredentialsException(String login) {
        return Mono.error(new BadCredentialsException(String.format("User %s not found in database", login)));
    }

    private org.springframework.security.core.userdetails.User createSpringSecurityUser(com.javaverse.projectone.authentication.entity.User user) {

        return new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getPassword(), user.getGrantedAuthorities());
    }

}
