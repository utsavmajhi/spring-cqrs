package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.ProductCmd;
import com.javaverse.projectone.api.entity.ProductEntity;
import lombok.*;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductDTO extends ProductEntity {

    public ProductCmd.CreateCmd toCommand() {
        return new ProductCmd.CreateCmd(getId(), getCode(), getName());
    }

}
