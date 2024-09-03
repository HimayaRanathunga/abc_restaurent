package com.abc.service;

import com.abc.dao.OrderDAO;
import com.abc.model.Customer;
import com.abc.model.Order;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    private OrderDAO orderDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
    }

    public int createOrder(Customer customer, String paymentMethod, double totalPrice) throws SQLException {
        return orderDAO.createOrder(customer, paymentMethod, totalPrice);
    }

    public void addOrderItem(int orderId, String productName, double price, int quantity, double total) throws SQLException {
        orderDAO.addOrderItem(orderId, productName, price, quantity, total);
    }

    public List<Order> getAllOrders() throws SQLException {
        return orderDAO.getAllOrders();
    }

    public void completeOrder(int orderId) throws SQLException {
        orderDAO.completeOrder(orderId);
    }
    

}
