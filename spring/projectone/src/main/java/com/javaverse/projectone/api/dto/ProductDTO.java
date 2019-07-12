package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.ProductCommand;
import com.javaverse.projectone.api.entity.Product;
import lombok.*;

@Data
@ToString
@EqualsAndHashCode
public class ProductDTO extends Product {

    public ProductCommand.Create toCommandCreate() {
        return new ProductCommand.Create(getId(), getCode(), getName());
    }

    public ProductCommand.Update toCommandUpdate() {
        return new ProductCommand.Update(getId(), getCode(), getName());
    }

}
