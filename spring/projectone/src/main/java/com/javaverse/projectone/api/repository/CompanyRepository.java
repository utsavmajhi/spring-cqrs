package com.javaverse.projectone.api.repository;

import com.javaverse.projectone.api.entity.*;
import org.springframework.stereotype.Repository;

import java.util.stream.Stream;

@Repository
public interface CompanyRepository extends CommonRepository<Company, Long> {

    Stream<Company> findAllByStatus(Common.Status status);

}
