package com.javaverse.projectone.cqrs.entity;

import lombok.Data;

import javax.persistence.Entity;

@Data
@Entity(name = "branches")
public class BranchEntity extends BaseEntity {

    private String code;
    private String name;

}
