package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;

@Data
@Entity(name = "stores")
@EqualsAndHashCode
public class Store extends Common {

    @Column(length = 13)
    private String code;
    @Column(length = 30)
    private String name;

}
