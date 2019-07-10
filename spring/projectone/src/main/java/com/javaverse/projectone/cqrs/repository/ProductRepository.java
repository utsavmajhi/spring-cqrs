package com.javaverse.projectone.cqrs.repository;

import com.javaverse.projectone.cqrs.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.stream.Stream;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long> {

    Stream<ProductEntity> findAllByStatus(BaseEntity.Status status);

}
