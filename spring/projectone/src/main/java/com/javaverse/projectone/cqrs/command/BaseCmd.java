package com.javaverse.projectone.cqrs.command;

import lombok.RequiredArgsConstructor;
import org.axonframework.modelling.command.TargetAggregateIdentifier;

@RequiredArgsConstructor
public abstract class BaseCmd<T> {

    @TargetAggregateIdentifier
    public final T id;

}
