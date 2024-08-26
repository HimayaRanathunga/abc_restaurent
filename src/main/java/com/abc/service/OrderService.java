package com.abc.service;

import com.abc.model.Order;
import com.abc.model.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private Connection connection;

    public OrderService() {
        initializeConnection(); // Initialize the database connection
    }

    // Method to initialize the database connection
    private void initializeConnection() {
        try {
            // Database connection details (replace with your own database info)
            String dbURL = "jdbc:mysql://localhost:3306/your_database"; // Replace with your actual database name
            String username = "root";  // Replace with your actual DB username
            String password = "password";  // Replace with your actual DB password

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            connection = DriverManager.getConnection(dbURL, username, password);

            // Log success
            if (connection != null) {
                System.out.println("Connection to database established successfully.");
            } else {
                System.out.println("Failed to establish connection to database.");
            }
        } catch (SQLException e) {
            System.err.println("Error while connecting to the database: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Get all orders from the database
    public List<Order> getAllOrders() throws SQLException {
        // Check if the connection is initialized
        if (connection == null) {
            throw new SQLException("Database connection is not initialized.");
        }

        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        // Iterate through the result set and map to Order objects
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

    // Get a specific order by its ID
    public Order getOrderById(int orderId) throws SQLException {
        // Check if the connection is initialized
        if (connection == null) {
            throw new SQLException("Database connection is not initialized.");
        }

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

    // Create a new order and return the generated order ID
    public int createOrder(String fullName, String email, String address, String city, String zipCode, String phone, String paymentMethod, double totalPrice) throws SQLException {
        // Check if the connection is initialized
        if (connection == null) {
            throw new SQLException("Database connection is not initialized.");
        }

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

        // Check if the insert was successful
        if (affectedRows == 0) {
            throw new SQLException("Creating order failed, no rows affected.");
        }

        // Retrieve the generated order ID
        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1); // Return the generated order ID
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        }
    }

    // Add an order item to the order_items table
    public void addOrderItem(int orderId, String productName, double productPrice, int quantity, double total) throws SQLException {
        // Check if the connection is initialized
        if (connection == null) {
            throw new SQLException("Database connection is not initialized.");
        }

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
        // Check if the connection is initialized
        if (connection == null) {
            throw new SQLException("Database connection is not initialized.");
        }

        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM order_items WHERE order_id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, orderId);
        ResultSet resultSet = statement.executeQuery();

        // Iterate through the result set and map to OrderItem objects
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
        // Check if the connection is initialized
        if (connection == null) {
            throw new SQLException("Database connection is not initialized.");
        }

        // Delete the order items first
        String deleteOrderItemsQuery = "DELETE FROM order_items WHERE order_id = ?";
        PreparedStatement statementItems = connection.prepareStatement(deleteOrderItemsQuery);
        statementItems.setInt(1, orderId);
        statementItems.executeUpdate();

        // Delete the order
        String deleteOrderQuery = "DELETE FROM orders WHERE order_id = ?";
        PreparedStatement statement = connection.prepareStatement(deleteOrderQuery);
        statement.setInt(1, orderId);
        statement.executeUpdate();
    }

    // Close the connection when done (optional)
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Error while closing the connection: " + e.getMessage());
        }
    }
}
