package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;

@Data
@EqualsAndHashCode
@Entity(name = "reasons")
@Table(indexes = {
        @Index(name = "reason_idx_transaction_id", columnList = "transactionId")
})
public class Reason extends Common {

    private String message;
    private Long transactionId;

}
