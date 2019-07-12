package com.javaverse.projectone.api.event;

import lombok.*;

public class StoreEvent {
    private StoreEvent() {}

    @Value
    @RequiredArgsConstructor
    public static class Created {
        private final String code;
        private final String name;
    }

    @Value
    @EqualsAndHashCode
    public static class Updated extends CommonEvent<Long> {
        private final String code;
        private final String name;

        public Updated(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }
    }

    @Value
    @EqualsAndHashCode
    public static class Deleted extends CommonEvent<Long> {
        public Deleted(Long id) {
            super(id);
        }
    }

}
