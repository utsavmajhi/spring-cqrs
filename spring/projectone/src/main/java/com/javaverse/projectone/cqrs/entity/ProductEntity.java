package com.javaverse.projectone.cqrs.entity;

import lombok.Data;

import javax.persistence.Entity;

@Data
@Entity(name = "products")
public class ProductEntity extends BaseEntity {

    private String code;
    private String name;

}
