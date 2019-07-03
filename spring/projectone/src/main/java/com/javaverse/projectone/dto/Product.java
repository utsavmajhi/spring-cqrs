package com.javaverse.projectone.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    String id;
    String name;
    Double price;
}
