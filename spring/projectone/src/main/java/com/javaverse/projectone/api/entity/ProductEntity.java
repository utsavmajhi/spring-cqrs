package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.Entity;

@Data
@Entity(name = "products")
@EqualsAndHashCode(callSuper = false)
public class ProductEntity extends BaseEntity {

    private String code;
    private String name;

}
