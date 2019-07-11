package com.javaverse.projectone.api.event;

import lombok.*;

@Getter
@RequiredArgsConstructor
public abstract class CommonEvent<T> {

    public final T id;

}
