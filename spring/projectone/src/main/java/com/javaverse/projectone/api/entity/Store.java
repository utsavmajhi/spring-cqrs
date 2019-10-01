package com.javaverse.projectone.api.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

@Data
@Entity(name = "stores")
@EqualsAndHashCode
@Table(indexes = {@Index(name = "stores_idx_status", columnList = "status")})
public class Store extends Common {

  @Column(length = 13, unique = true)
  private String code;

  @Column(length = 30)
  private String name;

  private Long companyId;
  private Double averageAmount;
  private String phone;
  private String address;
}
