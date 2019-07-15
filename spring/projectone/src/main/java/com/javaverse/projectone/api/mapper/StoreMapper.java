package com.javaverse.projectone.api.mapper;

import com.javaverse.projectone.api.dto.StoreDTO;
import com.javaverse.projectone.api.entity.Store;
import com.javaverse.projectone.api.event.StoreEvent;
import org.mapstruct.*;

import java.util.List;
import java.util.stream.Stream;

@Mapper(injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface StoreMapper {

    @Mappings(value = {
            @Mapping(target = "version", ignore = true)
    })
    StoreDTO map(Store entity);

    @InheritInverseConfiguration
    Store map(StoreDTO dto);

    List<StoreDTO> map(Stream<Store> entities);

    @Mappings(value = {
            @Mapping(target = "version", ignore = true)
    })
    Store map(StoreEvent.Created event);

    @Mappings(value = {
            @Mapping(target = "version", ignore = true)
    })
    Store map(StoreEvent.Updated event);

}
