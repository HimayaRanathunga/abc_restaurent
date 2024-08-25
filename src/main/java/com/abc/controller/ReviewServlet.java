package com.abc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/submitReview")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String author = request.getParameter("author");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        // Process the review (e.g., save it to the database or session)
        // Assuming the review was saved successfully
        
        // Redirect back to the reviews page with a success message
        request.setAttribute("success", "Your review has been submitted successfully!");
        request.getRequestDispatcher("reviews.jsp").forward(request, response);
    }
}
