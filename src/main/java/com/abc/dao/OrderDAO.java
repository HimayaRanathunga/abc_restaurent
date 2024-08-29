package com.abc.dao;

import com.abc.model.Order;
import com.abc.model.Customer;
import com.abc.model.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public int createOrder(Customer customer, String paymentMethod, double totalPrice) throws SQLException {
        String customerSql = "INSERT INTO customers (full_name, email, address, city, zip_code, phone) VALUES (?, ?, ?, ?, ?, ?)";
        String orderSql = "INSERT INTO orders (customer_id, total_price, payment_method) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection()) {
            // Save customer
            try (PreparedStatement customerStmt = connection.prepareStatement(customerSql, Statement.RETURN_GENERATED_KEYS)) {
                customerStmt.setString(1, customer.getFullName());
                customerStmt.setString(2, customer.getEmail());
                customerStmt.setString(3, customer.getAddress());
                customerStmt.setString(4, customer.getCity());
                customerStmt.setString(5, customer.getZipCode());
                customerStmt.setString(6, customer.getPhone());
                customerStmt.executeUpdate();

                // Get generated customer ID
                try (ResultSet generatedKeys = customerStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        customer.setCustomerId(generatedKeys.getInt(1));
                    }
                }
            }

            // Save order
            try (PreparedStatement orderStmt = connection.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                orderStmt.setInt(1, customer.getCustomerId());
                orderStmt.setDouble(2, totalPrice);
                orderStmt.setString(3, paymentMethod);
                orderStmt.executeUpdate();

                // Get generated order ID
                try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        }
        return 0;
    }

    public void addOrderItem(int orderId, String productName, double price, int quantity, double total) throws SQLException {
        String sql = "INSERT INTO order_items (order_id, product_name, price, quantity, total) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setString(2, productName);
            stmt.setDouble(3, price);
            stmt.setInt(4, quantity);
            stmt.setDouble(5, total);
            stmt.executeUpdate();
        }
    }

    public List<Order> getAllOrders() throws SQLException {
        String sql = "SELECT o.order_id, o.total_price, o.payment_method, o.order_status, "
                   + "c.customer_id, c.full_name, c.email, c.address, c.city, c.zip_code, c.phone "
                   + "FROM orders o JOIN customers c ON o.customer_id = c.customer_id";
        
        List<Order> orderList = new ArrayList<>();
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setFullName(rs.getString("full_name"));
                customer.setEmail(rs.getString("email"));
                customer.setAddress(rs.getString("address"));
                customer.setCity(rs.getString("city"));
                customer.setZipCode(rs.getString("zip_code"));
                customer.setPhone(rs.getString("phone"));

                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setCustomer(customer);
                order.setTotalPrice(rs.getDouble("total_price"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setOrderStatus(rs.getString("order_status"));

                // Fetch order items for this order
                List<OrderItem> orderItems = getOrderItemsByOrderId(order.getOrderId(), connection);
                order.setOrderItems(orderItems);

                orderList.add(order);
            }
        }
        return orderList;
    }

    private List<OrderItem> getOrderItemsByOrderId(int orderId, Connection connection) throws SQLException {
        String sql = "SELECT product_name, price, quantity, total FROM order_items WHERE order_id = ?";
        List<OrderItem> orderItems = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setProductName(rs.getString("product_name"));
                    item.setPrice(rs.getDouble("price"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setTotal(rs.getDouble("total"));
                    orderItems.add(item);
                }
            }
        }
        return orderItems;
    }



    public void completeOrder(int orderId) throws SQLException {
        String sql = "UPDATE orders SET order_status = 'Completed' WHERE order_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.executeUpdate();
        }
    }
    

}
