package com.abc.model;

import java.sql.Timestamp;

public class Order {
    private int orderId;
    private String fullName;
    private String email;
    private double totalPrice;
    private Timestamp orderDate;

    // Constructor
    public Order(int orderId, String fullName, String email, double totalPrice, Timestamp orderDate) {
        this.orderId = orderId;
        this.fullName = fullName;
        this.email = email;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
    }

    // Getters and setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
}
