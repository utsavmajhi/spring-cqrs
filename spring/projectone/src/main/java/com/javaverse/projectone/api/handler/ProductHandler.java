package com.javaverse.projectone.api.handler;

import com.javaverse.projectone.api.command.*;
import com.javaverse.projectone.api.dto.*;
import com.javaverse.projectone.api.query.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.axonframework.commandhandling.gateway.CommandGateway;
import org.axonframework.messaging.responsetypes.ResponseTypes;
import org.axonframework.queryhandling.QueryGateway;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.*;
import reactor.core.scheduler.Schedulers;

import static org.springframework.web.reactive.function.server.ServerResponse.*;

@Log4j2
@Component
@RequiredArgsConstructor
public class ProductHandler extends CommonHandler<ProductDTO> {

    private final QueryGateway queryGateway;
    private final CommandGateway commandGateway;
    private Class<ProductDTO> aClass = ProductDTO.class;

    public Mono<ServerResponse> find(ServerRequest req) {
        var mono = Mono.defer(() -> Mono.fromFuture(
                queryGateway.query(new ProductQuery.Single(id(req)), ResponseTypes.instanceOf(aClass)))
        ).subscribeOn(Schedulers.parallel());
        return ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(mono, aClass)
                .switchIfEmpty(notFound().build());
    }

    public Mono<ServerResponse> findAll(ServerRequest req) {
        var flux = Flux.defer(() -> Flux.fromIterable(
                queryGateway.query(new ProductQuery.AllActive(), ResponseTypes.multipleInstancesOf(aClass)).join()
        )).subscribeOn(Schedulers.parallel());
        return ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(flux, aClass)
                .switchIfEmpty(notFound().build());
    }

    public Mono<ServerResponse> save(ServerRequest req) {
        return Mono.defer(() -> body(req))
                .doOnNext(obj -> commandGateway.send(obj.toCommandCreate()))
                .subscribeOn(Schedulers.parallel())
                .flatMap(obj -> ok().build());
    }

    public Mono<ServerResponse> update(ServerRequest req) {
        return Mono.defer(() -> body(req))
                .doOnNext(obj -> commandGateway.send(obj.toCommandUpdate()))
                .subscribeOn(Schedulers.parallel())
                .flatMap(obj -> ok().build());
    }

    public Mono<ServerResponse> delete(ServerRequest req) {
        return Mono.defer(() -> Mono.justOrEmpty(id(req)))
                .doOnNext(id -> commandGateway.send(new ProductCommand.Delete(id)))
                .subscribeOn(Schedulers.parallel())
                .flatMap(obj -> ok().build());
    }

}
