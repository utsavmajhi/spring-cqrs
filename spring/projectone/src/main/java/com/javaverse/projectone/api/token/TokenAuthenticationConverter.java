package com.javaverse.projectone.api.token;

import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.util.Strings;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@RequiredArgsConstructor
public class TokenAuthenticationConverter
    implements Function<ServerWebExchange, Mono<Authentication>> {

  private static final String BEARER = "Bearer ";
  private static final Predicate<String> matchBearerLength =
      authValue -> authValue.length() > BEARER.length();
  private static final UnaryOperator<String> isolateBearerValue =
      authValue -> authValue.substring(BEARER.length());
  private final TokenProvider provider;

  @Override
  public Mono<Authentication> apply(ServerWebExchange exchange) {
    return Mono.justOrEmpty(exchange)
        .map(this::getAuthorization)
        .filter(Objects::nonNull)
        .filter(matchBearerLength)
        .map(isolateBearerValue)
        .filter(token -> !StringUtils.isEmpty(token))
        .map(provider::perform)
        .filter(Objects::nonNull);
  }

  private String getAuthorization(ServerWebExchange exchange) {
    return Optional.ofNullable(
            exchange.getRequest().getHeaders().getFirst(HttpHeaders.AUTHORIZATION))
        .orElse(Strings.EMPTY);
  }
}
