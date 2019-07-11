package com.javaverse.projectone.api.controller;

import com.javaverse.projectone.api.config.filter.request.HeaderValidator;
import com.javaverse.projectone.api.handler.ProductHandler;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.axonframework.commandhandling.gateway.CommandGateway;
import org.axonframework.queryhandling.QueryGateway;
import org.springframework.context.annotation.*;
import org.springframework.web.reactive.function.server.*;

import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.web.reactive.function.server.RequestPredicates.accept;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Log4j2
@Configuration
@AllArgsConstructor
public class ProductController {

    private final CommandGateway commandGateway;
    private final QueryGateway queryGateway;

    @Bean
    public RouterFunction<ServerResponse> productRouterFunction(ProductHandler handler, HeaderValidator validator) {
        return route()
                .path("/api/v1", builder -> builder
//                        .GET("/events/sse", accept(APPLICATION_STREAM_JSON), handler::events)
                                .GET("/products/{id}", accept(APPLICATION_JSON), handler::get)
                                .POST("/products", accept(APPLICATION_JSON), handler::save)
                                .GET("/products", accept(APPLICATION_JSON), handler::findAll)  // todo sse
                                .PUT("/products", accept(APPLICATION_JSON), handler::update)
                                .DELETE("/products", accept(APPLICATION_JSON), handler::delete)
                )
                .filter(validator)
                .build();
    }

//    @GetMapping("/api/products/{id}")
//    public ResponseEntity get(@PathVariable Long id) {
//        System.out.println(id);
//        return ResponseEntity.ok(queryGateway.query(new ProductQuery.Single(id), ResponseTypes.instanceOf(ProductDTO.class)).join());
//    }
//
//    @GetMapping("/api/products")
//    public ResponseEntity findAll() {
//        return ResponseEntity.ok(queryGateway.query(new ProductQuery.AllActive(), ResponseTypes.multipleInstancesOf(ProductDTO.class)).join());
//    }
//
//
//    @PostMapping("/api/products")
//    public String save(@RequestBody ProductDTO dto) {
//        commandGateway.send(dto.toCommand());
//        return "saved";
//    }
//
//    @DeleteMapping("/api/products/{id}")
//    public String delete(@PathVariable Long id) {
//        System.out.println("controller delete id :" + id);
//        commandGateway.send(new ProductCommand.Delete(id));
//        return "deleted";
//    }

}
