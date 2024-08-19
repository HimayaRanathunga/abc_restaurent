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
        background-color: #f8f9fa;
    }

    .menu-item {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .menu-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }

    .menu-img {
    position: relative;
    overflow: hidden;
    border-radius: 15px; 
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12); 
    transition: box-shadow 0.3s ease, transform 0.4s ease;
    }

    .menu-img img {
    width: 100%;
    height: auto;
    transition: transform 0.4s ease, filter 0.4s ease; 
    border-radius: inherit; 
    }

    .menu-img:hover {
    transform: scale(1.05); 
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
    }

    .menu-img:hover img {
    filter: grayscale(0%); 
    transform: scale(1.1); 
    }

.menu-img:hover .overlay {
    opacity: 1;
    transform: scale(1); /* Ensures the overlay scales perfectly with the image */
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); /* Slightly darker overlay with 60% opacity */
    opacity: 0;
    transition: opacity 0.4s ease, transform 0.4s ease; /* Smooth transition for the overlay */
    display: flex;
    justify-content: center;
    align-items: center;
    transform: scale(1.1); /* Start with a larger scale for smooth appearance on hover */
}

.overlay .add-to-cart-btn {
    font-size: 14px;
    background-color: rgba(255, 255, 255, 0.8);
    border: none;
    padding: 10px 20px; /* Larger padding for better visibility */
    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition for button hover effect */
}

.overlay .add-to-cart-btn:hover {
    background-color: #007bff;
    color: #fff;
}

.menu-img:hover .overlay {
    opacity: 1;
    transition: opacity 0.4s ease-in-out;
}


.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Dark overlay with transparency */
    opacity: 0;
    transition: opacity 0.4s ease, transform 0.4s ease; /* Smooth transition for the overlay */
    display: flex;
    justify-content: center;
    align-items: center;
}



    .product-name {
        font-size: 1.2rem;
        color: #333;
    }

    .product-description {
        font-size: 0.9rem;
        color: #777;
    }

    .product-price {
        font-size: 1.1rem;
        font-weight: 600;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #2ecc71  ;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #2ecc71 ;
    }

    @media (max-width: 768px) {
        .menu-text {
            padding: 20px;
        }

        .product-item {
            margin-bottom: 20px;
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
