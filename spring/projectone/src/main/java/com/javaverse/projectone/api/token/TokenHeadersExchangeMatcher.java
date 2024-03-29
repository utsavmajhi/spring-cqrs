package com.javaverse.projectone.api.token;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.security.web.server.util.matcher.ServerWebExchangeMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Log4j2
public class TokenHeadersExchangeMatcher implements ServerWebExchangeMatcher {
  @Override
  public Mono<MatchResult> matches(final ServerWebExchange exchange) {
    return Mono.just(exchange)
        .map(ServerWebExchange::getRequest)
        .map(ServerHttpRequest::getHeaders)
        .filter(headers -> headers.containsKey(HttpHeaders.AUTHORIZATION))
        .flatMap(headers -> MatchResult.match())
        .switchIfEmpty(MatchResult.notMatch());
  }
}
