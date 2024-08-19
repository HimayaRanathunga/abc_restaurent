package com.abc.service;

import com.abc.dao.BookingDAO;
import com.abc.model.Booking;

import java.sql.SQLException;
import java.util.List;

public class BookingService {
    private BookingDAO bookingDAO;

    public BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    public void createBooking(Booking booking) throws SQLException {
        bookingDAO.insertBooking(booking);
    }

    public List<Booking> getAllBookings() throws SQLException {
        return bookingDAO.getAllBookings();
    }

    public void updateBookingStatus(int bookingId, String status) throws SQLException {
        bookingDAO.updateBookingStatus(bookingId, status);
    }
}
