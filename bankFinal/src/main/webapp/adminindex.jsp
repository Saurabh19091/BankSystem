<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url(/herobg.png);
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .image-box {
            text-align: center;
            margin-bottom: 20px;
        }
        .image-box img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            height: 400px;
            width: 1000px;
        }
        .login-options {
            text-align: center;
        }
        .login-options a {
            display: inline-block;
            text-decoration: none;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            transition: background-color 0.3s;
        }
        .login-options a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-box">
            <img src="admin_bg.png" alt="Banking Application Image">
        </div>
        <div class="login-options">
            <a href="adminlogin.jsp">Admin Login</a>
        </div>
    </div>
</body>
</html>
