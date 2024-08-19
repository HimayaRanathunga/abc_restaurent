<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Menu</h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- Search Bar Start -->
        <div class="container mt-3 mb-4">
            <div class="row">
                <div class="col-12">
                    <input type="text" id="searchInput" class="form-control" placeholder="Search for products..." onkeyup="filterProducts()">
                </div>
            </div>
        </div>
        <!-- Search Bar End -->

        <!-- Menu Start -->
        <div class="menu">
            <div class="container">
                <div class="menu-tab">
                    <div class="tab-content">
                        <div id="burgers" class="container tab-pane active">
                            <div class="row" id="productList">
                                <c:forEach var="product" items="${productList}">
                                    <div class="col-lg-4 col-md-6 product-item">
                                        <div class="menu-item">
                                            <div class="menu-img">
                                                <img src="${product.imageUrl}" alt="${product.name}" class="img-fluid">
                                            </div>
                                            <div class="menu-text">
                                                <h3><span class="product-name">${product.name}</span> <strong>${product.price}</strong></h3>
                                                <p class="product-description">${product.description}</p>
                                                <form action="cart" method="get">
                                                    <input type="hidden" name="action" value="addToCart">
                                                    <input type="hidden" name="productId" value="${product.productId}">
                                                    <!-- Quantity input field with a default value of 1 -->
                                                    <div class="form-group">
                                                        <label for="quantity-${product.productId}">Quantity:</label>
                                                        <input type="number" id="quantity-${product.productId}" name="quantity" value="1" min="1" class="form-control" style="width: 80px; display: inline-block;">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->

        <%@ include file="Footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

        <!-- JavaScript for Search Filter -->
        <script>
            function filterProducts() {
                // Get the search input value
                var input = document.getElementById('searchInput').value.toLowerCase();
                var productItems = document.getElementsByClassName('product-item');

                // Loop through all product items and hide those that don't match the search query
                for (var i = 0; i < productItems.length; i++) {
                    var productName = productItems[i].getElementsByClassName('product-name')[0].innerText.toLowerCase();
                    var productDescription = productItems[i].getElementsByClassName('product-description')[0].innerText.toLowerCase();

                    // Check if the search term matches the product name or description
                    if (productName.includes(input) || productDescription.includes(input)) {
                        productItems[i].style.display = "";
                    } else {
                        productItems[i].style.display = "none";
                    }
                }
            }
        </script>
    </body>
    
</html>
