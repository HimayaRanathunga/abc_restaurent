package com.abc.service;

import com.abc.dao.ContactDAO;
import com.abc.model.ContactMessage;

import java.sql.SQLException;
import java.util.List;

public class ContactService {

    private ContactDAO contactDAO;

    public ContactService() {
        contactDAO = new ContactDAO();
    }

    // Method to save a contact message
    public void saveContactMessage(ContactMessage contactMessage) throws SQLException {
        contactDAO.saveContactMessage(contactMessage);
    }

    // Method to retrieve all contact messages
    public List<ContactMessage> getAllMessages() throws SQLException {
        return contactDAO.getAllMessages();
    }
}
