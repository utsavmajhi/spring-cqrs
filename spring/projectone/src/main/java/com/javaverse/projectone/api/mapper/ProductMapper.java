package com.javaverse.projectone.api.mapper;

import com.javaverse.projectone.api.dto.ProductDTO;
import com.javaverse.projectone.api.entity.Product;
import com.javaverse.projectone.api.event.ProductEvent;
import org.mapstruct.*;

import java.util.List;
import java.util.stream.Stream;

@Mapper(injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface ProductMapper {

    @Mappings(value = {@Mapping(target = "version", ignore = true)})
    ProductDTO map(Product entity);

    @InheritInverseConfiguration
    Product map(ProductDTO dto);

    List<ProductDTO> map(Stream<Product> entities);

    @Mappings(value = {@Mapping(target = "version", ignore = true)})
    Product map(ProductEvent.Created event);

    @Mappings(value = {@Mapping(target = "version", ignore = true)})
    Product map(ProductEvent.Updated event);
}
