package com.abc.service;

import com.abc.dao.FeedbackDAO;
import com.abc.model.Feedback;

import java.sql.SQLException;
import java.util.List;

public class FeedbackService {
    private FeedbackDAO feedbackDAO;

    public FeedbackService() {
        this.feedbackDAO = new FeedbackDAO();
    }

    public void addFeedback(Feedback feedback) throws SQLException {
        feedbackDAO.addFeedback(feedback);
    }

    public List<Feedback> getAllFeedback() throws SQLException {
        return feedbackDAO.getAllFeedback();
    }

    public void deleteFeedback(int feedbackId) throws SQLException {
        feedbackDAO.deleteFeedback(feedbackId);
    }
}
