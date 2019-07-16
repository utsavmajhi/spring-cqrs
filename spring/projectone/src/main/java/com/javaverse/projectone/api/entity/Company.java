package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;

@Data
@EqualsAndHashCode
@Entity(name = "companies")
@Table(indexes = {
        @Index(name = "companies_idx_status", columnList = "status")
})
public class Company extends Common {

    @Column(length = 13,unique = true)
    private String code;
    @Column(length = 30)
    private String name;

}
