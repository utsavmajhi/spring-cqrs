package com.javaverse.projectone.cqrs.event;

import com.javaverse.projectone.cqrs.entity.ProductEntity;
import lombok.Value;

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
