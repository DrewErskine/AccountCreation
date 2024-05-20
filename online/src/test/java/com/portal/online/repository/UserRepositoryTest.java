package com.portal.online.repository;

import com.portal.online.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void findByUsername_UserExists_ReturnsUser() {
        User user = new User();
        user.setUsername("Drew");
        user.setPassword("password");
        userRepository.save(user);

        User foundUser = userRepository.findByUsername("Drew");

        assertEquals(user.getUsername(), foundUser.getUsername());
    }

    @Test
    void findByUsername_UserDoesNotExist_ReturnsNull() {
        User foundUser = userRepository.findByUsername("Unknown");

        assertNull(foundUser);
    }
}
