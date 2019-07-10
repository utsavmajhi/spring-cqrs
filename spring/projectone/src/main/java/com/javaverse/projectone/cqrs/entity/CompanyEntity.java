package com.javaverse.projectone.cqrs.entity;

import lombok.Data;

import javax.persistence.Entity;

@Data
@Entity(name = "companies")
public class CompanyEntity extends BaseEntity {

    private String code;
    private String name;

}
