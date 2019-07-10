package com.javaverse.projectone.base.service;

import com.javaverse.projectone.base.repository.ExampleRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService2 {

    private final ExampleRepo repo;

}
