package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.filter.ProductFilter;
import com.javaverse.projectone.api.handler.ProductHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;

import java.util.UUID;

import static org.springframework.http.MediaType.*;
import static org.springframework.web.reactive.function.server.RequestPredicates.accept;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@RequiredArgsConstructor
public class ProductRouter {

    @Bean
    public RouterFunction<ServerResponse> productRouterFunction(ProductHandler handler, ProductFilter filter) {
        return route()
                .path("/products", builder -> builder
                        .GET("/events/sse", accept(APPLICATION_STREAM_JSON), handler::events)
                        .GET("/{id}", handler::get)
                        .GET("", accept(APPLICATION_JSON_UTF8), handler::findAll)  // todo sse
                        .POST("", accept(APPLICATION_JSON_UTF8), handler::save)
                        .PUT("", accept(APPLICATION_JSON_UTF8), handler::update)
                        .DELETE("", accept(APPLICATION_JSON_UTF8), handler::delete)
                )
                .before(req -> ServerRequest.from(req).header("X-Correlation-ID", UUID.randomUUID().toString().substring(0, 8)).build())
                .filter(filter).build();
    }
}
