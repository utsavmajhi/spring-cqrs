package com.javaverse.projectone.api.aggregate;

import com.javaverse.projectone.api.command.UserCommand;
import com.javaverse.projectone.api.event.UserEvent;
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
public class UserAggregator {

    @AggregateIdentifier
    private OffsetDateTime offsetDateTime;

    /*Create*/
    @CommandHandler
    // use constructor only for 1st create
    public UserAggregator(UserCommand.Create cmd) {
        log.debug(() -> "CommandHandler : Create : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    /*Update*/
    @CommandHandler
    // use constructor only for 1st create
    public UserAggregator(UserCommand.Update cmd) {
        log.debug(() -> "CommandHandler : Update : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    /*Delete*/
    @CommandHandler
    public UserAggregator(UserCommand.Delete cmd) {
        log.debug(() -> "CommandHandler : Delete : " + cmd);
        // validation logic
        apply(cmd.toEvent());
    }

    @EventSourcingHandler
    private void on(UserEvent.Created event) {
        log.debug(() -> "EventSourcingHandler : Created : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

    @EventSourcingHandler
    private void on(UserEvent.Updated event) {
        log.debug(() -> "EventSourcingHandler : Updated : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

    @EventSourcingHandler
    private void on(UserEvent.Deleted event) {
        log.debug(() -> "EventSourcingHandler : Deleted : " + event);
        setOffsetDateTime(OffsetDateTime.now());
    }

}