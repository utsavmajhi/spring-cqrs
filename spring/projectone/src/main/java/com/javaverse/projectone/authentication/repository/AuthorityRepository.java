package com.javaverse.projectone.authentication.repository;

import com.javaverse.projectone.authentication.entity.Authority;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityRepository extends CommonRepository<Authority, Long> {
}
