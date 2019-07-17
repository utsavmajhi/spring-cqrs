package com.javaverse.projectone.api.event;

import lombok.*;

public class UserEvent {
    private UserEvent() {}

    @Value
    @RequiredArgsConstructor
    public static class Created {
        private final String code;
        private final String name;
        private final String username;
        private final String password;
    }

    @Value
    @EqualsAndHashCode
    public static class Updated extends CommonEvent<Long> {
        private final String code;
        private final String name;
        private final String username;
        private final String password;

        public Updated(Long id, String code, String name, String username, String password) {
            super(id);
            this.code = code;
            this.name = name;
            this.username = username;
            this.password = password;
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
