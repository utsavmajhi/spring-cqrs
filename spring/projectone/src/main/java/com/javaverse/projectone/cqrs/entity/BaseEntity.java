package com.javaverse.projectone.cqrs.entity;

import lombok.*;

import javax.persistence.*;
import java.time.OffsetDateTime;

@Getter
@MappedSuperclass
@Setter(AccessLevel.PROTECTED)
//@EntityListeners(value = Listeners.class)
public abstract class BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter(AccessLevel.PUBLIC)
    private Long id;
    private OffsetDateTime createdDate;
    private OffsetDateTime updatedDate;

    @Version
    private int version;

    @Setter(AccessLevel.PUBLIC)
    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        ACTIVE, INACTIVE
    }
}
