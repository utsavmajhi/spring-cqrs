package com.javaverse.projectone.api.entity;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.OffsetDateTime;
import java.util.stream.Stream;

@Getter
@Setter
@MappedSuperclass
@EntityListeners(value = Listener.class)
public abstract class Common {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private OffsetDateTime createdDate;
  private OffsetDateTime updatedDate;

  @Version
  @Getter(AccessLevel.PRIVATE)
  private short version;

  @Column(length = 1)
  private Status status;

  @Getter
  @RequiredArgsConstructor
  public enum Status {
    ACTIVE("A"),
    INACTIVE("I");
    private final String code;

    public static Product.Status toStatus(String code) {
      return Stream.of(Product.Status.values())
          .parallel()
          .filter(status -> status.getCode().equalsIgnoreCase(code))
          .findAny()
          .orElseThrow(
              () -> new IllegalArgumentException("The code : " + code + " is illegal argument."));
    }
  }
}
