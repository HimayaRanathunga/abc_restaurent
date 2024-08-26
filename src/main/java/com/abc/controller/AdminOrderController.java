package com.abc.controller;

import com.abc.service.OrderService;
import com.abc.model.Order;
import com.abc.model.OrderItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();  // Initialize the order service to interact with DB
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewOrders"; // Default action to view all orders
        }

        try {
            switch (action) {
                case "viewOrderDetails":
                    viewOrderDetails(request, response);
                    break;
                case "deleteOrder":
                    deleteOrder(request, response);
                    break;
                case "viewOrders":
                default:
                    viewOrders(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error processing request", e);
        }
    }

    private void viewOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Retrieve all orders from the DB
        List<Order> orders = orderService.getAllOrders();
        request.setAttribute("orders", orders);

        // Forward to admin orders JSP page
        request.getRequestDispatcher("/WEB-INF/view/orders.jsp").forward(request, response);
    }

    private void viewOrderDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // Retrieve the order and order items from the DB
        Order order = orderService.getOrderById(orderId);
        List<OrderItem> orderItems = orderService.getOrderItemsByOrderId(orderId);

        // Set order and order items in request attributes
        request.setAttribute("order", order);
        request.setAttribute("orderItems", orderItems);

        // Forward to admin order details JSP page
        request.getRequestDispatcher("/WEB-INF/view/orderDetails.jsp").forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // Delete the order from the database
        orderService.deleteOrder(orderId);

        // Redirect to the orders list after deletion
        response.sendRedirect("orders?action=viewOrders");
    }
}
