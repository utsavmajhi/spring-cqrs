package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;

@Data
@Entity(name = "products")
@EqualsAndHashCode
public class Product extends Common {

    @Column(length = 13)
    private String code;
    @Column(length = 30)
    private String name;

}
