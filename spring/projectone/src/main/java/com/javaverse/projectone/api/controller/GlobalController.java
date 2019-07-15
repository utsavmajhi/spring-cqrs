package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.filter.request.HeaderValidator;
import com.javaverse.projectone.api.handler.ProductHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.util.Supplier;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

import java.time.*;

import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@RequiredArgsConstructor
public class GlobalController {

    private final ProductHandler product;

    @Bean
    public RouterFunction<ServerResponse> productRouterFunction(HeaderValidator validator) {
        return route()
                .path("/api/v1", builder -> builder
                        .path("/products", method -> method
                                .GET("/{id}", product::find)
                                .GET("", product::findAll)
                                .POST("", product::save)
                                .PUT("", product::update)
                                .DELETE("/{id}", product::delete)
                        )
                        .path("/stores", method -> method
                                .GET("/{id}", product::find)
                                .GET("", product::findAll)
                                .POST("", product::save)
                                .PUT("", product::update)
                                .DELETE("/{id}", product::delete)
                        )
                        .path("/companies", method -> method
                                .GET("/{id}", product::find)
                                .GET("", product::findAll)
                                .POST("", product::save)
                                .PUT("", product::update)
                                .DELETE("/{id}", product::delete)
                        )
                )
                .filter(this::performanceLogging)
                .filter(validator)
                .build();
    }

    private Mono<ServerResponse> performanceLogging(ServerRequest req, HandlerFunction<ServerResponse> next) {
        var begin = LocalTime.now();
        var res = next.handle(req);
        log.debug(processingTime(req, Duration.between(begin, LocalTime.now())));
        return res;
    }

    private Supplier<String> processingTime(ServerRequest req, Duration duration) {
        return () -> req + " Took " + duration.toMillis() + " ms. ";
    }

}
