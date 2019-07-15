package com.javaverse.projectone.api.service;

import com.javaverse.projectone.api.dto.StoreDTO;
import com.javaverse.projectone.api.entity.*;
import com.javaverse.projectone.api.event.StoreEvent;
import com.javaverse.projectone.api.mapper.StoreMapper;
import com.javaverse.projectone.api.query.StoreQuery;
import com.javaverse.projectone.api.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import org.axonframework.eventhandling.EventHandler;
import org.axonframework.queryhandling.QueryHandler;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StoreService {

    private final StoreRepository repo;
    private final StoreMapper mapper;

    @EventHandler
    public void on(StoreEvent.Created event) {
        Store entity = mapper.map(event);
        entity.setStatus(Common.Status.ACTIVE);
        repo.save(entity);
    }

    @EventHandler
    public void on(StoreEvent.Updated event) {
        Store entity = repo.findById(event.getId()).orElseThrow();
        entity.setCode(event.getCode());
        entity.setName(event.getName());
        repo.save(entity);
    }

    @EventHandler
    public void on(StoreEvent.Deleted event) {
        repo.deleteById(event.getId());
    }

    @QueryHandler
    public StoreDTO on(StoreQuery.Single query) {
        return mapper.map(repo.findById(query.getId()).orElseThrow());
    }

    @QueryHandler
    public List<StoreDTO> on(StoreQuery.AllActive query) {
        return mapper.map(repo.findAllByStatus(Common.Status.ACTIVE));
    }

}
