package com.javaverse.projectone.api.event;

import lombok.*;

public class StoreEvent {
    private StoreEvent() {}

    @Value
    @RequiredArgsConstructor
    public static class Created {
        private final String code;
        private final String name;
        private final Long companyId;
        private final Double averageAmount;
        private final String phone;
        private final String address;
    }

    @Value
    @EqualsAndHashCode
    public static class Updated extends CommonEvent<Long> {
        private final String code;
        private final String name;
        private final Long companyId;
        private final Double averageAmount;
        private final String phone;
        private final String address;

        public Updated(Long id, String code, String name, Long companyId, Double averageAmount, String phone, String address) {
            super(id);
            this.code = code;
            this.name = name;
            this.companyId = companyId;
            this.averageAmount = averageAmount;
            this.phone = phone;
            this.address = address;
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
