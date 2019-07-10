package com.javaverse.projectone.api.aggregate;

import com.javaverse.projectone.api.command.ProductCommand;
import com.javaverse.projectone.api.event.ProductEvent;
import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.axonframework.commandhandling.CommandHandler;
import org.axonframework.eventsourcing.EventSourcingHandler;
import org.axonframework.modelling.command.AggregateIdentifier;
import org.axonframework.spring.stereotype.Aggregate;

import java.time.OffsetDateTime;

import static org.axonframework.modelling.command.AggregateLifecycle.apply;

@Data
@Log4j2
@Aggregate
@NoArgsConstructor
public class ProductAggregator {

    @AggregateIdentifier
    private OffsetDateTime offsetDateTime;

    /*Create*/
    @CommandHandler
    // use constructor only for 1st create
    public ProductAggregator(ProductCommand.Create cmd) {
        log.info(() -> "CommandHandler : Create : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    /*Delete*/
    @CommandHandler
    public ProductAggregator(ProductCommand.Delete cmd) {
        log.info(() -> "CommandHandler : Delete : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    @EventSourcingHandler
    private void on(ProductEvent.Created event) {
        log.info(() -> "EventSourcingHandler : CreatedEvent : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

    @EventSourcingHandler
    private void on(ProductEvent.Deleted event) {
        log.info(() -> "EventSourcingHandler : DeletedEvent : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

}
