package com.javaverse.projectone.api.config.filter.request;

import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.util.Supplier;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.HandlerFilterFunction;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import reactor.core.publisher.Mono;

import java.time.Duration;
import java.time.LocalTime;

@Log4j2
@Component
public class PerformLogging implements HandlerFilterFunction {

  @Override
  public Mono filter(ServerRequest req, HandlerFunction next) {
    var begin = LocalTime.now();
    var res = next.handle(req);
    log.debug(processingTime(req, Duration.between(begin, LocalTime.now())));
    return res;
  }

  private Supplier<String> processingTime(ServerRequest req, Duration duration) {
    return () -> req + " Took " + duration.toMillis() + " ms. ";
  }
}
