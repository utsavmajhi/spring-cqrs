package com.javaverse.projectone.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

@EnableWebFluxSecurity
public class SecurityConfig {


    @Bean
    SecurityWebFilterChain springWebFilterChain(ServerHttpSecurity http) throws Exception {
        return http
                .csrf().disable()
                .authorizeExchange()
//                .pathMatchers(HttpMethod.GET, "/products/**").permitAll()
//                .pathMatchers(HttpMethod.POST, "/products/**").permitAll()
//                .pathMatchers(HttpMethod.PUT, "/products/**").permitAll()
//                .pathMatchers(HttpMethod.DELETE, "/products/**").permitAll()
//                .pathMatchers(HttpMethod.DELETE, "/posts/**").hasRole("ADMIN")
                //.pathMatchers("/users/{user}/**").access(this::currentUserMatchesPath)
                .anyExchange().permitAll().and().build();

    }


}
