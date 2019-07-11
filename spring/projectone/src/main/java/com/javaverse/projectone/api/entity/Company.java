package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;

@Data
@Entity(name = "companies")
@EqualsAndHashCode(callSuper = false)
public class Company extends Common {

    @Column(length = 13)
    private String code;
    @Column(length = 30)
    private String name;

}
