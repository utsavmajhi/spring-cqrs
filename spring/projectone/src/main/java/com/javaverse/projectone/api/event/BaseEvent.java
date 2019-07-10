package com.javaverse.projectone.api.event;

import lombok.*;

@Getter
@RequiredArgsConstructor
public abstract class BaseEvent<T> {

    public final T id;

}
