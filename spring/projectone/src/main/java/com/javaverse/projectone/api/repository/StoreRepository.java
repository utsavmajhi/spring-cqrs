package com.javaverse.projectone.api.repository;

import com.javaverse.projectone.api.entity.Common;
import com.javaverse.projectone.api.entity.Store;
import org.springframework.stereotype.Repository;

import java.util.stream.Stream;

@Repository
public interface StoreRepository extends CommonRepository<Store, Long> {

    Stream<Store> findAllByStatus(Common.Status status);
}
