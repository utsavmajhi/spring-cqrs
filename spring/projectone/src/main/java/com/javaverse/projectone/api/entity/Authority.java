package com.javaverse.projectone.api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author duc-d An authority (a security role) used by Spring Security.
 */
// @Document(collection = "authority")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "authorities")
public class Authority implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(max = 50)
    private String name;

    public Authority(@NotNull @Size(max = 50) String name) {
        this.name = name;
    }

    @Override
    public String getAuthority() {
        return name;
  }
}
