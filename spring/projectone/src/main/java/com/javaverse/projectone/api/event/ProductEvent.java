package com.javaverse.projectone.api.event;

import com.javaverse.projectone.api.entity.ProductEntity;
import lombok.*;

public class ProductEvent {

    @Value
    public static class Created extends ProductEntity {
        public Created(String code, String name) {
            setStatus(Status.ACTIVE);
            setCode(code);
            setName(name);
        }

    }

    @Value
    public static class Deleted {
        private final Long id;

        public Deleted(Long id) {
            this.id = id;
        }
    }

}
