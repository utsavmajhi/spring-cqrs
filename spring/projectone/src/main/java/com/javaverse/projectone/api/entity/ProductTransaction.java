package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.Entity;
import java.time.OffsetDateTime;

@Data
@Entity(name = "product_transactions")
@EqualsAndHashCode(callSuper = false)
public class ProductTransaction extends Common {

    private Long productId;
    private Long storeId;
    private boolean hasProduct;
    private boolean hasSpecialArea;
    private boolean hasMedia;
    private boolean hasPremium;
    private OffsetDateTime transactionDate;

}
