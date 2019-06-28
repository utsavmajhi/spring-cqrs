package com.javaverse.projectone.repository;

import com.javaverse.projectone.dto.Product;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends ReactiveCrudRepository<Long, Product> {


}
