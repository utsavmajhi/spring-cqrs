package com.javaverse.projectone.authentication.repository;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.NoRepositoryBean;

import javax.annotation.PostConstruct;
import java.io.Serializable;

@NoRepositoryBean
public interface CommonRepository<T, K extends Serializable> extends JpaRepository<T, K>, JpaSpecificationExecutor<T> {

    @PostConstruct
    default void postConstruct() {
    }

}
