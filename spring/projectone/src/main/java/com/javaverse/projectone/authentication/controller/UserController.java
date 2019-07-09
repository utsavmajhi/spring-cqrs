package com.javaverse.projectone.authentication.controller;

import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.util.UUID;

import static org.springframework.http.MediaType.*;
import static org.springframework.web.reactive.function.server.RequestPredicates.accept;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;
import static org.springframework.web.reactive.function.server.ServerResponse.ok;

/**
 * created by duc-d on 8/5/2018
 */

@Configuration
public class UserController {

    @Bean
//    @Admin
    public RouterFunction<ServerResponse> router() {

        return route()
//                .path("/users", builder -> builder
//                        .GET("/{id}", handler::get)
//                        .GET("", accept(APPLICATION_JSON_UTF8), handler::findAll)  // todo sse
//                        .POST("", accept(APPLICATION_JSON_UTF8), handler::save)
//                        .PUT("", accept(APPLICATION_JSON_UTF8), handler::update)
//                        .PATCH("", accept(APPLICATION_JSON_UTF8), handler::update)
//                        .DELETE("", accept(APPLICATION_JSON_UTF8), handler::delete)
//                )
                .path("/api", builder -> builder
                        .GET("/admin",
                                req -> ok()
                                        .body(Mono.just("admin : " + req.queryParam("name").orElse("")),
                                                String.class))
                        .GET("/basic", accept(APPLICATION_JSON_UTF8),
                                req -> ok().contentType(TEXT_PLAIN)
                                        .body(
                                                Mono.just("basic : " + req.queryParam("name").orElse("")).subscribeOn(Schedulers.elastic()),
                                                String.class))
                ).before(req -> ServerRequest.from(req).header("X-Correlation-ID", UUID.randomUUID().toString().substring(0, 8)).build())
//                .filter(filter)
                .build();

    }
}
