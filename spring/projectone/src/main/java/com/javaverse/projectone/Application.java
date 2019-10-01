package com.javaverse.projectone;

import com.javaverse.projectone.api.entity.Authority;
import com.javaverse.projectone.api.entity.User;
import com.javaverse.projectone.api.repository.AuthorityRepository;
import com.javaverse.projectone.api.repository.UserRepository;
import com.javaverse.projectone.api.token.AuthoritiesConstants;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RequiredArgsConstructor
public class Application implements CommandLineRunner {

  // todo
  // implement refresh token flow for remember me process

  private final AuthorityRepository authorityRepository;
  private final UserRepository userRepository;

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

  @Override
  public void run(String... args) {
    if (userRepository.findByUsername("admin").isEmpty()) {
      var adminAuth = authorityRepository.save(new Authority(AuthoritiesConstants.ADMIN));
      var userAuth = authorityRepository.save(new Authority(AuthoritiesConstants.USER));

      var adminUser = new User();
      adminUser.setUsername("admin");
      adminUser.setPassword(
          "$2a$10$MYkP3aeSQy7DI.qgk4noreZ5uchb0i61OOeWu2tVHAO1yNSsGqCVG"); // password: password
      adminUser.getAuthorities().add(adminAuth);
      adminUser.getAuthorities().add(userAuth);
      userRepository.save(adminUser);

      var basic = new User();
      basic.setUsername("user");
      basic.setPassword(
          "$2a$10$MYkP3aeSQy7DI.qgk4noreZ5uchb0i61OOeWu2tVHAO1yNSsGqCVG"); // password: password
      basic.getAuthorities().add(userAuth);
      userRepository.save(basic);
    }
  }
}
