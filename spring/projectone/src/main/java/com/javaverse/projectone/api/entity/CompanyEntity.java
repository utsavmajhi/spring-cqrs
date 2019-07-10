package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.Entity;

@Data
@Entity(name = "companies")
@EqualsAndHashCode(callSuper = false)
public class CompanyEntity extends BaseEntity {

    private String code;
    private String name;

}
