package com.javaverse.projectone.api.command;

import com.javaverse.projectone.api.event.UserEvent;
import lombok.EqualsAndHashCode;
import lombok.Value;

public class UserCommand {

  private UserCommand() {}

  @Value
  @EqualsAndHashCode
  public static class Create extends CommonCommand<Long> {
    private final String code;
    private final String name;
    private final String username;
    private final String password;

    public Create(Long id, String code, String name, String username, String password) {
      super(id);
      this.code = code;
      this.name = name;
      this.username = username;
      this.password = password;
    }

    public UserEvent.Created toEvent() {
      return new UserEvent.Created(code, name, username, password);
    }
  }

  @Value
  @EqualsAndHashCode
  public static class Update extends CommonCommand<Long> {

    private final String code;
    private final String name;
    private final String username;
    private final String password;

    public Update(Long id, String code, String name, String username, String password) {
      super(id);
      this.code = code;
      this.name = name;
      this.username = username;
      this.password = password;
    }

    public UserEvent.Updated toEvent() {
      return new UserEvent.Updated(id, code, name, username, password);
    }
  }

  @Value
  @EqualsAndHashCode
  public static class Delete extends CommonCommand<Long> {
    public Delete(Long id) {
      super(id);
    }

    public UserEvent.Deleted toEvent() {
      return new UserEvent.Deleted(id);
    }
  }
}
