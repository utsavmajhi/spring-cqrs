package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.filter.request.*;
import com.javaverse.projectone.api.handler.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;

import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@RequiredArgsConstructor
public class GlobalController {

    private final PerformLogging performLogging;
    private final HeaderValidator validator;

    @Bean
    public RouterFunction<ServerResponse> productFunction(ProductHandler handler) {
        return route()
                .path("/api/v1/products", method -> method
                        .GET("/{id}", handler::find)
                        .GET("", handler::findAll)
                        .POST("", handler::save)
                        .PUT("", handler::update)
                        .DELETE("/{id}", handler::delete)
                )
                .filter(performLogging)
                .filter(validator)
                .build();
    }

    @Bean
    public RouterFunction<ServerResponse> companyFunction(CompanyHandler handler) {
        return route()
                .path("/api/v1/companies", method -> method
                        .GET("/{id}", handler::find)
                        .GET("", handler::findAll)
                        .POST("", handler::save)
                        .PUT("", handler::update)
                        .DELETE("/{id}", handler::delete)
                )
                .filter(performLogging)
                .filter(validator)
                .build();
    }

    @Bean
    public RouterFunction<ServerResponse> storeFunction(StoreHandler handler) {
        return route()
                .path("/api/v1/stores", method -> method
                        .GET("/{id}", handler::find)
                        .GET("", handler::findAll)
                        .POST("", handler::save)
                        .PUT("", handler::update)
                        .DELETE("/{id}", handler::delete)
                )
                .filter(performLogging)
                .filter(validator)
                .build();
    }
}
