<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Order Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .order-details-row {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <h2 class="text-center mb-4">Order Management</h2>
        <a href="dashbord.jsp" class="btn btn-primary mb-3">Back</a>

        <!-- Display success message if present -->
        <c:if test="${not empty param.message}">
            <div id="successMessage" class="alert alert-success" role="alert">
                ${param.message}
            </div>
        </c:if>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Total Price</th>
                    <th>Payment Method</th>
                    <th>Order Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.customer.fullName}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.paymentMethod}</td>
                        <td>${order.orderStatus}</td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm" onclick="toggleDetails(${order.orderId})">View Details</button>
                            <c:if test="${order.orderStatus == 'Pending'}">
                                <a href="adminOrders?action=complete&orderId=${order.orderId}" class="btn btn-success btn-sm">Complete</a>
                            </c:if>
                        </td>
                    </tr>
                    <!-- Hidden row for order details -->
                    <tr class="order-details-row" id="details-${order.orderId}">
                        <td colspan="6">
                            <div>
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
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Automatically remove the success message after 3 seconds
        $(document).ready(function() {
            setTimeout(function() {
                $('#successMessage').fadeOut('slow');
            }, 3000); // 3000 milliseconds = 3 seconds
        });

        // Toggle the visibility of the order details
        function toggleDetails(orderId) {
            var detailsRow = $('#details-' + orderId);
            detailsRow.toggle();
        }
    </script>
</body>
</html>
