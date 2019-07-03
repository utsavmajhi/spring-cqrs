package com.javaverse.projectone.authentication.controller;

import org.springframework.context.annotation.*;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static org.springframework.web.reactive.function.server.RequestPredicates.accept;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;
import static org.springframework.web.reactive.function.server.ServerResponse.ok;

/**
 * created by duc-d on 8/5/2018
 */
//@RestController
//@RequestMapping(value = "/api")
//@Admin
@Configuration
public class DemoController {


    @Bean
//    @Admin
    public RouterFunction<ServerResponse> router() {
        return route()
                .GET("/api/admin",
                        req -> ok()
                                .body(Mono.just("admin : " + req.queryParam("name")),
                                        String.class))
                .GET("/api/basic",accept(MediaType.APPLICATION_JSON_UTF8),
                        req -> ok().contentType(MediaType.TEXT_PLAIN)
                                .body(
                                        Mono.just("basic : " + req.queryParam("name").get()).subscribeOn(Schedulers.elastic()),
                                        String.class))
                .build();

    }
}
