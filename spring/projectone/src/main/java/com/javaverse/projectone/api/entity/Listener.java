package com.javaverse.projectone.api.entity;

import javax.persistence.*;
import java.time.OffsetDateTime;

class Listener<T extends BaseEntity> {

    @PrePersist
    private void prePersist(T e) {
        e.setCreatedDate(OffsetDateTime.now());
    }

    @PreUpdate
    private void preUpdate(T e) {
        e.setUpdatedDate(OffsetDateTime.now());
    }

}
