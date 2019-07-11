package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.filter.request.HeaderValidator;
import com.javaverse.projectone.api.handler.ProductHandler;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;

import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.web.reactive.function.server.RequestPredicates.accept;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@AllArgsConstructor
public class ProductController {

    @Bean
    public RouterFunction<ServerResponse> productRouterFunction(ProductHandler handler, HeaderValidator validator) {
        return route()
                .path("/api/v1", builder -> builder
                        .GET("/products/{id}", accept(APPLICATION_JSON), handler::find)
                        .GET("/products", accept(APPLICATION_JSON), handler::findAll)
                        .POST("/products", accept(APPLICATION_JSON), handler::save)
                        .PUT("/products", accept(APPLICATION_JSON), handler::update)
                        .DELETE("/products/{id}", accept(APPLICATION_JSON), handler::delete)
                )
                .filter(validator)
                .build();
    }

}
