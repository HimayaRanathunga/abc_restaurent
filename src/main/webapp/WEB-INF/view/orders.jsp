<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Orders</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h2 class="text-center mb-4">All Orders</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Total Price</th>
                    <th>Order Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Initialize totalIncome to 0 -->
                <c:set var="totalIncome" value="0" />
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.fullName}</td>
                        <td>${order.email}</td>
                        <td>$${order.totalPrice}</td>
                        <td>${order.orderDate}</td>
                        <td>
                            <a href="orders?action=viewOrderDetails&orderId=${order.orderId}" class="btn btn-info">View</a>
                            <a href="orders?action=deleteOrder&orderId=${order.orderId}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <!-- Accumulate the total income -->
                    <c:set var="totalIncome" value="${totalIncome + order.totalPrice}" />
                </c:forEach>
            </tbody>
        </table>

        <!-- Display the total income -->
        <div class="text-right">
            <h4>Total Income: $<c:out value="${totalIncome}" /></h4>
        </div>
    </div>
</body>
</html>
