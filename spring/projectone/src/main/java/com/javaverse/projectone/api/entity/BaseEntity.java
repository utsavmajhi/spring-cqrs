package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;
import java.time.OffsetDateTime;

@Getter
@MappedSuperclass
@Setter(AccessLevel.PROTECTED)
@EntityListeners(value = Listener.class)
public abstract class BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter
    private Long id;

    private OffsetDateTime createdDate;
    private OffsetDateTime updatedDate;

    @Version
    private int version;

    @Setter
    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        ACTIVE, INACTIVE
    }

}
