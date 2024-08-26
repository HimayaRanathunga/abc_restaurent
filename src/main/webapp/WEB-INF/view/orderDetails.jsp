<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h2 class="text-center mb-4">Order Details</h2>
        
        <div class="row">
            <div class="col-md-6">
                <h4>Order Information</h4>
                <p><strong>Order ID:</strong> ${order.orderId}</p>
                <p><strong>Customer Name:</strong> ${order.fullName}</p>
                <p><strong>Email:</strong> ${order.email}</p>
                <p><strong>Address:</strong> ${order.address}, ${order.city}, ${order.zipCode}</p>
                <p><strong>Phone:</strong> ${order.phone}</p>
                <p><strong>Total Price:</strong> $${order.totalPrice}</p>
                <p><strong>Order Date:</strong> ${order.orderDate}</p>
            </div>
        </div>

        <h4>Ordered Items</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${orderItems}">
                    <tr>
                        <td>${item.productName}</td>
                        <td>$${item.productPrice}</td>
                        <td>${item.quantity}</td>
                        <td>$${item.total}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
