package com.javaverse.projectone.cqrs.dto;

import com.javaverse.projectone.cqrs.command.ProductCmd;
import com.javaverse.projectone.cqrs.entity.ProductEntity;
import lombok.Data;

@Data
public class ProductDTO extends ProductEntity {

    public ProductCmd.CreateCmd toCommand() {
        return new ProductCmd.CreateCmd(getId(), getCode(), getName());
    }

}
