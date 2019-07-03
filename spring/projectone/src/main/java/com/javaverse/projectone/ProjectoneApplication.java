package com.javaverse.projectone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableReactiveMongoRepositories;
import org.springframework.web.reactive.config.EnableWebFlux;


@SpringBootApplication
@EnableReactiveMongoRepositories
public class ProjectoneApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProjectoneApplication.class, args);
    }

}
