package com.javaverse.projectone.api.event;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public abstract class CommonEvent<T> {

  public final T id;
}
