package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;
import java.time.*;

@Data
@EqualsAndHashCode
@Entity(name = "product_transactions")
@Table(indexes = {
        @Index(name = "product_transaction_idx_date", columnList = "date")
})
public class ProductTransaction extends Common {

    private Long productId;
    private Long storeId;
    private boolean hasProduct;
    private boolean hasSpecialArea;
    private boolean hasMedia;
    private boolean hasPremium;
    private LocalDate date;



}
