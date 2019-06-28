package com.javaverse.projectone.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    long id;
    String name;
    Double price;
}
