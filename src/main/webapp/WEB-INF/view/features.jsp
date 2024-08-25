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


        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="NavBar.jsp" %>

        <!-- Page Header Start -->

        <div class="page-header" style="background-image: url('img/image03.jpeg'); background-size: cover; background-position: center;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Why Choose Us</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Features</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Feature Start -->
        <div class="feature">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="section-header">
                            <p>Why Choose Us</p>
                            <h2>Our Key Features</h2>
                        </div>
                        <div class="feature-text">
                            <div class="feature-img">
                                <div class="row">
                                    <div class="col-6">
                                        <img src="img/feature-1.jpg" alt="Image">
                                    </div>
                                    <div class="col-6">
                                        <img src="img/feature-2.jpg" alt="Image">
                                    </div>
                                    <div class="col-6">
                                        <img src="img/feature-3.jpg" alt="Image">
                                    </div>
                                    <div class="col-6">
                                        <img src="img/feature-4.jpg" alt="Image">
                                    </div>
                                </div>
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet consec adipis elit. Phasel nec preti mi. Curabit facilis ornare velit non vulputa. Aliquam metus tortor, auctor id gravida condime, viverra quis sem. Curabit non nisl nec nisi sceleri maximus 
                            </p>
                            <a class="btn custom-btn" href="booking">Book A Table</a>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="row">
                            <!-- Display the list of features from the database -->
                            <c:forEach var="feature" items="${featureList}">
                                <div class="col-lg-6">
                                    <div class="feature-item">
                                        <!-- Display the icon (or image) for the feature -->
                                        <img src="${feature.icon}" alt="${feature.title}" width="50">
                                        <h3>${feature.title}</h3>
                                        <p>${feature.description}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feature End -->
        
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
