package com.javaverse.projectone.api.handler;

import com.javaverse.projectone.api.command.CompanyCommand;
import com.javaverse.projectone.api.dto.CompanyDTO;
import com.javaverse.projectone.api.query.CompanyQuery;
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
public class CompanyHandler {

    private final QueryGateway queryGateway;
    private final CommandGateway commandGateway;

    public Mono<ServerResponse> find(ServerRequest req) {
        var mono = Mono.defer(() -> Mono.fromFuture(
                queryGateway.query(new CompanyQuery.Single(id(req)), ResponseTypes.instanceOf(CompanyDTO.class)))
        ).subscribeOn(Schedulers.parallel());
        return ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(mono, CompanyDTO.class)
                .switchIfEmpty(notFound().build());
    }

    public Mono<ServerResponse> findAll(ServerRequest req) {
        var flux = Flux.defer(() -> Flux.fromIterable(
                queryGateway.query(new CompanyQuery.AllActive(), ResponseTypes.multipleInstancesOf(CompanyDTO.class)).join()
        )).subscribeOn(Schedulers.parallel());
        return ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(flux, CompanyDTO.class)
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

    private Long id(ServerRequest req) {
        return Long.valueOf(req.pathVariable("id"));
    }

    private Mono<CompanyDTO> body(ServerRequest req) {
        return req.bodyToMono(CompanyDTO.class);
    }

    public Mono<ServerResponse> delete(ServerRequest req) {
        return Mono.defer(() -> Mono.justOrEmpty(id(req)))
                .doOnNext(id -> commandGateway.send(new CompanyCommand.Delete(id)))
                .subscribeOn(Schedulers.parallel())
                .flatMap(obj -> ok().build());
    }

}