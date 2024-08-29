package com.abc.model;

public class OrderItem {
    private int orderItemId;
    private int orderId;
    private String productName;
    private double price;
    private int quantity;
    private double total;

    // Constructors, getters, and setters
    public OrderItem() {}

    public OrderItem(int orderItemId, int orderId, String productName, double price, int quantity, double total) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
