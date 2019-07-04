package com.javaverse.projectone.authentication.component;

import com.javaverse.projectone.authentication.repository.UserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.*;

@Component
@Log4j2
public class ReactiveUserDetailsServiceImpl implements ReactiveUserDetailsService {

    private final UserRepository userRepository;

    public ReactiveUserDetailsServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Mono<UserDetails> findByUsername(String username) {
        Optional<com.javaverse.projectone.authentication.entity.User> optional = userRepository.findByUsername(username);
        return Mono.justOrEmpty(optional)
                .filter(Objects::nonNull)
                .switchIfEmpty(errorBadCredentialsException(username))
                .map(this::createSpringSecurityUser);
    }

    private Mono<com.javaverse.projectone.authentication.entity.User> errorBadCredentialsException(String login) {
        return Mono.error(new BadCredentialsException(String.format("User %s not found in database", login)));
    }

    private org.springframework.security.core.userdetails.User createSpringSecurityUser(com.javaverse.projectone.authentication.entity.User user) {

        org.springframework.security.core.userdetails.User obj = new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getPassword(), user.getGrantedAuthorities());
        return obj;
    }

}