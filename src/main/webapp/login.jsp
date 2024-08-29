<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS for styling -->
    <style>
        body {
            background-image: url('img/carousel-1.jpg');
            background-size: cover; 
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Roboto', sans-serif;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }

        .form-control {
            border-radius: 30px;
            padding: 10px 20px;
            box-shadow: none;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn-primary {
            background-color: #ff6f00;
            border-color: white;
            border-radius: 30px;
            padding: 10px 20px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #ffe5b4;
        }

        .btn-primary:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        .mt-2 {
            text-align: center;
        }

        .mt-2 a {
            color: #ff6f00;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .mt-2 a:hover {
            color: #0056b3;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <p class="mt-2">Don't have an account? <a href="registerCustommer.jsp">Register</a></p>
        </form>
    </div>
</body>
</html>
