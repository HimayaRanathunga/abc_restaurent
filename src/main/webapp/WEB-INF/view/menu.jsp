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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-search"></i> <!-- Font Awesome Search Icon -->
                </span>
                <input type="text" id="searchInput" class="form-control" placeholder="Search for products..." onkeyup="filterProducts()">
            </div>
        </div>
    </div>
</div>

<!-- Menu Start -->
<div class="menu py-5">
    <div class="container">
        <div class="menu-tab">
            <div class="tab-content">
                <div id="burgers" class="container tab-pane active">
                    <div class="row" id="productList">
                        <c:forEach var="product" items="${productList}">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="product-item">
                                    <div class="menu-item card border-0 shadow-sm h-100">
                                        <div class="menu-img position-relative">
                                            <img src="${product.imageUrl}" alt="${product.name}" class="img-fluid card-img-top">
                                            <div class="overlay d-flex justify-content-center align-items-center">
                                                <button class="btn btn-light add-to-cart-btn">Quick View</button>
                                            </div>
                                        </div>
                                        <div class="menu-text p-4 text-center">
                                            <h3 class="product-name">${product.name}</h3>
                                            <p class="text-muted">${product.description}</p>
                                            <strong class="product-price text-primary">${product.price} LKR</strong>
                                            <form action="cart" method="get" class="mt-3">
                                                <input type="hidden" name="action" value="addToCart">
                                                <input type="hidden" name="productId" value="${product.productId}">
                                                <!-- Quantity input field with a default value of 1 -->
                                                <div class="form-group d-flex justify-content-center">
                                                    <label for="quantity-${product.productId}" class="mr-2">Qty:</label>
                                                    <input type="number" id="quantity-${product.productId}" name="quantity" value="1" min="1" class="form-control" style="width: 60px; text-align: center;">
                                                </div>
                                                <button type="submit" class="btn btn-primary mt-2 w-100">Add to Cart</button>
                                            </form>
                                        </div>
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

<!-- Custom CSS for Enhancements -->
<style>
.menu {
    background-color: #f0f4f7; /* Softer background for better contrast */
    padding: 50px 0; /* Increase padding for a more spacious layout */
}

.menu-item {
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    border-radius: 10px; /* Softer corners */
    background-color: #fff; /* Add background color to menu items */
    overflow: hidden; /* Ensure any overflow is hidden */
}

.menu-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15); /* Increase shadow depth on hover */
}


.menu-img {
    position: relative;
    overflow: hidden;
    border-radius: 10px; /* Match with the container's border radius */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.menu-img img {
    width: 100%;
    height: auto;
    transition: transform 0.4s ease, filter 0.4s ease; 
    border-radius: inherit;
}

.menu-img:hover img {
    filter: grayscale(0%); 
    transform: scale(1.05); /* Slight zoom for a subtle hover effect */
}


.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); /* More contrast on overlay */
    opacity: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: opacity 0.4s ease, transform 0.3s ease;
}

.menu-item:hover .overlay {
    opacity: 1; /* Show overlay on hover */
}

.add-to-cart-btn {
    background-color: rgba(255, 255, 255, 0.9);
    border: none;
    padding: 10px 15px;
    transition: background-color 0.3s ease, color 0.3s ease;
}
.add-to-cart-btn:hover {
    background-color: #007bff;
    color: #fff;
}

.menu-text {
    padding: 20px;
    text-align: center;
}
    .product-name {
    font-size: 1.3rem; /* Slightly larger for emphasis */
    color: #333;
    margin-bottom: 10px;
    font-weight: 600;
    }

    .product-description {
    font-size: 1rem; /* More legible size */
    color: #666;
    margin-bottom: 15px;
    }

    .product-price {
    font-size: 1.2rem;
    font-weight: 700; /* Make price more prominent */
    color: #e74c3c;
    }

    .btn-primary {
       background-color: #28a745;
    border-color: #28a745;
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .btn-primary:hover {
        background-color: #218838;
        transform: scale(1.02);
    }

    @media (max-width: 768px) {
    .menu-text {
        padding: 15px;
    }

    .product-item {
        margin-bottom: 20px;
    }

    .btn-primary {
        font-size: 14px;
    }

    .product-name {
        font-size: 1.1rem;
    }

    .product-description {
        font-size: 0.9rem;
    }

    .product-price {
        font-size: 1.1rem;
    }
    }
</style>


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
