<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #007bff, #00c6ff); /* Gradient background */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            max-width: 500px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-10px); /* Lift effect on hover */
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15); /* Elevated shadow on hover */
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
            font-size: 2.5rem; /* Larger heading */
            font-weight: 600;
            position: relative;
        }

        h2::before {
            content: '';
            position: absolute;
            width: 100px;
            height: 4px;
            background: #007bff;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        /* Input Fields */
        .form-control {
            border-radius: 30px;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Blue shadow on focus */
        }

        /* Dropdown Menu */
        .form-control-select {
            padding: 12px;
            border-radius: 30px;
        }

        /* Button Styling */
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 30px;
            padding: 12px 20px;
            font-size: 1.2rem;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-5px); /* Lift on hover */
        }

        .btn {
            position: relative;
            z-index: 1;
            color: white;
            font-weight: 600;
        }

        /* Form Label */
        label {
            font-weight: 500;
            color: #343a40;
            margin-bottom: 10px;
        }

        /* Additional Responsive Adjustments */
        @media (max-width: 576px) {
            .container {
                padding: 30px;
            }

            h2 {
                font-size: 2rem;
            }

            .btn-primary {
                padding: 10px;
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Register</h2>
        <form action="register" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            <!-- Role Selection Dropdown -->
            <div class="form-group">
                <label for="role">Role:</label>
                <select class="form-control form-control-select" id="role" name="role" required>
                    <option value="customer">Customer</option>
                    <option value="staff">Staff</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
</body>
</html>
