package com.abc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/about") // Changed from "/contact" to "/about"
public class AboutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public AboutController() {
        super();
    }

    // Handle GET request to display the "About Us" page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/about.jsp").forward(request, response); // Forward to the about.jsp
    }

    // Optionally handle POST requests (or redirect them to the GET method)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Redirect POST requests to GET method
    }
}
