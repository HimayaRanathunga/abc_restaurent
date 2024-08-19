<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center"><c:out value="${product != null ? 'Edit Product' : 'Add Product'}" /></h2>
    
    <!-- Form with validation -->
    <form action="product?action=${product != null ? 'update' : 'insert'}" method="post" enctype="multipart/form-data" class="mt-4 needs-validation" novalidate>
        <input type="hidden" name="productId" value="${product != null ? product.productId : ''}" />
        
        <!-- Hidden field to store current image URL -->
        <c:if test="${product != null}">
            <input type="hidden" name="currentImageUrl" value="${product.imageUrl}" />
        </c:if>

        <!-- Name Field with required validation -->
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${product != null ? product.name : ''}" required>
            <div class="invalid-feedback">
                Please provide a product name.
            </div>
        </div>

        <!-- Description Field with required validation -->
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${product != null ? product.description : ''}</textarea>
            <div class="invalid-feedback">
                Please provide a product description.
            </div>
        </div>

        <!-- Price Field with required and numeric validation -->
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" class="form-control" id="price" name="price" min="0" step="0.01" value="${product != null ? product.price : ''}" required>
            <div class="invalid-feedback">
                Please provide a valid price (positive number).
            </div>
        </div>

        <!-- Image Upload -->
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" class="form-control-file" id="image" name="image">
            <c:if test="${product != null}">
                <img src="${product.imageUrl}" width="100" class="img-fluid mt-2" />
            </c:if>
        </div>

        <button type="submit" class="btn btn-success">Submit</button>
    </form>
</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- JavaScript for Bootstrap form validation -->
<script>
    // Bootstrap validation example
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

</body>
</html>
