package com.chandaliers.services.impl;

import com.chandaliers.dao.UserDao;
import com.chandaliers.models.User;
import com.chandaliers.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        userDao.saveAndFlush(user);
    }

    @Override
    public void deleteUser(int id) {
            userDao.delete(id);
    }

    @Override
    public void editUser(User user) {
     /*   if (Arrays.asList("_", "", null).contains(user.getPassword())) {
            user.setPassword(userDao.findOne(user.getUserId()).getPassword());
        }
        else
            user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));*/
        userDao.saveAndFlush(user);
    }

    @Override
    public User getById(int id) {
        return userDao.findOne(id);
    }

    @Override
    public Collection<User> loadUsersList() {
        return userDao.findAll();
    }

    @Override
    public User getByEmail(String email) {
        return userDao.findByEmail(email);
    }

}