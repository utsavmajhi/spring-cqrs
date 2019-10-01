package com.javaverse.projectone.api.aggregate;

import com.javaverse.projectone.api.command.CompanyCommand;
import com.javaverse.projectone.api.event.CompanyEvent;
import lombok.Data;
import lombok.NoArgsConstructor;
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
public class CompanyAggregator {

    @AggregateIdentifier
    private OffsetDateTime offsetDateTime;

    /*Create*/
    @CommandHandler
    public CompanyAggregator(CompanyCommand.Create cmd) {
        log.debug(() -> "CommandHandler : Create : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    /*Update*/
    @CommandHandler
    public CompanyAggregator(CompanyCommand.Update cmd) {
        log.debug(() -> "CommandHandler : Update : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    /*Delete*/
    @CommandHandler
    public CompanyAggregator(CompanyCommand.Delete cmd) {
        log.debug(() -> "CommandHandler : Delete : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    @EventSourcingHandler
    private void on(CompanyEvent.Created event) {
        log.debug(() -> "EventSourcingHandler : Created : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

    @EventSourcingHandler
    private void on(CompanyEvent.Updated event) {
        log.debug(() -> "EventSourcingHandler : Updated : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

    @EventSourcingHandler
    private void on(CompanyEvent.Deleted event) {
        log.debug(() -> "EventSourcingHandler : Deleted : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }
}
