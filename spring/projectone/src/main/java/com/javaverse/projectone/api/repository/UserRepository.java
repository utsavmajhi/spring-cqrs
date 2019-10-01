package com.javaverse.projectone.api.repository;

import com.javaverse.projectone.api.entity.Common;
import com.javaverse.projectone.api.entity.User;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.stream.Stream;

@Repository
public interface UserRepository extends CommonRepository<User, Long> {
  Optional<User> findByUsername(String username);

  Stream<User> findAllByStatus(Common.Status status);
}
