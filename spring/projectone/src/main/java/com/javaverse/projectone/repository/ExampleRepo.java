package com.javaverse.projectone.repository;

import com.javaverse.projectone.dto.Product;
import org.springframework.stereotype.Component;
import reactor.core.publisher.*;

import java.util.*;

@Component
public class ExampleRepo {

    static Map<String, Product> employeeData;


    static {
        employeeData = new HashMap<>();
        employeeData.put("1", new Product(1, "Employee 1", 1d));
        employeeData.put("2", new Product(2, "Employee 2", 2d));
        employeeData.put("3", new Product(3, "Employee 3", 3d));

    }

    public Mono<Product> get(String id) {
        System.out.println("get : " + id);
        return Mono.justOrEmpty(Optional.ofNullable(employeeData.get(id)));
    }

    public Flux<Product> findAll() {
        System.out.println("findAll");
        return Flux.fromIterable(employeeData.values());
    }

    public Mono<Product> update(Product employee) {
        Product existingEmployee = employeeData.get(employee.getId());
        if (existingEmployee != null) {
            existingEmployee.setName(employee.getName());
        }
        return Mono.justOrEmpty(existingEmployee);
    }


    public Mono<Product> save(Product employee) {
        employeeData.put(String.valueOf(employee.getId()), employee);
        return Mono.justOrEmpty(employeeData.get(String.valueOf(employee.getId())));
    }

}
