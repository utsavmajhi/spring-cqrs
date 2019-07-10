package com.javaverse.projectone.cqrs.aggregate;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.axonframework.modelling.command.AggregateIdentifier;
import org.axonframework.spring.stereotype.Aggregate;

import java.time.OffsetDateTime;

@Data
@Log4j2
@Aggregate
@NoArgsConstructor
public class BranchAggregator {

    @AggregateIdentifier
    private OffsetDateTime offsetDateTime;

}
