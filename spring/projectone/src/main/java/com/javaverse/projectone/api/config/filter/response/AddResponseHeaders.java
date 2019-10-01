package com.javaverse.projectone.api.config.filter.response;

import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebFilter;
import org.springframework.web.server.WebFilterChain;
import reactor.core.publisher.Mono;

import java.time.ZonedDateTime;

@Component
public class AddResponseHeaders implements WebFilter {

  @Override
  public Mono<Void> filter(ServerWebExchange exchange, WebFilterChain chain) {
    exchange.getResponse().getHeaders().setLastModified(ZonedDateTime.now());
    exchange.getResponse().getHeaders().add("X-Developer", "Javaverse Technology Co., Ltd.");
    return chain.filter(exchange);
  }
}
