package com.jycz.bookcycle.service;

import com.jycz.bookcycle.model.Seller;
import com.jycz.bookcycle.model.User;

import java.util.List;

public interface UserService {
    boolean saveUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(String userId);
    User getUser(String userId);
    User login(User user);
    String register(User user);
    List<User> getAllUsers();
}
