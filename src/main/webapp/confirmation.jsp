<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation & Feedback</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .confirmation-container {
            background-color: #fff;
            border-radius: 10px;
            padding: 40px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .confirmation-icon {
            font-size: 50px;
            color: #28a745;
            margin-bottom: 20px;
        }
        .confirmation-title {
            font-size: 28px;
            color: #333;
            margin-bottom: 15px;
            font-weight: bold;
        }
        .confirmation-text {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }
        .back-home-btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin-bottom: 20px;
        }
        .back-home-btn:hover {
            background-color: #0056b3;
        }
        .feedback-form {
            text-align: left;
            margin-top: 30px;
        }
        .feedback-form h4 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
            font-weight: bold;
        }
        .feedback-form .form-group {
            margin-bottom: 15px;
        }
        .feedback-form .btn-primary {
            background-color: #28a745;
            border: none;
        }
        .feedback-form .btn-primary:hover {
            background-color: #218838;
        }
    </style>

    <!-- Meta tag for automatic redirection after 5 seconds -->
    <meta http-equiv="refresh" content="5;url=index.jsp">
</head>
<body>
    <div class="confirmation-container">
        <div class="confirmation-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <div class="confirmation-title">Thank You for Your Order!</div>
        <div class="confirmation-text">
            Your order has been placed successfully. We appreciate your business!
            <br><br>
            You will be redirected to the homepage in 5 seconds.
        </div>
        <a href="index" class="back-home-btn">Back to Home</a>

        
        
    </div>
</body>
</html>
