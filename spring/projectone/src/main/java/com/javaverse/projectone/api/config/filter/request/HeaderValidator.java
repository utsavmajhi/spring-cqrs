package com.javaverse.projectone.api.config.filter.request;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

@Component
public class HeaderValidator implements HandlerFilterFunction {

    @Override
    public Mono filter(ServerRequest req, HandlerFunction function) {
        validate(req);
        return function.handle(req);
    }

    // todo
    private void validate(ServerRequest req) {
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
