<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <%@ include file="NavBar.jsp" %>

    <!-- Login or Guest Mode Modal HTML -->
    <div class="modal fade" id="loginGuestModal" tabindex="-1" role="dialog" aria-labelledby="loginGuestModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginGuestModalLabel">Select Mode</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <a href="login.jsp" class="btn btn-warning btn-lg btn-block mb-3">Login</a>
                    <a href="#" class="btn btn-secondary btn-lg btn-block" data-dismiss="modal">Continue as Guest</a>
                </div>
            </div>
        </div>
    </div>

    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>Your Cart</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="cart">
        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalPrice" value="0" />
                    <c:forEach var="entry" items="${sessionScope.cart}">
                        <tr>
                            <td>${entry.key.name}</td>
                            <td>${entry.key.price}</td>
                            <td>
                                <form action="cart" method="get" style="display:inline-block;">
                                    <input type="hidden" name="action" value="decrease">
                                    <input type="hidden" name="productId" value="${entry.key.productId}">
                                    <button type="submit" class="btn btn-danger btn-sm">-</button>
                                </form>
                                ${entry.value}
                                <form action="cart" method="get" style="display:inline-block;">
                                    <input type="hidden" name="action" value="increase">
                                    <input type="hidden" name="productId" value="${entry.key.productId}">
                                    <button type="submit" class="btn btn-success btn-sm">+</button>
                                </form>
                            </td>
                            <td>${entry.key.price * entry.value}</td>
                            <td>
                                <form action="cart" method="get">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="productId" value="${entry.key.productId}">
                                    <button type="submit" class="btn btn-danger">Remove</button>
                                </form>
                            </td>
                            <c:set var="totalPrice" value="${totalPrice + (entry.key.price * entry.value)}" />
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3>Total: <c:out value="${totalPrice}" /></h3>
            <div class="text-right">
                <a href="cart?action=checkout" class="btn btn-warning">Proceed to Checkout</a>
            </div>
        </div>
    </div>

    <%@ include file="Footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            <%-- Check if the user is not logged in --%>
            <c:if test="${sessionScope.user == null}">
                $('#loginGuestModal').modal('show');
            </c:if>
        });
    </script>
</body>
</html>
