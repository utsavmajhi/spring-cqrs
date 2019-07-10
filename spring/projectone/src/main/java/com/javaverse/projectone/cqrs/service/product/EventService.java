package com.javaverse.projectone.cqrs.service.product;

import com.javaverse.projectone.cqrs.entity.ProductEntity;
import com.javaverse.projectone.cqrs.event.ProductEvent;
import com.javaverse.projectone.cqrs.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.axonframework.eventhandling.EventHandler;
import org.springframework.stereotype.Service;

@Service("product-event-service")
@RequiredArgsConstructor
public class EventService {
    private final ProductRepository productRepository;

    @EventHandler
    public void on(ProductEvent.Created event) {
        System.out.println("EventHandler CreatedEvent");
        ProductEntity entity = new ProductEntity();
        entity.setCode(event.getCode());
        entity.setName(event.getName());
        entity.setStatus(event.getStatus());
        productRepository.save(entity);
    }

    @EventHandler
    public void on(ProductEvent.Deleted event) {
        System.out.println("EventHandler DeletedEvent : " + event.getId());
        productRepository.deleteById(event.getId());
    }

}
