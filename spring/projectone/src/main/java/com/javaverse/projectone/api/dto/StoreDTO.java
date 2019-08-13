package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.StoreCommand;
import com.javaverse.projectone.api.entity.Store;
import lombok.*;

@Data
@ToString
@EqualsAndHashCode
public class StoreDTO extends Store {

    public StoreCommand.Create toCommandCreate() {
        return new StoreCommand.Create(getId(), getCode(), getName(),getCompanyId(),getAverageAmount(),getPhone(),getAddress());
    }

    public StoreCommand.Update toCommandUpdate() {
        return new StoreCommand.Update(getId(), getCode(), getName(),getCompanyId(),getAverageAmount(),getPhone(),getAddress());
    }

}
