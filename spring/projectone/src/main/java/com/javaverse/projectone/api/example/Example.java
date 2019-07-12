package com.javaverse.projectone.api.example;

public class Example {
    String id;
    String name;
    Double price;

    public Example(String id, String name, Double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public Example() {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

}
