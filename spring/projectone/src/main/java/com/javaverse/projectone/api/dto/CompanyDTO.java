package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.CompanyCommand;
import com.javaverse.projectone.api.entity.Company;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode
public class CompanyDTO extends Company {

  public CompanyCommand.Create toCommandCreate() {
    return new CompanyCommand.Create(getId(), getCode(), getName());
  }

  public CompanyCommand.Update toCommandUpdate() {
    return new CompanyCommand.Update(getId(), getCode(), getName());
  }
}
