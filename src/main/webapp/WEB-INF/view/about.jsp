<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free Website Template" name="keywords">
        <meta content="Free Website Template" name="description">

        <link href="img/favicon.ico" rel="icon">

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="NavBar.jsp" %>

<div class="page-header" style="background-image: url('img/header-image.png'); background-size: cover; background-position: center;">

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>About Us</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">About Us</a>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="about">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="about-img">
                            <img src="img/about-image.jpg" alt="Image">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-content">
                            <div class="section-header">
                                <p>About Us</p>
                                <h2>Cooking Since 2000 </h2>
                            </div>
                            <div class="about-text">
                                <p>
                                    At ABC Restaurent, we have been delighting taste buds since 1990. What started as a small family venture has grown into a cherished local destination known for its fresh ingredients, passion for authentic flavors, and a warm, welcoming atmosphere.</p>
                                <p>
                                    For over three decades, we have blended culinary traditions with innovation, offering an unforgettable dining experience that celebrates both comfort food and contemporary dishes. From our hand-selected ingredients to the meticulous care we put into every dish, we believe that great food begins with passion and ends with shared memories.
                                </p>
                                <p> Whether you are a long-time guest or a new friend, we are committed to providing you with an exceptional meal and experience. Join us in celebrating our love for food, family, and community, and taste the difference that comes with cooking from the heart.</p>
                                <a class="btn custom-btn" href="booking">Book A Table</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@ include file="Footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <script src="js/main.js"></script>
    </body>
</html>
