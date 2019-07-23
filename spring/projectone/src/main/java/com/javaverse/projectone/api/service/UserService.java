package com.javaverse.projectone.api.service;

import com.javaverse.projectone.api.dto.UserDTO;
import com.javaverse.projectone.api.entity.*;
import com.javaverse.projectone.api.event.UserEvent;
import com.javaverse.projectone.api.mapper.UserMapper;
import com.javaverse.projectone.api.query.UserQuery;
import com.javaverse.projectone.api.repository.*;
import lombok.RequiredArgsConstructor;
import org.axonframework.eventhandling.EventHandler;
import org.axonframework.queryhandling.QueryHandler;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepo;
    private final AuthorityRepository authorityRepo;
    private final UserMapper mapper;
    private final PasswordEncoder encoder;

    @EventHandler
    public void on(UserEvent.Created event) {
        User entity = mapper.map(event);
        entity.setStatus(Common.Status.ACTIVE);
        entity.setPassword(encoder.encode(event.getPassword()));
        entity.getAuthorities().add(authorityRepo.getOne(2L));
        userRepo.save(entity);
    }

    @EventHandler
    public void on(UserEvent.Updated event) {
        User entity = userRepo.findById(event.getId()).orElseThrow();
        entity.setCode(event.getCode());
        entity.setName(event.getName());
        userRepo.save(entity);
    }

    @EventHandler
    public void on(UserEvent.Deleted event) {
        userRepo.deleteById(event.getId());
    }

    @QueryHandler
    public UserDTO on(UserQuery.Single query) {
        return mapper.map(userRepo.findById(query.getId()).orElseThrow());
    }

    @QueryHandler
    public List<UserDTO> on(UserQuery.AllActive query) {
        return mapper.map(userRepo.findAllByStatus(Common.Status.ACTIVE));
    }

}
