package com.javaverse.projectone.api.command;

import lombok.Value;

public class BranchCmd {

    @Value
    public static class CreateCmd extends BaseCmd<Long> {

        private final String code;
        private final String name;

        public CreateCmd(Long id, String code, String name) {
            super(id);
            this.code = code;
            this.name = name;
        }

//        public ProductEvent.Created toEvent() {
//            return new ProductEvent.Created(getCode(), getName());
//        }

    }

    @Value
    public static class DeleteCmd extends BaseCmd<Long> {

        public DeleteCmd(Long id) {
            super(id);
        }

//        public ProductEvent.Deleted toEvent() {
//            return new ProductEvent.Deleted(id);
//        }

    }

}
