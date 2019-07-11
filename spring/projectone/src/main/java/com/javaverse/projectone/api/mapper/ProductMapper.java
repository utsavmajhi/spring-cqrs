package com.javaverse.projectone.api.mapper;

import com.javaverse.projectone.api.dto.ProductDTO;
import com.javaverse.projectone.api.entity.Product;
import org.mapstruct.*;

import java.util.List;
import java.util.stream.Stream;

@Mapper(componentModel = "spring"
        , injectionStrategy = InjectionStrategy.CONSTRUCTOR
)
public interface ProductMapper {

    @Mappings(value = {
            @Mapping(target = "version", ignore = true)
    })
    ProductDTO map(Product e);

    @InheritInverseConfiguration
    Product map(ProductDTO d);

    List<ProductDTO> map(Stream<Product> products);

}
