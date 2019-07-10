package com.javaverse.projectone.api.config.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

@Configuration
public class ProductFilter implements HandlerFilterFunction {
    @Override
    public Mono filter(ServerRequest req, HandlerFunction function) {
        mock(req);
        return function.handle(req);
    }

    private void mock(ServerRequest req) {
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
    }
}
