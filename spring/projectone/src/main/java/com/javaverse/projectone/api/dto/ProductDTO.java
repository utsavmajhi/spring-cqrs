package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.ProductCommand;
import com.javaverse.projectone.api.entity.Product;
import lombok.*;

@Data
@EqualsAndHashCode
public class ProductDTO extends Product {

    public ProductCommand.Create toCommand() {
        return new ProductCommand.Create(getCode(), getName());
    }

}
