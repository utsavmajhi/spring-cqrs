package com.javaverse.projectone.api.command;

import lombok.*;

public class CompanyCmd {

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class CreateCommand extends BaseCommand<Long> {

        private final String code;
        private final String name;

        public CreateCommand(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }

//        public ProductEvent.Created toEvent() {
//            return new ProductEvent.Created(getCode(), getName());
//        }

    }

    @Value
    @EqualsAndHashCode(callSuper = false)
    public static class DeleteCommand extends BaseCommand<Long> {

        public DeleteCommand(Long id) {
            super(id);
        }

//        public ProductEvent.Deleted toEvent() {
//            return new ProductEvent.Deleted(id);
//        }

    }

}
