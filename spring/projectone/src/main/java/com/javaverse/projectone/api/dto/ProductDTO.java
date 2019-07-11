package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.ProductCommand;
import com.javaverse.projectone.api.entity.Product;
import lombok.*;
import lombok.extern.log4j.Log4j2;

@Data
@ToString
@Log4j2
@EqualsAndHashCode
public class ProductDTO extends Product {

    public ProductCommand.Create toCommandCreate() {
        log.info(() -> "ProductCommand.Create toCommandCreate : " + this);
        return new ProductCommand.Create(getId(), getCode(), getName());
    }

    public ProductCommand.Update toCommandUpdate() {
        log.info(() -> "ProductCommand.Create toCommandUpdate : " + this);
        return new ProductCommand.Update(getId(), getCode(), getName());
    }

}
