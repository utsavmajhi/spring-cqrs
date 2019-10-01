package com.javaverse.projectone.api.service;

import com.javaverse.projectone.api.dto.CompanyDTO;
import com.javaverse.projectone.api.entity.Common;
import com.javaverse.projectone.api.entity.Company;
import com.javaverse.projectone.api.event.CompanyEvent;
import com.javaverse.projectone.api.mapper.CompanyMapper;
import com.javaverse.projectone.api.query.CompanyQuery;
import com.javaverse.projectone.api.repository.CompanyRepository;
import lombok.RequiredArgsConstructor;
import org.axonframework.eventhandling.EventHandler;
import org.axonframework.queryhandling.QueryHandler;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CompanyService {

    private final CompanyRepository repo;
    private final CompanyMapper mapper;

    @EventHandler
    public void on(CompanyEvent.Created event) {
        Company entity = mapper.map(event);
        entity.setStatus(Common.Status.ACTIVE);
        repo.save(entity);
    }

    @EventHandler
    public void on(CompanyEvent.Updated event) {
        repo.findById(event.getId()).orElseThrow();
        repo.save(mapper.map(event));
    }

    @EventHandler
    public void on(CompanyEvent.Deleted event) {
        repo.deleteById(event.getId());
    }

    @QueryHandler
    public CompanyDTO on(CompanyQuery.Single query) {
        return mapper.map(repo.findById(query.getId()).orElseThrow());
    }

    @QueryHandler
    public List<CompanyDTO> on(CompanyQuery.AllActive query) {
        return mapper.map(repo.findAllByStatus(Common.Status.ACTIVE));
    }
}
