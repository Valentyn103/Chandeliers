package com.chandaliers.dao;

import com.chandaliers.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao  extends JpaRepository<User, Integer> {
    User findByEmail(String email);
}