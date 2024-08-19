package com.abc.service;

import com.abc.dao.UserDAO;
import com.abc.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public boolean registerUser(User user) throws SQLException {
        return userDAO.registerUser(user);
    }

    public User loginUser(String username, String password) throws SQLException {
        return userDAO.loginUser(username, password);
    }

    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    public void deleteUser(int userId) throws SQLException {
        userDAO.deleteUser(userId);
    }
}
