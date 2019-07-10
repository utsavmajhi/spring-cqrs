package com.javaverse.projectone.api.example;

import org.springframework.stereotype.Component;
import reactor.core.publisher.*;

import java.util.*;

@Component
public class ExampleRepo {

    static Map<String, Example> employeeData;


    static {
        employeeData = new HashMap<>();
        employeeData.put("1", new Example("1", "Employee 1", 1d));
        employeeData.put("2", new Example("2", "Employee 2", 2d));
        employeeData.put("3", new Example("3", "Employee 3", 3d));

    }

    public Mono<Example> get(String id) {
        System.out.println("get : " + id);
        return Mono.justOrEmpty(Optional.ofNullable(employeeData.get(id)));
    }

    public Flux<Example> findAll() {
        System.out.println("findAll");
        return Flux.fromIterable(employeeData.values());
    }

    public Mono<Example> update(Example employee) {
        Example existingEmployee = employeeData.get(employee.getId());
        if (existingEmployee != null) {
            existingEmployee.setName(employee.getName());
        }
        return Mono.justOrEmpty(existingEmployee);
    }

    public Mono<Example> save(Example employee) {
        employeeData.put(String.valueOf(employee.getId()), employee);
        return Mono.justOrEmpty(employeeData.get(String.valueOf(employee.getId())));
    }
}
