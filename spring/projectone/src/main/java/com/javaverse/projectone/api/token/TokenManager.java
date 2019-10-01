package com.javaverse.projectone.api.token;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.ReactiveAuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.ReactiveUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

@Log4j2
@RequiredArgsConstructor
public class TokenManager implements ReactiveAuthenticationManager {

  private final ReactiveUserDetailsService service;
  private final PasswordEncoder encoder;

  @Override
  public Mono<Authentication> authenticate(final Authentication authentication) {
    if (authentication.isAuthenticated()) {
      return Mono.just(authentication);
    }
    return Mono.just(authentication)
        .switchIfEmpty(Mono.defer(this::raiseBadCredentials))
        .cast(UsernamePasswordAuthenticationToken.class)
        .flatMap(this::authenticateToken)
        .publishOn(Schedulers.parallel())
        .onErrorResume(e -> raiseBadCredentials())
        .filter(u -> encoder.matches((String) authentication.getCredentials(), u.getPassword()))
        .switchIfEmpty(Mono.defer(this::raiseBadCredentials))
        .map(
            u ->
                new UsernamePasswordAuthenticationToken(
                    authentication.getPrincipal(),
                    authentication.getCredentials(),
                    u.getAuthorities()));
  }

  private <T> Mono<T> raiseBadCredentials() {
    return Mono.error(new BadCredentialsException("Invalid Credentials"));
  }

  private Mono<UserDetails> authenticateToken(
      final UsernamePasswordAuthenticationToken authenticationToken) {
    var username = authenticationToken.getName();
    log.debug("checking perform for user " + username);
    if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
      log.debug("authenticated user " + username + ", setting security context");
      return service.findByUsername(username);
    }
    return null;
  }
}
