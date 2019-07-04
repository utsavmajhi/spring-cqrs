package com.javaverse.projectone.business.service;

import com.javaverse.projectone.business.repository.ExampleRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ExampleRepo repo;

}
