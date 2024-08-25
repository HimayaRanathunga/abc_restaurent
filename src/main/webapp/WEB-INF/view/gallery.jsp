<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free Website Template" name="keywords">
        <meta content="Free Website Template" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="NavBar.jsp" %>
        
        <!-- Page Header Start -->
            <div class="page-header" style="background-image: url('img/image06.jpg'); background-size: cover; background-position: center;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Gallery</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
        
        <!-- Blog Start -->
        <div class="blog">
            <div class="container">
              
                <div class="row">
                 <c:forEach var="gallery" items="${galleries}">
                    <div class="col-md-6">
                        <div class="blog-item">
                            <div class="blog-img">
                                <img  src="${gallery.imageUrl}" alt="Blog">
                            </div>
                            <div class="blog-content">
                                <h2 class="blog-title">${gallery.title}</h2>
                              
                                <div class="blog-text">
                                    <p>
                                        ${gallery.description}
                                        
                                    </p>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    
                    
                </div>
                
            </div>
        </div>
        <!-- Blog End -->
        
        <%@ include file="Footer.jsp" %>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
