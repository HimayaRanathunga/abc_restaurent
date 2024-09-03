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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            request.setAttribute("bookings", bookingService.getAllBookings());
            request.getRequestDispatcher("/WEB-INF/view/admin-bookings.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving bookings", e);
        }
    }

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

            request.setAttribute("successMessage", successMessage);
            doGet(request, response); 
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error updating booking status for ID " + bookingId);
            doGet(request, response);
        }
    }
}
