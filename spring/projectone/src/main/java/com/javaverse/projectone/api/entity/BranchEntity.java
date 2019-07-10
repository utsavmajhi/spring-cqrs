package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.Entity;

@Data
@Entity(name = "branches")
@EqualsAndHashCode(callSuper = false)
public class BranchEntity extends BaseEntity {

    private String code;
    private String name;

}
