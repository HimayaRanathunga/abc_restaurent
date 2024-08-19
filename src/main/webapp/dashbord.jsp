<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.abc.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Admin Panel</h2>
        <p>Welcome, <%= user.getUsername() %>! You are logged in as <%= user.getRole() %>.</p>

        <div class="card mt-4">
            <div class="card-header">
                <h3>User Management</h3>
            </div>
            <div class="card-body">
                <a href="user" class="btn btn-primary">View All Users</a>
                <a href="register.jsp" class="btn btn-success">Add New User</a>
            </div>
        </div>

		 <div class="card mt-4">
            <div class="card-header">
                <h3>Food Management</h3>
            </div>
            <div class="card-body">
               <a href="product" class="btn btn-primary">View All Food</a>
                <a href="product?action=new" class="btn btn-success">Add New Food</a>
            </div>
        </div>
        
        <div class="card mt-4">
            <div class="card-header">
                <h3>Reservation Management</h3>
            </div>
            <div class="card-body">
                <a href="adminBooking" class="btn btn-primary">View All Reservations</a>
            </div>
        </div>
        
        <div class="card mt-4">
            <div class="card-header">
                <h3>Gallery Management</h3>
            </div>
            <div class="card-body">
                <a href="gallery" class="btn btn-primary">View All Gallery</a>
                <a href="gallery?action=new" class="btn btn-success">Add New Gallery</a>
            </div>
        </div>

        <a href="index" class="btn btn-danger mt-4">Logout</a>
    </div>
</body>
</html>
