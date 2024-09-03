package com.abc.dao;

import com.abc.model.ContactMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {

    // Save contact message to database
    public void saveContactMessage(ContactMessage contactMessage) throws SQLException {
        String query = "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, contactMessage.getName());
            preparedStatement.setString(2, contactMessage.getEmail());
            preparedStatement.setString(3, contactMessage.getSubject());
            preparedStatement.setString(4, contactMessage.getMessage());

            preparedStatement.executeUpdate();
        }
    }

    public List<ContactMessage> getAllMessages() throws SQLException {
        List<ContactMessage> messages = new ArrayList<>();
        String query = "SELECT * FROM contact_messages";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                ContactMessage message = new ContactMessage(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("subject"),
                    resultSet.getString("message"),
                    resultSet.getTimestamp("submitted_at")
                );
                messages.add(message);
            }
        }

        return messages;
    }
}
