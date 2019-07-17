package com.javaverse.projectone.api.entity;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.*;

/**
 * @author duc-d
 * An authority (a security role) used by Spring Security.
 */
//@Document(collection = "authority")
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
