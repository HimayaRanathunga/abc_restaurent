<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout - ABC Restaurant</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="NavBar.jsp" %>

        <!-- Checkout Start -->
        <div class="container my-5">
            <h2 class="text-center mb-4">Checkout</h2>

            <div class="row">
                <!-- Order Summary Section -->
                <div class="col-lg-6">
                    <h3>Your Order</h3>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart}">
                                <tr>
                                    <td>${item.key.name}</td>
                                    <td>${item.key.price}</td>
                                    <td>${item.value}</td>
                                    <td>${item.key.price * item.value}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="text-right">
                        <h4>Total: <strong>$${totalPrice}</strong></h4>
                    </div>
                </div>

                <!-- Shipping Information Form -->
                <div class="col-lg-6">
                    <h3>Shipping Information</h3>
                    <form action="cart?action=checkout" method="post">
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" required>
                        </div>

                        <div class="form-group">
                            <label for="city">City</label>
                            <input type="text" class="form-control" id="city" name="city" required>
                        </div>

                        <div class="form-group">
                            <label for="zipCode">Zip Code</label>
                            <input type="text" class="form-control" id="zipCode" name="zipCode" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>

                        <div class="form-group">
                            <label for="paymentMethod">Payment Method</label>
                            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                                <option value="credit_card">Credit Card</option>
                                <option value="paypal">PayPal</option>
                                <option value="cash_on_delivery">Cash on Delivery</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Complete Purchase</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Checkout End -->

        <%@ include file="Footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
