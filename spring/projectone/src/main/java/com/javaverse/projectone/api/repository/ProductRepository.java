package com.javaverse.projectone.api.repository;

import com.javaverse.projectone.api.entity.Common;
import com.javaverse.projectone.api.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.stream.Stream;

@Repository
public interface ProductRepository extends CommonRepository<Product, Long> {

    Stream<Product> findAllByStatus(Common.Status status);
}
