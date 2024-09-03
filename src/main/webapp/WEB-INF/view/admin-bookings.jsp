<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Bookings</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Manage Bookings</h2>

    <a href="dashbord.jsp" class="btn btn-primary mb-3">Back</a>

    <form action="adminBooking" method="get" class="form-inline mb-3">
        <input type="text" name="searchQuery" class="form-control mr-sm-2" placeholder="Search by name, email, or status" value="${param.searchQuery}">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

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

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Date</th>
            <th>Time</th>
            <th>Guests</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="booking" items="${bookings}">
            <tr>
                <td>${booking.bookingId}</td>
                <td>${booking.name}</td>
                <td>${booking.email}</td>
                <td>${booking.bookingDate}</td>
                <td>${booking.bookingTime}</td>
                <td>${booking.guestCount}</td>
                <td>${booking.status}</td>
                <td>
                    <form action="adminBooking" method="post" style="display: inline-block;">
                        <input type="hidden" name="bookingId" value="${booking.bookingId}">
                        <button class="btn btn-success" name="action" value="approve">Approve</button>
                    </form>
                    <form action="adminBooking" method="post" style="display: inline-block;">
                        <input type="hidden" name="bookingId" value="${booking.bookingId}">
                        <button class="btn btn-danger" name="action" value="reject">Reject</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
