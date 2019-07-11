package com.javaverse.projectone.api.entity;

import lombok.*;

import javax.persistence.*;
import java.time.OffsetDateTime;
import java.util.stream.Stream;

@Getter
@MappedSuperclass
@Setter(AccessLevel.PROTECTED)
@EntityListeners(value = Listener.class)
public abstract class Common {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter
    private Long id;

    private OffsetDateTime createdDate;
    private OffsetDateTime updatedDate;

    @Version
    private short version;

    @Setter
    @Column(length = 1)
    private Status status;

    @RequiredArgsConstructor
    public enum Status {
        ACTIVE("A"),
        INACTIVE("I");

        @Getter
        private final String code;

        public static Product.Status toStatus(String code) {
            return Stream.of(Product.Status.values()).parallel()
                    .filter(status -> status.getCode().equalsIgnoreCase(code))
                    .findAny().orElseThrow(() -> new IllegalArgumentException("The code : " + code + " is illegal argument."));
        }
    }


}
