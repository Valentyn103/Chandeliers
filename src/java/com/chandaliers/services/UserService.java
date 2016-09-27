package com.chandaliers.services;

import com.chandaliers.models.User;

import java.util.Collection;

public interface UserService {

    public void addUser(User user);

    public void editUser(User user);

    public void deleteUser(int userId);

    public User getById(int id);

    public User getByEmail(String email);

    public Collection<User> loadUsersList();

}
