package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;

@Data
@Entity(name = "stores")
@EqualsAndHashCode
@Table(indexes = {
        @Index(name = "stores_idx_status", columnList = "status")
})
public class Store extends Common {

    @Column(length = 13,unique = true)
    private String code;
    @Column(length = 30)
    private String name;

    private Long companyId;


}
