package com.javaverse.projectone.api.event;

import lombok.*;

public class ProductEvent {

    @Value
    public static class Created {
        private final String code;
        private final String name;

        public Created(String code, String name) {
            this.code = code;
            this.name = name;
        }

    }

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class Deleted extends BaseEvent<Long> {

        public Deleted(Long id) {
            super(id);
        }
    }

}
