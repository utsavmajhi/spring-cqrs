package com.javaverse.projectone.api.handler;

import org.springframework.core.GenericTypeResolver;
import org.springframework.web.reactive.function.server.ServerRequest;
import reactor.core.publisher.Mono;

public abstract class CommonHandler<T> {

    Long id(ServerRequest req) {
        return Long.valueOf(req.pathVariable("id"));
    }

    Mono<T> body(ServerRequest req) {
        return (Mono<T>) req.bodyToMono(GenericTypeResolver.resolveTypeArgument(getClass(), CommonHandler.class));
    }

}