package com.javaverse.projectone.api.command;

import com.javaverse.projectone.api.event.CompanyEvent;
import lombok.EqualsAndHashCode;
import lombok.Value;

public class CompanyCommand {

    private CompanyCommand() {
    }

    @Value
    @EqualsAndHashCode
    public static class Create extends CommonCommand<Long> {
        private final String code;
        private final String name;

        public Create(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }

        public CompanyEvent.Created toEvent() {
            return new CompanyEvent.Created(code, name);
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

        public CompanyEvent.Updated toEvent() {
            return new CompanyEvent.Updated(id, code, name);
        }
    }

    @Value
    @EqualsAndHashCode
    public static class Delete extends CommonCommand<Long> {
        public Delete(Long id) {
            super(id);
        }

        public CompanyEvent.Deleted toEvent() {
            return new CompanyEvent.Deleted(id);
        }
    }
}
