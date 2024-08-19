package com.abc.controller;

import com.abc.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/adminBooking")
public class AdminBookingController extends HttpServlet {
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    // Handle GET requests to display the booking management page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Fetch all bookings (pending, approved, rejected, etc.)
        try {
            request.setAttribute("bookings", bookingService.getAllBookings());
            request.getRequestDispatcher("/WEB-INF/view/admin-bookings.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving bookings", e);
        }
    }

    // Handle POST requests to update the booking status
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String action = request.getParameter("action");

        try {
            String successMessage = null;
            if ("approve".equals(action)) {
                bookingService.updateBookingStatus(bookingId, "Approved");
                successMessage = "Booking ID " + bookingId + " has been approved.";
            } else if ("reject".equals(action)) {
                bookingService.updateBookingStatus(bookingId, "Rejected");
                successMessage = "Booking ID " + bookingId + " has been rejected.";
            }

            // Set success message
            request.setAttribute("successMessage", successMessage);
            doGet(request, response);  // Forward back to the GET method to reload bookings
        } catch (SQLException e) {
            // Set error message in case of failure
            request.setAttribute("errorMessage", "Error updating booking status for ID " + bookingId);
            doGet(request, response);  // Forward back to the GET method with error
        }
    }
}
