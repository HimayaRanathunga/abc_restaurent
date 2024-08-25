package com.abc.controller;

import com.abc.model.User;
import com.abc.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private UserService userService;

    public void init() {
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");  

        User user = new User(username, password, email, role);

        try {
            if (userService.registerUser(user)) {
                response.sendRedirect("login.jsp?success=Registration successful! Please log in.");
            } else {
                response.sendRedirect("register.jsp?error=Unable to register");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
