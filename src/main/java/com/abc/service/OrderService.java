package com.abc.service;

import java.sql.*;

public class OrderService {
    private Connection connection;

    public OrderService() {
        try {
            // Establish a database connection (replace with your actual DB connection details)
            String dbURL = "jdbc:mysql://localhost:3306/your_database";
            String username = "root";
            String password = "password";
            connection = DriverManager.getConnection(dbURL, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Create a new order in the `orders` table and return the generated order ID
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

    // Add items to the `order_items` table
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
}
