package com.javaverse.projectone.api.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.http.codec.multipart.FilePart;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.io.File;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/files")
public class FileController {

  @GetMapping("/ping")
  public Mono<String> ping() {
    return Mono.just("pong");
  }

  @GetMapping("/webhook")
  public Mono<String> webhook(@RequestBody String req) {
    System.out.println("request body from jira web hook");
    System.out.println(req);
    return Mono.just(req);
  }

  @ResponseBody
  @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
  public Mono file(@RequestPart("image") FilePart image, @RequestPart("name") String name) {

    System.out.println("name : " + name);
    System.out.println("file name : " + image.filename());
    File file = new File(image.filename());
    file.delete();
    System.out.println("before transfer " + file.length());
    image.transferTo(file);
    System.out.println("after transfer " + file.length());

    return Mono.empty();
  }
}
