package com.javaverse.projectone.service;


import com.javaverse.projectone.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ExampleRepo repo;

}
