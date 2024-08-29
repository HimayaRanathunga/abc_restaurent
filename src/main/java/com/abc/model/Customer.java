package com.abc.model;

public class Customer {
    private int customerId;
    private String fullName;
    private String email;
    private String address;
    private String city;
    private String zipCode;
    private String phone;

    // Constructors, getters, and setters
    public Customer() {}

    public Customer(int customerId, String fullName, String email, String address, String city, String zipCode, String phone) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.city = city;
        this.zipCode = zipCode;
        this.phone = phone;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
