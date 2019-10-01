package com.javaverse.projectone.api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "users")
public class User extends Common implements UserDetails {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String username;

  private String password;

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(
      foreignKey = @ForeignKey(name = "none"),
      name = "user_authorities",
      joinColumns = @JoinColumn(name = "users_id", referencedColumnName = "id"),
      inverseJoinColumns = @JoinColumn(name = "authorities_id", referencedColumnName = "id"))
  private Collection<Authority> authorities = new HashSet<>();

  @Column(length = 13, unique = true)
  private String code;

  @Column(length = 30)
  private String name;

  public List<GrantedAuthority> getGrantedAuthorities() {
    return getAuthorities().stream()
        .map(role -> new SimpleGrantedAuthority(role.getName()))
        .collect(Collectors.toList());
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
