package com.javaverse.projectone.api.service;

import com.javaverse.projectone.api.dto.ProductDTO;
import com.javaverse.projectone.api.entity.*;
import com.javaverse.projectone.api.event.ProductEvent;
import com.javaverse.projectone.api.query.ProductQuery;
import com.javaverse.projectone.api.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.axonframework.eventhandling.EventHandler;
import org.axonframework.queryhandling.QueryHandler;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository repo;

    @EventHandler
    public void on(ProductEvent.Created event) {
        System.out.println("EventHandler CreatedEvent");
        ProductEntity entity = new ProductEntity();
        entity.setCode(event.getCode());
        entity.setName(event.getName());
        entity.setStatus(event.getStatus());
        repo.save(entity);
    }

    @EventHandler
    public void on(ProductEvent.Deleted event) {
        System.out.println("EventHandler DeletedEvent : " + event.getId());
        repo.deleteById(event.getId());
    }

    @QueryHandler
    public ProductDTO on(ProductQuery.Single query) {
        return repo.findById(query.getId())
                .map(toDTO()).orElseThrow();
    }

    @QueryHandler
    public List<ProductDTO> on(ProductQuery.AllActive query) {
        return repo.findAllByStatus(BaseEntity.Status.ACTIVE)
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
