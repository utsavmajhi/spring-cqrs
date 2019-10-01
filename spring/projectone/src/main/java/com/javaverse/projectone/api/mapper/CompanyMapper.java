package com.javaverse.projectone.api.mapper;

import com.javaverse.projectone.api.dto.CompanyDTO;
import com.javaverse.projectone.api.entity.Company;
import com.javaverse.projectone.api.event.CompanyEvent;
import org.mapstruct.*;

import java.util.List;
import java.util.stream.Stream;

@Mapper(injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface CompanyMapper {

  @Mappings(value = {@Mapping(target = "version", ignore = true)})
  CompanyDTO map(Company entity);

  @InheritInverseConfiguration
  Company map(CompanyDTO dto);

  List<CompanyDTO> map(Stream<Company> entities);

  @Mappings(value = {@Mapping(target = "version", ignore = true)})
  Company map(CompanyEvent.Created event);

  @Mappings(value = {@Mapping(target = "version", ignore = true)})
  Company map(CompanyEvent.Updated event);
}
