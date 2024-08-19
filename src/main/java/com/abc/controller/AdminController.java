package com.abc.controller;

import com.abc.model.ContactMessage;
import com.abc.service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminmessages")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactService contactService;

    public AdminController() {
        super();
        contactService = new ContactService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ContactMessage> messages = contactService.getAllMessages();
            request.setAttribute("messages", messages);
            request.getRequestDispatcher("/WEB-INF/view/admin-messages.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
