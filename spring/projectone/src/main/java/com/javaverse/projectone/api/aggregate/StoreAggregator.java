package com.javaverse.projectone.api.aggregate;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.axonframework.modelling.command.AggregateIdentifier;
import org.axonframework.spring.stereotype.Aggregate;

import java.time.OffsetDateTime;

@Data
@Log4j2
@Aggregate
@NoArgsConstructor
public class StoreAggregator {

    @AggregateIdentifier
    private OffsetDateTime offsetDateTime;

}