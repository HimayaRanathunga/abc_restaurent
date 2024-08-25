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

    public void saveContactMessage(ContactMessage contactMessage) throws SQLException {
        contactDAO.saveContactMessage(contactMessage);
    }

    public List<ContactMessage> getAllMessages() throws SQLException {
        return contactDAO.getAllMessages();
    }
}
