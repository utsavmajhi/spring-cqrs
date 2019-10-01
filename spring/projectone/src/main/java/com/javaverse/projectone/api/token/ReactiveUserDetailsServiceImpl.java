package com.javaverse.projectone.api.token;

import com.javaverse.projectone.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.ReactiveUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.Objects;

@Log4j2
@Component
@RequiredArgsConstructor
public class ReactiveUserDetailsServiceImpl implements ReactiveUserDetailsService {

    private final UserRepository repository;

    @Override
    public Mono<UserDetails> findByUsername(String username) {
        var optional = repository.findByUsername(username);
        return Mono.justOrEmpty(optional)
                .filter(Objects::nonNull)
                .switchIfEmpty(errorBadCredentialsException(username))
                .map(this::createSpringSecurityUser);
    }

    private Mono<com.javaverse.projectone.api.entity.User> errorBadCredentialsException(
            String login) {
        return Mono.error(
                new BadCredentialsException(String.format("User %s not found in database", login)));
    }

    private org.springframework.security.core.userdetails.User createSpringSecurityUser(
            com.javaverse.projectone.api.entity.User user) {
        return new org.springframework.security.core.userdetails.User(
                user.getUsername(), user.getPassword(), user.getGrantedAuthorities());
    }
}
