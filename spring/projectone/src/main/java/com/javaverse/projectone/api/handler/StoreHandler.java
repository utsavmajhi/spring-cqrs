package com.javaverse.projectone.api.handler;

import com.javaverse.projectone.api.command.StoreCommand;
import com.javaverse.projectone.api.dto.StoreDTO;
import com.javaverse.projectone.api.query.StoreQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.axonframework.commandhandling.gateway.CommandGateway;
import org.axonframework.messaging.responsetypes.ResponseTypes;
import org.axonframework.queryhandling.QueryGateway;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static org.springframework.web.reactive.function.server.ServerResponse.notFound;
import static org.springframework.web.reactive.function.server.ServerResponse.ok;

@Log4j2
@Component
@RequiredArgsConstructor
public class StoreHandler extends CommonHandler<StoreDTO> {

    private final QueryGateway queryGateway;
    private final CommandGateway commandGateway;
    private Class<StoreDTO> aClass = StoreDTO.class;

    public Mono<ServerResponse> find(ServerRequest req) {
        var mono =
                Mono.defer(
                        () ->
                                Mono.fromFuture(
                                        queryGateway.query(
                                                new StoreQuery.Single(id(req)), ResponseTypes.instanceOf(aClass))))
                        .subscribeOn(Schedulers.parallel());
        return ok().contentType(MediaType.APPLICATION_JSON)
                .body(mono, aClass)
                .switchIfEmpty(notFound().build());
    }

    public Mono<ServerResponse> findAll(ServerRequest req) {
        var flux =
                Flux.defer(
                        () ->
                                Flux.fromIterable(
                                        queryGateway
                                                .query(
                                                        new StoreQuery.AllActive(),
                                                        ResponseTypes.multipleInstancesOf(aClass))
                                                .join()))
                        .subscribeOn(Schedulers.parallel());
        return ok().contentType(MediaType.APPLICATION_JSON)
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
                .doOnNext(id -> commandGateway.send(new StoreCommand.Delete(id)))
                .subscribeOn(Schedulers.parallel())
                .flatMap(obj -> ok().build());
    }
}
