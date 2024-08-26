package com.abc.service;

import com.abc.model.Order;
import com.abc.model.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private Connection connection;

    public OrderService() {
        try {
            // Establish a database connection (update with your actual credentials and DB URL)
            String dbURL = "jdbc:mysql://localhost:3306/your_database";
            String username = "root";
            String password = "password";
            connection = DriverManager.getConnection(dbURL, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all orders from the database
    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Order order = new Order(
                resultSet.getInt("order_id"),
                resultSet.getString("full_name"),
                resultSet.getString("email"),
                resultSet.getDouble("total_price"),
                resultSet.getTimestamp("order_date")
            );
            orders.add(order);
        }

        return orders;
    }

    // Get a specific order by ID
    public Order getOrderById(int orderId) throws SQLException {
        String query = "SELECT * FROM orders WHERE order_id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, orderId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            return new Order(
                resultSet.getInt("order_id"),
                resultSet.getString("full_name"),
                resultSet.getString("email"),
                resultSet.getDouble("total_price"),
                resultSet.getTimestamp("order_date")
            );
        }
        return null;
    }

    // Add a new order to the database and return the generated order ID
    public int createOrder(String fullName, String email, String address, String city, String zipCode, String phone, String paymentMethod, double totalPrice) throws SQLException {
        String query = "INSERT INTO orders (full_name, email, address, city, zip_code, phone, payment_method, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, fullName);
        statement.setString(2, email);
        statement.setString(3, address);
        statement.setString(4, city);
        statement.setString(5, zipCode);
        statement.setString(6, phone);
        statement.setString(7, paymentMethod);
        statement.setDouble(8, totalPrice);

        int affectedRows = statement.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Creating order failed, no rows affected.");
        }

        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1); // Return the generated order ID
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        }
    }

    // Add order items to the `order_items` table
    public void addOrderItem(int orderId, String productName, double productPrice, int quantity, double total) throws SQLException {
        String query = "INSERT INTO order_items (order_id, product_name, product_price, quantity, total) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, orderId);
        statement.setString(2, productName);
        statement.setDouble(3, productPrice);
        statement.setInt(4, quantity);
        statement.setDouble(5, total);
        statement.executeUpdate();
    }

    // Get all items for a specific order
    public List<OrderItem> getOrderItemsByOrderId(int orderId) throws SQLException {
        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM order_items WHERE order_id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, orderId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            OrderItem item = new OrderItem(
                resultSet.getInt("order_item_id"),
                resultSet.getInt("order_id"),
                resultSet.getString("product_name"),
                resultSet.getDouble("product_price"),
                resultSet.getInt("quantity"),
                resultSet.getDouble("total")
            );
            orderItems.add(item);
        }

        return orderItems;
    }

    // Delete an order from the database
    public void deleteOrder(int orderId) throws SQLException {
        String deleteOrderQuery = "DELETE FROM orders WHERE order_id = ?";
        PreparedStatement statement = connection.prepareStatement(deleteOrderQuery);
        statement.setInt(1, orderId);
        statement.executeUpdate();

        String deleteOrderItemsQuery = "DELETE FROM order_items WHERE order_id = ?";
        PreparedStatement statementItems = connection.prepareStatement(deleteOrderItemsQuery);
        statementItems.setInt(1, orderId);
        statementItems.executeUpdate();
    }

    // Update the order (status, etc.) - Optional functionality
    public void updateOrder(int orderId, String status) throws SQLException {
        String query = "UPDATE orders SET status = ? WHERE order_id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, status);
        statement.setInt(2, orderId);
        statement.executeUpdate();
    }
}
