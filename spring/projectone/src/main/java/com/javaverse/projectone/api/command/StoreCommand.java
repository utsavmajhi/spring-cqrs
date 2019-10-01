package com.javaverse.projectone.api.command;

import com.javaverse.projectone.api.event.StoreEvent;
import lombok.EqualsAndHashCode;
import lombok.Value;

public class StoreCommand {

    private StoreCommand() {
    }

    @Value
    @EqualsAndHashCode
    public static class Create extends CommonCommand<Long> {
        private final String code;
        private final String name;
        private final Long companyId;
        private final Double averageAmount;
        private final String phone;
        private final String address;

        public Create(
                Long id,
                String code,
                String name,
                Long companyId,
                Double averageAmount,
                String phone,
                String address) {
            super(id);
            this.code = code;
            this.name = name;
            this.companyId = companyId;
            this.averageAmount = averageAmount;
            this.phone = phone;
            this.address = address;
        }

        public StoreEvent.Created toEvent() {
            return new StoreEvent.Created(code, name, companyId, averageAmount, phone, address);
        }
    }

    @Value
    @EqualsAndHashCode
    public static class Update extends CommonCommand<Long> {
        private final String code;
        private final String name;
        private final Long companyId;
        private final Double averageAmount;
        private final String phone;
        private final String address;

        public Update(
                Long id,
                String code,
                String name,
                Long companyId,
                Double averageAmount,
                String phone,
                String address) {
            super(id);
            this.code = code;
            this.name = name;
            this.companyId = companyId;
            this.averageAmount = averageAmount;
            this.phone = phone;
            this.address = address;
        }

        public StoreEvent.Updated toEvent() {
            return new StoreEvent.Updated(id, code, name, companyId, averageAmount, phone, address);
        }
    }

    @Value
    @EqualsAndHashCode
    public static class Delete extends CommonCommand<Long> {
        public Delete(Long id) {
            super(id);
        }

        public StoreEvent.Deleted toEvent() {
            return new StoreEvent.Deleted(id);
        }
    }
}
