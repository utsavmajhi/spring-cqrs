package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.CaseInsensitiveRequestPredicate;
import com.javaverse.projectone.api.config.filter.request.HeaderValidator;
import com.javaverse.projectone.api.config.filter.request.PerformLogging;
import com.javaverse.projectone.api.handler.CompanyHandler;
import com.javaverse.projectone.api.handler.ProductHandler;
import com.javaverse.projectone.api.handler.StoreHandler;
import com.javaverse.projectone.api.handler.UserHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.RequestPredicate;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.ServerResponse;

import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@RequiredArgsConstructor
public class GlobalController {

  private final PerformLogging performLogging;
  private final HeaderValidator validator;

  // todo implement caseInsensitive uri

  private static RequestPredicate caseInsensitive(RequestPredicate predicate) {
    return new CaseInsensitiveRequestPredicate(predicate);
  }

  @Bean
  public RouterFunction<ServerResponse> productFunction(ProductHandler handler) {
    return route()
        .path(
            "/api/v1/products",
            method ->
                method
                    .GET("/{id}", handler::find)
                    .GET("", handler::findAll)
                    .POST("", handler::save)
                    .PUT("", handler::update)
                    .DELETE("/{id}", handler::delete))
        .filter(performLogging)
        .filter(validator)
        .build();
  }

  @Bean
  public RouterFunction<ServerResponse> companyFunction(CompanyHandler handler) {
    return route()
        .path(
            "/api/v1/companies",
            method ->
                method
                    .GET("/{id}", handler::find)
                    .GET("", handler::findAll)
                    .POST("", handler::save)
                    .PUT("", handler::update)
                    .DELETE("/{id}", handler::delete))
        .filter(performLogging)
        .filter(validator)
        .build();
  }

  @Bean
  public RouterFunction<ServerResponse> storeFunction(StoreHandler handler) {
    return route()
        .path(
            "/api/v1/stores",
            method ->
                method
                    .GET("/{id}", handler::find)
                    .GET("", handler::findAll)
                    .POST("", handler::save)
                    .PUT("", handler::update)
                    .DELETE("/{id}", handler::delete))
        .filter(performLogging)
        .filter(validator)
        .build();
  }

  @Bean
  public RouterFunction<ServerResponse> userFunction(UserHandler handler) {
    return route()
        .path(
            "/api/v1/users",
            method ->
                method
                    .GET("/{id}", handler::find)
                    .GET("", handler::findAll)
                    .POST("", handler::save)
                    .PUT("", handler::update)
                    .DELETE("/{id}", handler::delete))
        .filter(performLogging)
        .filter(validator)
        .build();
  }
}
