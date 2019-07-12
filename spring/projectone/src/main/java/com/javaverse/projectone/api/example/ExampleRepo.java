package com.javaverse.projectone.api.example;

import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class ExampleRepo {

    private ExampleRepo() {}

    static Map<String, Example> employeeData;


    static {
        employeeData = new HashMap<>();
        employeeData.put("1", new Example("1", "Employee 1", 1d));
        employeeData.put("2", new Example("2", "Employee 2", 2d));
        employeeData.put("3", new Example("3", "Employee 3", 3d));

    }

}
