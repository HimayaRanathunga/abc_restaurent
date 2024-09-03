<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.abc.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || (!"admin".equals(user.getRole()) && !"staff".equals(user.getRole()))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= user.getRole() %> Panel</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   
    <style>
        body {
            background: linear-gradient(135deg, #f8f9fa 50%, #ffffff 50%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-image: url('img/background1.jpg'); * Add the background image here */
            background-size: cover;
            background-position: center;
            color: #333;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 40px;
            font-weight: 700;
            font-size: 2.2em;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 12px;
            margin-bottom: 30px;
            padding: 20px;
            text-align: center;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-header {
            background: linear-gradient(135deg, #FF9874, #FF6235);
            color: white;
            padding: 15px;
            font-size: 20px;
            font-weight: 700;
            border-radius: 12px 12px 0 0;
        }

        .card-body {
            padding: 25px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
            text-transform: uppercase;
        }

        .btn-primary {
            background-color: #00aaff;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #008ecc;
            transform: translateY(-3px);
        }
        
        .btn-success {
            background-color: #FF9874;
            color: white;
            border: none;
        }

        .btn-success:hover {
            background-color: #FF8343;
            transform: translateY(-3px);
        }

        .btn-danger {
            background-color: #FF6235;
            color: white;
            border: none;
            margin-top: 20px;
        }

        .btn-danger:hover {
            background-color: #e53a1a;
            transform: translateY(-3px);
        }

        .management-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 25px;
        }

        .management-card {
            width: calc(33.33% - 25px);
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
        <h2> <i class="fas fa-user-cog"></i> <%= user.getRole() %> Panel</h2>
        <p>Welcome, <%= user.getUsername() %>! You are logged in as <%= user.getRole() %>.</p>

        <!-- Logout Button -->
        <a href="logout" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>

        <div class="management-section">
            <div class="management-card">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-hamburger"></i> Food Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="product" class="btn btn-primary"><i class="fas fa-eye"></i> View All Food</a>
                        <% if ("admin".equals(user.getRole())) { %>
                            <a href="product?action=new" class="btn btn-success mt-3"><i class="fas fa-plus"></i> Add New Food</a>
                        <% } %>
                    </div>
                </div>
            </div>

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

            <div class="management-card mt-4">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-box"></i> Order Management</h3>
                    </div>
                    <div class="card-body">
                        <a href="adminOrders" class="btn btn-primary">
                            <i class="fas fa-eye"></i> View All Orders
                        </a>
                    </div>
                </div>
            </div>

            <!-- Sections accessible only by admin -->
            <% if ("admin".equals(user.getRole())) { %>
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

                <div class="management-card">
                    <div class="card">
                        <div class="card-header">
                            <h3><i class="fas fa-tags"></i> Promotion Management</h3>
                        </div>
                        <div class="card-body">
                            <a href="promotions" class="btn btn-primary">
                                <i class="fas fa-eye"></i> View All Promotions
                            </a>
                            <a href="promotions?action=new" class="btn btn-success mt-3">
                                <i class="fas fa-plus"></i> Add New Promotion
                            </a>
                        </div>
                    </div>
                </div>

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

                <div class="management-card">
                    <div class="card">
                        <div class="card-header">
                            <h3><i class="fas fa-comments"></i> Feedback Management</h3>
                        </div>
                        <div class="card-body">
                            <a href="adminFeedback" class="btn btn-primary">
                                <i class="fas fa-eye"></i> View All Feedback
                            </a>
                        </div>
                    </div>
                </div>

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
            <% } %>
        </div>
    </div>
</body>
</html>
