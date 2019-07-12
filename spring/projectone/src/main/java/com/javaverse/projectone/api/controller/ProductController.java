package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.filter.request.HeaderValidator;
import com.javaverse.projectone.api.handler.ProductHandler;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.util.Supplier;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

import java.time.*;

import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.web.reactive.function.server.RequestPredicates.*;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@AllArgsConstructor
public class ProductController {

    @Bean
    public RouterFunction<ServerResponse> productRouterFunction(ProductHandler handler, HeaderValidator validator) {
        return route()
                .path("/api/v1/products", builder -> builder
                        .nest(accept(APPLICATION_JSON), g -> g
                                .GET("/{id}", handler::find)
                                .GET("", handler::findAll)
                        ).nest(contentType(APPLICATION_JSON), p -> p
                                .POST("", handler::save)
                                .PUT("", handler::update)
                        )
                        .DELETE("/{id}", handler::delete)
                )
                .filter(this::performanceLogging)
                .filter(validator)
                .build();
    }

    private Mono<ServerResponse> performanceLogging(ServerRequest req, HandlerFunction<ServerResponse> next) {
        var begin = LocalTime.now();
        var res = next.handle(req);
        var duration = Duration.between(begin, LocalTime.now());
        log.info(processingTime(req, duration));
        return res;
    }

    private Supplier<String> processingTime(ServerRequest req, Duration duration) {
        return () -> req + " Took " + duration.toMillis() + " ms. ";
    }

}
