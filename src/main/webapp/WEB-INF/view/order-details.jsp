<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <h5>Customer Details</h5>
    <p><strong>Name:</strong> ${order.customer.fullName}</p>
    <p><strong>Email:</strong> ${order.customer.email}</p>
    <p><strong>Address:</strong> ${order.customer.address}, ${order.customer.city}, ${order.customer.zipCode}</p>
    <p><strong>Phone:</strong> ${order.customer.phone}</p>

    <h5>Order Items</h5>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${order.orderItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.total}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <h5>Total Price: $${order.totalPrice}</h5>
</div>
