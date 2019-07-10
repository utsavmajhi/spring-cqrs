package com.javaverse.projectone.api.command;

import com.javaverse.projectone.api.event.ProductEvent;
import lombok.*;

public class ProductCommand {

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class Create extends BaseCommand<Long> {

        private final String code;
        private final String name;

        public Create(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }

        public ProductEvent.Created toEvent() {
            return new ProductEvent.Created(getCode(), getName());
        }

    }

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class Delete extends BaseCommand<Long> {

        public Delete(Long id) {
            super(id);
        }

        public ProductEvent.Deleted toEvent() {
            return new ProductEvent.Deleted(id);
        }

    }

}
