package com.javaverse.projectone.api.command;

import lombok.RequiredArgsConstructor;
import org.axonframework.modelling.command.TargetAggregateIdentifier;

@RequiredArgsConstructor
public abstract class CommonCommand<T> {

    @TargetAggregateIdentifier
    public final T id;

}
