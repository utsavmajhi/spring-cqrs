package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.ProductCommand;
import com.javaverse.projectone.api.entity.Product;
import lombok.*;

@Data
@ToString
@EqualsAndHashCode
public class ProductDTO extends Product {

    public ProductCommand.Create toCommand() {
        System.out.println("ProductCommand.Create toCommand");
        System.out.println(this);
        return new ProductCommand.Create(getId(), getCode(), getName());
    }

}
