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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   
    <!-- Custom CSS -->
    <style>
        /* General Styling */
        body {
            background: #1e90ff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            max-width: 1200px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .card {
            background-color: #f7f7f7;
            border-radius: 10px;
            margin-bottom: 20px;
            padding: 20px;
            text-align: center;
            border: none;
        }

        .card-header {
            background-color: #00aaff;
            color: white;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
        }

        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #00aaff;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #008ecc;
        }
        
        .btn-success {
            background-color: #28a745;
            color: white;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
            margin-top: 20px;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .management-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
        }

        .management-card {
            width: calc(33.33% - 20px);
            flex-grow: 1;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .management-section {
                flex-direction: column;
                align-items: center;
            }

            .management-card {
                width: 100%;
            }
        }
    </style>

</head>
<body>
    <div class="container">
        <h2> <i class="fas fa-user-cog"></i> Admin Panel</h2>
        <p>Welcome, <%= user.getUsername() %>! You are logged in as <%= user.getRole() %>.</p>

        <!-- Logout Button -->
        <a href="index" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>

  <div class="management-section">
            <!-- User Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-users"></i> User Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="user" class="btn btn-primary"><i class="fas fa-eye"></i> View All Users</a>
                        <a href="register.jsp" class="btn btn-success mt-3"><i class="fas fa-user-plus"></i> Add New User</a>
                    </div>
                </div>
            </div>

            <!-- Food Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-hamburger"></i> Food Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="product" class="btn btn-primary"><i class="fas fa-eye"></i> View All Food</a>
                        <a href="product?action=new" class="btn btn-success mt-3"><i class="fas fa-plus"></i> Add New Food</a>
                    </div>
                </div>
            </div>

            <!-- Reservation Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-calendar-alt"></i> Reservation Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="adminBooking" class="btn btn-primary"><i class="fas fa-eye"></i> View All Reservations</a>
                    </div>
                </div>
            </div>

            <!-- Feature Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-tools"></i> Feature Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="featuresadmin" class="btn btn-primary"><i class="fas fa-eye"></i> View All Features</a>
                        <a href="featuresadmin?action=new" class="btn btn-success mt-3"><i class="fas fa-plus"></i> Add New Feature</a>
                    </div>
                </div>
            </div>

            <!-- Gallery Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-images"></i> Gallery Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="gallery" class="btn btn-primary"><i class="fas fa-eye"></i> View All Galleries</a>
                        <a href="gallery?action=new" class="btn btn-success mt-3"><i class="fas fa-plus"></i> Add New Gallery</a>
                    </div>
                </div>
            </div>

            <!-- Checkout Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-shopping-cart"></i> Checkout Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="checkout" class="btn btn-primary"><i class="fas fa-eye"></i> View All Checkouts</a>
                    </div>
                </div>
            </div>

            <!-- Message Management -->
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-envelope"></i> Message Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="adminmessages" class="btn btn-primary"><i class="fas fa-eye"></i> View All Messages</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>