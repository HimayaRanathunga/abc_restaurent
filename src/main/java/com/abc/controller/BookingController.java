package com.abc.controller;

import com.abc.model.Booking;
import com.abc.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve booking form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        LocalDate bookingDate = LocalDate.parse(request.getParameter("date"));
        LocalTime bookingTime = LocalTime.parse(request.getParameter("time"));
        int guestCount = Integer.parseInt(request.getParameter("guest"));

        // Create a Booking object
        Booking booking = new Booking(name, email, mobile, bookingDate, bookingTime, guestCount, "Pending");

        try {
            // Attempt to save the booking in the database
            bookingService.createBooking(booking);

            // If successful, set a success message and forward to confirmation page
            request.setAttribute("successMessage", "Your booking has been submitted successfully. Awaiting admin approval.");
            request.getRequestDispatcher("/WEB-INF/view/booking.jsp").forward(request, response);
        } catch (SQLException e) {
            // If an error occurs, set an error message and forward to the booking page
            request.setAttribute("errorMessage", "There was an error submitting your booking. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/view/booking.jsp").forward(request, response);
        }
    }
}
