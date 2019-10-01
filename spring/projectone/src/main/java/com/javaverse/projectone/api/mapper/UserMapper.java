package com.javaverse.projectone.api.mapper;

import com.javaverse.projectone.api.dto.UserDTO;
import com.javaverse.projectone.api.entity.User;
import com.javaverse.projectone.api.event.UserEvent;
import org.mapstruct.*;

import java.util.List;
import java.util.stream.Stream;

@Mapper(injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface UserMapper {

  @Mappings(value = {@Mapping(target = "version", ignore = true)})
  UserDTO map(User entity);

  @InheritInverseConfiguration
  User map(UserDTO dto);

  List<UserDTO> map(Stream<User> entities);

  @Mappings(value = {@Mapping(target = "version", ignore = true)})
  User map(UserEvent.Created event);

  @Mappings(value = {@Mapping(target = "version", ignore = true)})
  User map(UserEvent.Updated event);
}
