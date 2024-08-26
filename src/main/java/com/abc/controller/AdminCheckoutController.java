package com.abc.controller;

import com.abc.model.Order;
import com.abc.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/checkout")
public class AdminCheckoutController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService(); // Initialize order service
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("viewOrders")) {
            try {
                viewAllCheckouts(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Error retrieving orders", e);
            }
        } else if (action.equals("viewOrderDetails")) {
            try {
                viewOrderDetails(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Error retrieving order details", e);
            }
        }
    }

    // View all checkouts
    private void viewAllCheckouts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Order> orders = orderService.getAllOrders(); // Fetch all orders from the database
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/view/admin/admin_checkout.jsp").forward(request, response); // Forward to admin_checkout.jsp
    }

    // View details of a specific order
    private void viewOrderDetails(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Order order = orderService.getOrderById(orderId); // Fetch specific order by ID
        request.setAttribute("order", order);
        request.getRequestDispatcher("/WEB-INF/view/admin/order_details.jsp").forward(request, response); // Forward to order details JSP
    }
}
