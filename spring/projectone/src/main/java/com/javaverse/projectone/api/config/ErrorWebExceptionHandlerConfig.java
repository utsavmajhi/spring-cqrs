package com.javaverse.projectone.api.config;

import lombok.extern.log4j.Log4j2;
import org.springframework.boot.autoconfigure.web.ResourceProperties;
import org.springframework.boot.autoconfigure.web.reactive.error.AbstractErrorWebExceptionHandler;
import org.springframework.boot.web.reactive.error.ErrorAttributes;
import org.springframework.context.ApplicationContext;
import org.springframework.core.annotation.Order;
import org.springframework.http.codec.ServerCodecConfigurer;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.Mono;

import java.time.OffsetDateTime;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;
import static org.springframework.web.reactive.function.server.ServerResponse.status;

@Order(-2)
@Log4j2
@Component
public class ErrorWebExceptionHandlerConfig extends AbstractErrorWebExceptionHandler {

    public ErrorWebExceptionHandlerConfig(final ErrorAttributes errorAttributes, final ApplicationContext applicationContext, final ServerCodecConfigurer configurer) {
        super(errorAttributes, new ResourceProperties(), applicationContext);
        super.setMessageWriters(configurer.getWriters());
        super.setMessageReaders(configurer.getReaders());
    }

    @Override
    protected RouterFunction<ServerResponse> getRoutingFunction(final ErrorAttributes errorAttributes) {
        return route(RequestPredicates.all(), this::renderErrorResponse);
    }

    private Mono<ServerResponse> renderErrorResponse(final ServerRequest request) {

        final var error = getError(request);
        final var errorAttributes = super.getErrorAttributes(request, false);
//        errorAttributes.put(ErrorAttribute.TRACE_ID.value, tracer.traceId());
        if (error instanceof Exception) {
            log.debug("Caught an instance of: {}, err: {}", Exception.class, error);
//            final var errorStatus = ((DomainException) error).getStatus();
//            errorAttributes.replace("status", "123");
//            errorAttributes.replace("message", error.getMessage());
        }
        errorAttributes.replace("timestamp", OffsetDateTime.now());
        errorAttributes.remove("requestId");
//todo
        return status(BAD_REQUEST).contentType(APPLICATION_JSON).body(BodyInserters.fromObject(errorAttributes));
    }

}
