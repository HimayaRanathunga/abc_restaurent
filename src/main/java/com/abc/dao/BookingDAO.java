package com.abc.dao;

import com.abc.model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public void insertBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO bookings (name, email, mobile, booking_date, booking_time, guest_count, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, booking.getName());
            stmt.setString(2, booking.getEmail());
            stmt.setString(3, booking.getMobile());
            stmt.setDate(4, Date.valueOf(booking.getBookingDate()));
            stmt.setTime(5, Time.valueOf(booking.getBookingTime()));
            stmt.setInt(6, booking.getGuestCount());
            stmt.setString(7, booking.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("booking_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getDate("booking_date").toLocalDate(),
                        rs.getTime("booking_time").toLocalTime(),
                        rs.getInt("guest_count"),
                        rs.getString("status")
                );
                bookings.add(booking);
            }
        }

        return bookings;
    }

    public void updateBookingStatus(int bookingId, String status) throws SQLException {
        String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);
            stmt.executeUpdate();
        }
    }
}
