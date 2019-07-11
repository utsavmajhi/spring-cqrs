package com.javaverse.projectone.api.command;

import com.javaverse.projectone.api.event.StoreEvent;
import lombok.*;

public class StoreCommand {

    @Value
    @RequiredArgsConstructor
    @EqualsAndHashCode(callSuper = false)
    public static class Create {
        private final String code;
        private final String name;

        public StoreEvent.Created toEvent() {
            return new StoreEvent.Created(code, name);
        }
    }

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class Update extends CommonCommand<Long> {
        private final String code;
        private final String name;

        public Update(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }

        public StoreEvent.Updated toEvent() {
            return new StoreEvent.Updated(id, code, name);
        }
    }

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class Delete extends CommonCommand<Long> {
        public Delete(Long id) {
            super(id);
        }

        public StoreEvent.Deleted toEvent() {
            return new StoreEvent.Deleted(id);
        }
    }

}
