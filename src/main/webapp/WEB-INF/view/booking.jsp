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
        
            <div class="page-header" style="background-image: url('img/image2.jpeg'); background-size: cover; background-position: center;">
         
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Book A Table</h2>
                    </div>
                    <div class="col-12">
                        <a href="index.jsp">Home</a>
                        <a href="booking.jsp">Booking</a>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success" role="alert">
                ${successMessage}
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

        <div class="booking">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-7">
                        <div class="booking-content">
                            <div class="section-header">
                                <h1>Book A Table</h1>
                                <h3>Book Your Table For Private Dinners & Happy Hours</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="booking-form">
                            <form action="booking" method="POST">
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" name="name" class="form-control" placeholder="Name" required />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="far fa-user"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="email" name="email" class="form-control" placeholder="Email" required />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="far fa-envelope"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" name="mobile" class="form-control" placeholder="Mobile" required />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="fa fa-mobile-alt"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="input-group date">
                                        <input type="date" name="date" class="form-control" required />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="input-group time">
                                        <input type="time" name="time" class="form-control" required />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="far fa-clock"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="input-group">
                                        <select class="custom-select form-control" name="guest" required>
                                            <option selected>Guest</option>
                                            <option value="1">1 Guest</option>
                                            <option value="2">2 Guests</option>
                                            <option value="3">3 Guests</option>
                                            <option value="4">4 Guests</option>
                                            <option value="5">5 Guests</option>
                                        </select>
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="fa fa-chevron-down"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button class="btn custom-btn" type="submit">Book Now</button>
                                </div>
                            </form>
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
