package com.javaverse.projectone.authentication.repository;

import com.javaverse.projectone.authentication.entity.User;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends CommonRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
