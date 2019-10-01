package com.javaverse.projectone.api.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

@Data
@EqualsAndHashCode
@Entity(name = "reasons")
@Table(indexes = {@Index(name = "reason_idx_transaction_id", columnList = "transactionId")})
public class Reason extends Common {

  private String message;
  private Long transactionId;
}
