package com.javaverse.projectone.handler;

import com.javaverse.projectone.dto.Product;
import com.javaverse.projectone.repository.ExampleRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.*;
import reactor.core.publisher.*;
import reactor.core.scheduler.Schedulers;

import java.time.*;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8;
import static org.springframework.web.reactive.function.server.ServerResponse.ok;

@Log4j2
@Component
@RequiredArgsConstructor
public class ProductHandler {

    private final ExampleRepo repo;


    public Mono<ServerResponse> events(ServerRequest req) {
        Flux<String> events = Flux.<String>generate(sink -> sink.next(ZonedDateTime.now().toString())).delayElements(Duration.ofSeconds(1));
        return ServerResponse.ok().contentType(MediaType.TEXT_EVENT_STREAM).body(events, String.class);
    }


    public Mono<ServerResponse> findAll(ServerRequest req) {
        return ok().contentType(APPLICATION_JSON_UTF8).body(repo.findAll(), Product.class);
    }


    public Mono<ServerResponse> save(ServerRequest req) {
        return ok().contentType(MediaType.APPLICATION_STREAM_JSON)
                .body(Mono.defer(() -> req.bodyToMono(Product.class)).log().doOnNext(repo::save).subscribeOn(Schedulers.parallel()), Product.class);
    }


    public Mono<ServerResponse> update(ServerRequest req) {
        return ok().contentType(MediaType.APPLICATION_STREAM_JSON)
                .body(Mono.defer(() -> req.bodyToMono(Product.class)).log().doOnNext(repo::update).subscribeOn(Schedulers.parallel()), Product.class);
    }


    public Mono<ServerResponse> get(ServerRequest req) {
        System.out.println("get : " + req.headers().asHttpHeaders().getFirst("X-Correlation-ID"));
        return ok().contentType(MediaType.APPLICATION_STREAM_JSON)
                .lastModified(ZonedDateTime.now())
                .body(Mono.defer(() -> repo.get(req.pathVariable("id"))).log().subscribeOn(Schedulers.parallel()), Product.class)
                .switchIfEmpty(ServerResponse.notFound().build());
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


