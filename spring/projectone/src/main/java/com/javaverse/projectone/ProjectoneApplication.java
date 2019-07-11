package com.javaverse.projectone;

import com.javaverse.projectone.authentication.component.AuthoritiesConstants;
import com.javaverse.projectone.authentication.entity.*;
import com.javaverse.projectone.authentication.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RequiredArgsConstructor
public class ProjectoneApplication implements CommandLineRunner {

    // todo
    // implement refresh token flow for remember me process

    public static void main(String[] args) {
        SpringApplication.run(ProjectoneApplication.class, args);
    }

    private final AuthorityRepository authorityRepository;
    private final UserRepository userRepository;

    @Override
    public void run(String... args) {
        if (userRepository.findByUsername("admin").isEmpty()) {
            Authority adminAuth = authorityRepository.save(new Authority(AuthoritiesConstants.ADMIN));
            Authority userAuth = authorityRepository.save(new Authority(AuthoritiesConstants.USER));

            User adminUser = new User();
            adminUser.setUsername("admin");
            adminUser.setPassword("$2a$10$MYkP3aeSQy7DI.qgk4noreZ5uchb0i61OOeWu2tVHAO1yNSsGqCVG"); // password: password
            adminUser.getAuthorities().add(adminAuth);
            adminUser.getAuthorities().add(userAuth);
            userRepository.save(adminUser);

            User basic = new User();
            basic.setUsername("user");
            basic.setPassword("$2a$10$MYkP3aeSQy7DI.qgk4noreZ5uchb0i61OOeWu2tVHAO1yNSsGqCVG"); // password: password
            basic.getAuthorities().add(userAuth);
            userRepository.save(basic);
        }
    }
}
