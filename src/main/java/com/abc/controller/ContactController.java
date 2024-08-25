package com.abc.controller;

import com.abc.model.ContactMessage;
import com.abc.service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/contact")
public class ContactController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactService contactService;

    public ContactController() {
        super();
        contactService = new ContactService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/contact.jsp").forward(request, response); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        ContactMessage contactMessage = new ContactMessage(name, email, subject, message);

        try {
            contactService.saveContactMessage(contactMessage);
            response.sendRedirect("contact?success=Message+sent+successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contact?error=Failed+to+send+message.");
        }
    }
}
