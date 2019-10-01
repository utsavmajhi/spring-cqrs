package com.javaverse.projectone.api.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

@Data
@EqualsAndHashCode
@Entity(name = "companies")
@Table(indexes = {@Index(name = "companies_idx_status", columnList = "status")})
public class Company extends Common {

  @Column(length = 13, unique = true)
  private String code;

  @Column(length = 30)
  private String name;
}
