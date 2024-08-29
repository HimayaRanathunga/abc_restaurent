<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Restaurant Menu" name="keywords">
    <meta content="A professional and refined menu view for a restaurant website." name="description">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <%@ include file="NavBar.jsp" %>

    <!-- Page Header Start -->
    <div class="page-header text-center" style="background-image: url('img/image04.jpg'); background-size: cover; background-position: center;">
        <div class="container">
            <h2 class="text-white">Our Menu</h2>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Search Bar Start -->
    <div class="container mt-4 mb-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="input-group">
                    <span class="input-group-text bg-white border-right-0">
                        <i class="fas fa-search"></i>
                    </span>
                    <input type="text" id="searchInput" class="form-control border-left-0" placeholder="Search for products..." onkeyup="filterProducts()">
                </div>
            </div>
        </div>
    </div>
    <!-- Search Bar End -->

    <!-- Menu Start -->
    <div class="menu py-5 bg-light">
        <div class="container">
            <div class="row" id="productList">
                <c:forEach var="product" items="${productList}">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                        <div class="card product-item border-0 shadow-sm h-100">
                            <div class="position-relative">
                                <img src="${product.imageUrl}" alt="${product.name}" class="img-fluid card-img-top small-img">
                                <div class="overlay d-flex justify-content-center align-items-center">
                                    
                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h4 class="product-name font-weight-bold">${product.name}</h4>
                                <p class="text-muted small">${product.description}</p>
                                <strong class="product-price ">${product.price} LKR</strong>
                                <form action="cart" method="get" class="mt-3">
                                    <input type="hidden" name="action" value="addToCart">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <div class="form-group d-flex justify-content-center">
                                        <label for="quantity-${product.productId}" class="mr-2">Qty:</label>
                                        <input type="number" id="quantity-${product.productId}" name="quantity" value="1" min="1" class="form-control" style="width: 60px; text-align: center;">
                                    </div>
                                    <button type="submit" class="btn btn-warning mt-2 w-100">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
            var input = document.getElementById('searchInput').value.toLowerCase();
            var productItems = document.getElementsByClassName('product-item');

            for (var i = 0; i < productItems.length; i++) {
                var productName = productItems[i].getElementsByClassName('product-name')[0].innerText.toLowerCase();
                var productDescription = productItems[i].getElementsByClassName('text-muted')[0].innerText.toLowerCase();

                if (productName.includes(input) || productDescription.includes(input)) {
                    productItems[i].parentElement.style.display = "";
                } else {
                    productItems[i].parentElement.style.display = "none";
                }
            }
        }
    </script>

    <!-- Custom CSS -->
    <style>
        /* General Styling */
        .menu {
            padding: 50px 0;
            background-color: #f8f9fa;
        }

        .card {
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .small-img {
            height: 180px; /* Smaller height for a professional look */
            object-fit: cover; /* Maintain aspect ratio */
            transition: transform 0.3s ease;
        }

        .card-body {
            padding: 15px;
        }

        .product-name {
            font-size: 1.1rem;
            color: #333;
        }

        .product-price {
            font-size: 1.2rem;
            color: #007bff;
            font-weight: bold;
        }

        .text-muted {
            font-size: 0.9rem;
        }

        /* Hover Effects */
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .card:hover .small-img {
            transform: scale(1.05);
        }

        .card:hover .overlay {
            opacity: 1;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            opacity: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: opacity 0.3s ease;
            border-radius: inherit;
        }

        .add-to-cart-btn {
            background-color: #fff;
            border: none;
            padding: 8px 16px;
            font-size: 0.9rem;
            color: #333;
            transition: all 0.3s ease;
        }

        .add-to-cart-btn:hover {
            background-color: #007bff;
            color: #fff;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .product-name {
                font-size: 1rem;
            }

            .product-price {
                font-size: 1.1rem;
            }

            .small-img {
                height: 150px;
            }
        }
    </style>
</body>
</html>
