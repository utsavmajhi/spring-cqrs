package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.ProductCommand;
import com.javaverse.projectone.api.entity.ProductEntity;
import lombok.*;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductDTO extends ProductEntity {

    public ProductCommand.Create toCommand() {
        return new ProductCommand.Create(getId(), getCode(), getName());
    }

}
