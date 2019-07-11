package com.javaverse.projectone.api.handler;

import com.javaverse.projectone.api.dto.ProductDTO;
import com.javaverse.projectone.api.example.*;
import com.javaverse.projectone.api.query.ProductQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.axonframework.commandhandling.gateway.CommandGateway;
import org.axonframework.messaging.responsetypes.ResponseTypes;
import org.axonframework.queryhandling.QueryGateway;
import org.reactivestreams.Publisher;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.*;
import reactor.core.scheduler.Schedulers;

import java.time.*;

import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.web.reactive.function.server.ServerResponse.*;

@Log4j2
@Component
@RequiredArgsConstructor
public class ProductHandler {

    private final ExampleRepo repo;

    private final CommandGateway commandGateway;
    private final QueryGateway queryGateway;

    public Mono<ServerResponse> events(ServerRequest req) {
        Flux<String> events = Flux.<String>generate(sink -> sink.next(ZonedDateTime.now().toString())).delayElements(Duration.ofSeconds(1));
        return ServerResponse.ok().contentType(MediaType.TEXT_EVENT_STREAM).body(events, String.class);
    }

    public Mono<ServerResponse> findAll(ServerRequest req) {
        return ok().contentType(APPLICATION_JSON).body(repo.findAll(), Example.class);
    }

    private static Mono<ServerResponse> defaultReadResponse(Publisher<String> msg) {
        return ServerResponse
                .ok()
                .contentType(APPLICATION_JSON)
                .body(Mono.just("s a v e !"), String.class);
    }

//    public Mono<ServerResponse> create(ServerRequest req) {
//        Flux<String> flux = req
//                .bodyToFlux(ProductDTO.class)
//                .doOnNext(dto -> commandGateway.send(dto.toCommand())  );
//        return defaultReadResponse(flux);
//    }

    public static void main(String[] args) {

    }

    public Mono<ServerResponse> test(ServerRequest request) {
        Mono<String> requestMono = request.bodyToMono(String.class);
        Mono<String> mapped = requestMono.map(name -> "Hello " + name)
                .doOnSuccess(s -> System.out.println(s));
        return ServerResponse.ok().body(mapped, String.class);
    }

//    public Mono<ServerResponse> save(ServerRequest req) {
//        Mono.defer(() -> req.bodyToMono(ProductDTO.class)
//                .doOnNext(dto -> commandGateway.send(dto.toCommand()))
//                .subscribeOn(Schedulers.parallel()));
//        return ok()
//                .contentType(APPLICATION_JSON)
//                .body(Mono.just("s a v e !"), String.class)
//                .switchIfEmpty(badRequest().build());
//
//    }

    public Mono<ServerResponse> update(ServerRequest req) {
        return ok().contentType(MediaType.APPLICATION_STREAM_JSON)
                .body(Mono.defer(() -> req.bodyToMono(Example.class)).log().doOnNext(repo::update).subscribeOn(Schedulers.parallel()), Example.class);
    }

    public Mono<ServerResponse> save(ServerRequest req) {
        return ServerResponse
                .ok()
                .contentType(MediaType.APPLICATION_JSON)
                .lastModified(ZonedDateTime.now())
                .body(Mono.defer(() -> req.bodyToMono(ProductDTO.class))
                        .doOnNext(dto -> commandGateway.send(dto.toCommand())), Void.class)
                .switchIfEmpty(badRequest().build());
    }

    public Mono<ServerResponse> get(ServerRequest req) {
        var mono = Mono.defer(() -> Mono.fromFuture(queryGateway.query(new ProductQuery.Single(Long.valueOf(req.pathVariable("id"))), ResponseTypes.instanceOf(ProductDTO.class))))
                .subscribeOn(Schedulers.parallel());
        return ok()
                .contentType(MediaType.APPLICATION_JSON)
                .lastModified(ZonedDateTime.now())
                .body(mono, ProductDTO.class)
                .switchIfEmpty(notFound().build());
    }

    public Mono<ServerResponse> delete(ServerRequest req) {
        System.out.println(req.pathVariable("id"));
        return ok().body(System.out::println, Void.class).switchIfEmpty(ServerResponse.notFound().build());
    }

//    public Mono<ServerResponse> delete(ServerRequest serverRequest) {
//        return this.userRepository.findById(serverRequest.pathVariable("id"))
//                .flatMap(user -> ServerResponse
//                        .noContent()
//                        .build(this.userRepository.delete(user)))
//                .switchIfEmpty(ServerResponse.notFound().build());
//    }

}
