package com.javaverse.projectone.api.service;

import com.javaverse.projectone.api.dto.ProductDTO;
import com.javaverse.projectone.api.entity.*;
import com.javaverse.projectone.api.event.ProductEvent;
import com.javaverse.projectone.api.mapper.ProductMapper;
import com.javaverse.projectone.api.query.ProductQuery;
import com.javaverse.projectone.api.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.axonframework.eventhandling.EventHandler;
import org.axonframework.queryhandling.QueryHandler;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository repo;
    private final ProductMapper mapper;

    @EventHandler
    public void on(ProductEvent.Created event) {
        Product product = new Product();
        product.setCode(event.getCode());
        product.setName(event.getName());
        product.setStatus(Common.Status.ACTIVE);
        repo.save(product);
    }

    @EventHandler
    public void on(ProductEvent.Updated event) {
        Product product = repo.findById(event.getId()).orElseThrow();
        product.setCode(event.getCode());
        product.setName(event.getName());
        repo.save(product);
    }

    @EventHandler
    public void on(ProductEvent.Deleted event) {
        repo.deleteById(event.getId());
    }

    @QueryHandler
    public ProductDTO on(ProductQuery.Single query) {
        return mapper.map(repo.findById(query.getId()).orElseThrow());
    }

    @QueryHandler
    public List<ProductDTO> on(ProductQuery.AllActive query) {
        return mapper.map(repo.findAllByStatus(Common.Status.ACTIVE));
    }

}
