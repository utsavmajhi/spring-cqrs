package com.javaverse.projectone.authentication.config;

import com.javaverse.projectone.authentication.component.*;
import com.javaverse.projectone.authentication.token.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.config.annotation.method.configuration.EnableReactiveMethodSecurity;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.server.*;
import org.springframework.security.web.server.authentication.AuthenticationWebFilter;
import org.springframework.security.web.server.context.*;
import reactor.core.publisher.Mono;

@Configuration
@EnableWebFluxSecurity
@RequiredArgsConstructor
@EnableReactiveMethodSecurity
public class SecurityConfig {
    private static final String[] AUTH_WHITELIST = {
            "/resources/**",
            "/webjars/**",
            "/authorize/**",
            "/favicon.ico",
    };

    private final ReactiveUserDetailsServiceImpl service;
    private final TokenProvider provider;

    @Bean
    public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http, ServerAuthenticationEntryPoint ep) {

        http.httpBasic().disable()
                .formLogin().disable()
                .csrf().disable()
                .logout().disable();

        http
                .exceptionHandling()
                .authenticationEntryPoint(ep).and()
                .securityContextRepository(NoOpServerSecurityContextRepository.getInstance())// this line will stop server to return denied
                .authorizeExchange()
                .pathMatchers(AUTH_WHITELIST).permitAll()
                .pathMatchers("/api/admin**").hasAuthority(AuthoritiesConstants.ADMIN)
                .anyExchange().access((mono, obj) -> mono.map(auth -> auth.getAuthorities().stream()
                .filter(e -> e.getAuthority().equalsIgnoreCase(AuthoritiesConstants.ADMIN) || e.getAuthority().equalsIgnoreCase(AuthoritiesConstants.USER)).count() > 0)
                .map(AuthorizationDecision::new))
                .and()
                .addFilterAt(filter(), SecurityWebFiltersOrder.AUTHORIZATION);
        return http.build();
    }

    @Bean
    public AuthenticationWebFilter filter() {
        var filter = new AuthenticationWebFilter(manager());
        filter.setRequiresAuthenticationMatcher(new TokenHeadersExchangeMatcher());
        filter.setSecurityContextRepository(new WebSessionServerSecurityContextRepository());
        filter.setServerAuthenticationConverter(new TokenAuthenticationConverter(provider)::apply);
        return filter;
    }

    @Bean
    public TokenManager manager() {
        return new TokenManager(service, encoder());
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder(11);
    }

    @Bean
    public ServerAuthenticationEntryPoint entryPoint() {
        return (exchange, e) -> Mono.fromRunnable(() -> exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED));
    }

}
