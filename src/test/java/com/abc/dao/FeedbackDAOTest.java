package com.abc.dao;

import com.abc.model.Feedback;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class FeedbackDAOTest {

    private FeedbackDAO feedbackDAO;
    private Connection mockConnection;
    private PreparedStatement mockPreparedStatement;
    private ResultSet mockResultSet;

    @BeforeEach
    public void setUp() throws SQLException {
        mockConnection = Mockito.mock(Connection.class);
        mockPreparedStatement = Mockito.mock(PreparedStatement.class);
        mockResultSet = Mockito.mock(ResultSet.class);
        feedbackDAO = new FeedbackDAO();
    }

    @Test
    public void testAddFeedback() throws SQLException {
        Feedback feedback = new Feedback();
        feedback.setName("John Doe");
        feedback.setEmail("johndoe@example.com");
        feedback.setRating(5);
        feedback.setComments("Excellent service!");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        feedbackDAO.addFeedback(feedback);

        verify(mockPreparedStatement).setString(1, feedback.getName());
        verify(mockPreparedStatement).setString(2, feedback.getEmail());
        verify(mockPreparedStatement).setInt(3, feedback.getRating());
        verify(mockPreparedStatement).setString(4, feedback.getComments());
        verify(mockPreparedStatement).executeUpdate();
    }

    @Test
    public void testGetAllFeedback() throws SQLException {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true).thenReturn(false); // Simulate one row of feedback
        when(mockResultSet.getInt("feedback_id")).thenReturn(1);
        when(mockResultSet.getString("name")).thenReturn("John Doe");
        when(mockResultSet.getString("email")).thenReturn("johndoe@example.com");
        when(mockResultSet.getInt("rating")).thenReturn(5);
        when(mockResultSet.getString("comments")).thenReturn("Excellent service!");
        when(mockResultSet.getTimestamp("created_at")).thenReturn(new Timestamp(System.currentTimeMillis()));

        List<Feedback> feedbackList = feedbackDAO.getAllFeedback();

        assertNotNull(feedbackList);
        assertEquals(1, feedbackList.size());
        Feedback feedback = feedbackList.get(0);
        assertEquals(1, feedback.getFeedbackId());
        assertEquals("John Doe", feedback.getName());
        assertEquals("johndoe@example.com", feedback.getEmail());
        assertEquals(5, feedback.getRating());
        assertEquals("Excellent service!", feedback.getComments());

        verify(mockPreparedStatement).executeQuery();
    }

    @Test
    public void testDeleteFeedback() throws SQLException {
        int feedbackId = 1;

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        feedbackDAO.deleteFeedback(feedbackId);

        verify(mockPreparedStatement).setInt(1, feedbackId);
        verify(mockPreparedStatement).executeUpdate();
    }
}
