package com.javaverse.projectone.api.example;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Example {
    String id;
    String name;
    Double price;
}
