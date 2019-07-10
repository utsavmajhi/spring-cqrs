package com.javaverse.projectone.cqrs.service.product;

import com.javaverse.projectone.cqrs.dto.ProductDTO;
import com.javaverse.projectone.cqrs.entity.*;
import com.javaverse.projectone.cqrs.query.ProductQuery;
import com.javaverse.projectone.cqrs.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.axonframework.queryhandling.QueryHandler;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service("product-query-service")
@RequiredArgsConstructor
public class QueryService {
    private final ProductRepository productRepository;

    @QueryHandler
    public ProductDTO on(ProductQuery.Single query) {
        return productRepository.findById(query.getId())
                .map(toDTO()).orElseThrow();
    }

    @QueryHandler
    public List<ProductDTO> on(ProductQuery.AllActive query) {
        return productRepository.findAllByStatus(BaseEntity.Status.ACTIVE)
                .map(toDTO()).collect(Collectors.toList());
    }

    private Function<ProductEntity, ProductDTO> toDTO() {
        return e -> {
            ProductDTO dto = new ProductDTO();
            dto.setId(e.getId());
            dto.setCode(e.getCode());
            dto.setName(e.getName());
            dto.setStatus(e.getStatus());
            return dto;
        };
    }

}
