package com.javaverse.projectone.api.dto;

import com.javaverse.projectone.api.command.UserCommand;
import com.javaverse.projectone.api.entity.User;
import lombok.*;

@Data
@ToString
@EqualsAndHashCode
public class UserDTO extends User {

    public UserCommand.Create toCommandCreate() {
        return new UserCommand.Create(getId(), getCode(), getName(),getUsername(),getPassword());
    }

    public UserCommand.Update toCommandUpdate() {
        return new UserCommand.Update(getId(), getCode(), getName(),getUsername(),getPassword());
    }

}
