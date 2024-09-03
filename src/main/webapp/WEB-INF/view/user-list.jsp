<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: #f8f9fa; /* Light grey background for modern look */
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            margin-top: 40px;
        }

        h2 {
            color: #343a40;
            font-weight: 600;
            font-size: 2rem;
            margin-bottom: 30px;
            position: relative;
        }

        h2::before {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background: #007bff;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 30px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .table {
            margin-top: 20px;
        }

        .table thead {
            background-color: #343a40;
            color: #fff;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-danger {
            border-radius: 30px;
            padding: 5px 15px;
            transition: transform 0.3s ease;
        }

        .btn-danger:hover {
            transform: translateY(-3px);
        }

        /* Additional table row hover effect */
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">User List</h2>
    <a href="dashbord.jsp" class="btn btn-primary mb-3">Back</a>
    
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td>
                        <a href="user?action=delete&userId=${user.userId}" class="btn btn-danger btn-sm" 
                           onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
