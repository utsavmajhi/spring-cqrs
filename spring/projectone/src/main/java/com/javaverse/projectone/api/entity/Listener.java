package com.javaverse.projectone.api.entity;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.time.OffsetDateTime;

class Listener<T extends Common> {

  @PrePersist
  private void prePersist(T e) {
    e.setCreatedDate(OffsetDateTime.now());
  }

  @PreUpdate
  private void preUpdate(T e) {
    e.setUpdatedDate(OffsetDateTime.now());
  }
}
