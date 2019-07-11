package com.javaverse.projectone.api.config.filter.response;

import org.springframework.stereotype.Component;
import org.springframework.web.server.*;
import reactor.core.publisher.Mono;

@Component
public class AddCorrelationId implements WebFilter {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, WebFilterChain chain) {
        exchange
                .getResponse()
                .getHeaders()
                .add("X-Developer", "Javaverse Technology Co., Ltd.");
        return chain.filter(exchange);
    }

}
