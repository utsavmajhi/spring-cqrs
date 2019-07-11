package com.javaverse.projectone.api.command;

import com.javaverse.projectone.api.event.ProductEvent;
import lombok.*;

public class ProductCommand {

    @Value
    @RequiredArgsConstructor
    @EqualsAndHashCode
    public static class Create {
        private final String code;
        private final String name;

        public ProductEvent.Created toEvent() {
            return new ProductEvent.Created(code, name);
        }
    }

    @Value
    @EqualsAndHashCode
    public static class Update extends CommonCommand<Long> {
        private final String code;
        private final String name;

        public Update(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }

        public ProductEvent.Updated toEvent() {
            return new ProductEvent.Updated(id, code, name);
        }
    }

    @Value
    @EqualsAndHashCode
    public static class Delete extends CommonCommand<Long> {
        public Delete(Long id) {
            super(id);
        }

        public ProductEvent.Deleted toEvent() {
            return new ProductEvent.Deleted(id);
        }
    }

}
