package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.CaseInsensitiveRequestPredicate;
import com.javaverse.projectone.api.entity.User;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static org.springframework.web.reactive.function.server.RequestPredicates.*;
import static org.springframework.web.reactive.function.server.ServerResponse.ok;

@Configuration
public class UserController {

    @Bean
    public RouterFunction<ServerResponse> router() {

        return RouterFunctions
                .route(caseInsensitive(GET("/api/users")), request -> ok().build())
                .andRoute(caseInsensitive(POST("/api/users")), req -> Mono.defer(() -> req.bodyToMono(User.class))
                        .doOnNext(user -> System.out.println(user))
                        .subscribeOn(Schedulers.parallel())
                        .flatMap(obj -> ok().build())
                );

//        return route()
//                .path("/api", builder -> builder
//                        .GET("/admin", req -> ok().body(Mono.just("admin : " + req.queryParam("name").orElse("")), String.class))
//                        .GET("/basic", accept(APPLICATION_JSON),
//                                req -> ok().contentType(TEXT_PLAIN)
//                                        .body(
//                                                Mono.just("basic : " + req.queryParam("name").orElse("")).subscribeOn(Schedulers.elastic()),
//                                                String.class))
//                        .POST("/users",req -> Mono.defer(() -> req.bodyToMono(User.class))
//                                .doOnNext(user -> System.out.println(user) )
//                                .subscribeOn(Schedulers.parallel())
//                                .flatMap(obj -> ok().build()))
//                )
////                .before(req -> ServerRequest.from(req).header("X-Correlation-ID", UUID.randomUUID().toString().substring(0, 8)).build())
//                .build();

    }

    private static RequestPredicate caseInsensitive(RequestPredicate predicate) {
        return new CaseInsensitiveRequestPredicate(predicate);
    }

}
