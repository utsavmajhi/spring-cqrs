package com.javaverse.projectone.api.repository;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

@NoRepositoryBean
public interface CommonRepository<T, K extends Serializable> extends JpaRepository<T, K>, JpaSpecificationExecutor<T> {

}
