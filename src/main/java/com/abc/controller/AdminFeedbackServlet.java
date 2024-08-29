package com.abc.controller;

import com.abc.service.FeedbackService;
import com.abc.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminFeedback")
public class AdminFeedbackServlet extends HttpServlet {
    private FeedbackService feedbackService;

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
            try {
                feedbackService.deleteFeedback(feedbackId);
                response.sendRedirect("adminFeedback?success=Feedback deleted successfully!");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("adminFeedback?error=Failed to delete feedback.");
            }
        } else {
            try {
                List<Feedback> feedbackList = feedbackService.getAllFeedback();
                request.setAttribute("feedbackList", feedbackList);
                request.getRequestDispatcher("/WEB-INF/view/admin-feedback.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("adminFeedback?error=Failed to load feedback.");
            }
        }
    }
}
