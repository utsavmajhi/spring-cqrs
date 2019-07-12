package com.javaverse.projectone.api.config.filter.request;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

import java.util.Objects;

@Log4j2
@Component
public class HeaderValidator implements HandlerFilterFunction {

    @Override
    public Mono filter(ServerRequest req, HandlerFunction function) {
        validate(req);
        return function.handle(req);
    }

    // todo
    private void validate(ServerRequest req) {
        switch (Objects.requireNonNull(req.method())) {
            case GET:
                log.debug("GET"); break;
            case POST:
                log.debug("POST"); break;
            case PUT:
                log.debug("PUT"); break;
            case PATCH:
                log.debug("PATCH"); break;
            case DELETE:
                log.debug("DELETE"); break;
            default:
                log.debug("OTHER");
        }
    }
}
