package com.javaverse.projectone.api.repository;

import com.javaverse.projectone.api.entity.User;
import com.javaverse.projectone.api.repository.CommonRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends CommonRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
