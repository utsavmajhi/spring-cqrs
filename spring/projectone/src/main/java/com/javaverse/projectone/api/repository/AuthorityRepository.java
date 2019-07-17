package com.javaverse.projectone.api.repository;

import com.javaverse.projectone.api.entity.Authority;
import com.javaverse.projectone.api.repository.CommonRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityRepository extends CommonRepository<Authority, Long> {
}
