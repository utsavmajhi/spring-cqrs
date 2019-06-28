package com.javaverse.projectone.config.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

@Configuration
public class ProductFilter implements HandlerFilterFunction {
    @Override
    public Mono filter(ServerRequest req, HandlerFunction function) {
        switch (req.method()) {
            case GET:
                System.out.println("GET"); break;
            case POST:
                System.out.println("POST"); break;
            case PUT:
                System.out.println("PUT"); break;
            case PATCH:
                System.out.println("PATCH"); break;
            case DELETE:
                System.out.println("DELETE"); break;
            default:
                System.out.println("OTHER");
        }
//        switch (req.method())
//        if (request.pathVariable("name").equalsIgnoreCase("test")) {
//            return ServerResponse.status(FORBIDDEN).build();
//        }
        return function.handle(req);
    }
}
