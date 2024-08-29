package com.abc.controller;

import com.abc.service.OrderService;
import com.abc.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminOrders")
public class AdminOrderController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "complete":
                    completeOrder(request, response);
                    break;
                case "list":
                default:
                    listOrders(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Order> orderList = orderService.getAllOrders();
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/WEB-INF/view/admin-order-list.jsp").forward(request, response);
    }

    private void completeOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        orderService.completeOrder(orderId);
        response.sendRedirect("adminOrders?action=list&message=Order%20completed%20successfully");
    }

}
