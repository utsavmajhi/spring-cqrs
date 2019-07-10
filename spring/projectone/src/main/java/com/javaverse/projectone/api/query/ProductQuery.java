package com.javaverse.projectone.api.query;

import lombok.Value;

public class ProductQuery {

    @Value
    public static class Single {
        private Long id;
    }

    @Value
    public static class AllActive {

    }

}
