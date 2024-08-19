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
    <!-- Custom CSS -->
    <style>
        /* General Styling */
        body {
            background: linear-gradient(135deg, #f0f4f8, #00bfff); /* Vibrant background */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1); /* Depth shadow */
            max-width: 1000px;
            width: 100%;
            transition: all 0.3s ease;
            position: relative;
            animation: fade-in 0.8s ease-in-out;
        }

        @keyframes fade-in {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 2.5rem;
            letter-spacing: 1px;
            font-weight: 600;
            position: relative;
        }

        h2::before {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background: #00bfff;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        p {
            text-align: center;
            color: #57606f;
            font-size: 1.2rem; /* Better readability */
            margin-bottom: 40px;
        }

        /* Card Styling */
        .card {
            display: flex;
            flex-direction: row;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15); /* Elevation on hover */
        }

        .card-header {
            background-color: #00bfff;
            color: white;
            border-radius: 15px 0 0 15px;
            padding: 25px;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30%;
            transition: background-color 0.3s ease;
        }

        .card-header:hover {
            background-color: #0099cc;
        }

        .card-body {
            padding: 30px;
            width: 70%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* Button Styling */
        .btn-primary,
        .btn-success,
        .btn-danger {
            border-radius: 50px;
            padding: 12px 20px;
            font-size: 1.1rem;
            text-transform: uppercase;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(0, 191, 255, 0.3); /* Soft shadow */
        }

        .btn-primary {
            background-color: #00bfff;
            border: none;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0099cc;
            transform: translateY(-5px); /* Lift on hover */
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            color: white;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-5px);
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-5px);
        }

        a {
            text-decoration: none;
            color: inherit;
            position: relative;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #00bfff;
        }

        /* Hover glow effect for buttons */
        .btn-primary::after,
        .btn-success::after,
        .btn-danger::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            z-index: 0;
            transition: opacity 0.3s ease;
            opacity: 0;
            border-radius: 50px;
        }

        .btn-primary:hover::after,
        .btn-success:hover::after,
        .btn-danger:hover::after {
            opacity: 1;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
            }

            h2 {
                font-size: 2rem;
            }

            .card {
                flex-direction: column;
            }

            .card-header {
                border-radius: 15px 15px 0 0;
                width: 100%;
                padding: 20px;
                font-size: 1.4rem;
            }

            .card-body {
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Panel</h2>
        <p>Welcome, <%= user.getUsername() %>! You are logged in as <%= user.getRole() %>.</p>

        <!-- User Management Section -->
        <div class="card">
            <div class="card-header">
                <h3>User Management</h3>
            </div>
            <div class="card-body">
                <a href="user" class="btn btn-primary">View All Users</a>
                <a href="register.jsp" class="btn btn-success mt-3">Add New User</a>
            </div>
        </div>

        <!-- Food Management Section -->
        <div class="card">
            <div class="card-header">
                <h3>Food Management</h3>
            </div>
            <div class="card-body">
                <a href="product" class="btn btn-primary">View All Food</a>
                <a href="product?action=new" class="btn btn-success mt-3">Add New Food</a>
            </div>
        </div>
        
        <!-- Reservation Management Section -->
        <div class="card">
            <div class="card-header">
                <h3>Reservation Management</h3>
            </div>
            <div class="card-body">
                <a href="adminBooking" class="btn btn-primary">View All Reservations</a>
            </div>
        </div>
        
        
         <div class="card">
            <div class="card-header">
                <h3>Feature Management</h3>
            </div>
            <div class="card-body">
                <a href="featuresadmin" class="btn btn-primary">View All Feature</a>
                <a href="featuresadmin?action=new" class="btn btn-success mt-3">Add New Feature</a>
            </div>
        </div>
        
        
        <!-- Gallery Management Section -->
        <div class="card">
            <div class="card-header">
                <h3>Gallery Management</h3>
            </div>
            <div class="card-body">
                <a href="gallery" class="btn btn-primary">View All Gallery</a>
                <a href="gallery?action=new" class="btn btn-success mt-3">Add New Gallery</a>
            </div>
        </div>
        
        
        <div class="card">
            <div class="card-header">
                <h3>Message Management</h3>
            </div>
            <div class="card-body">
                <a href="adminmessages" class="btn btn-primary">View All Message</a>
              
            </div>
        </div>

        <!-- Logout Button -->
        <a href="index" class="btn btn-danger mt-4">Logout</a>
    </div>
</body>
</html>
