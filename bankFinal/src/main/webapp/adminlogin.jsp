<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    background-image: url(bg1.png);
    background-size: cover;
}

.container {
    width: 300px;
    height: auto; /* Let the height adjust based on content */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(12, 12, 12, 0.5);
    
}

.container img {
    width: 100px;
    height: 100px;
    display: block;
    margin: 0 auto; /* Center the image horizontally */
    margin-bottom: 20px; /* Add some space below the image */
}

h2 {
    margin-bottom: 30px;
}

label {
    display: block;
    margin-bottom: 10px;
}

input[type="text"],
input[type="password"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline-color: #007bff;
}

input[type="submit"] {
    width: 40%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    align-items: center;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}
        .show-password-icon {
            position: absolute;
            top: calc(50% - -81px);
            right: 34px;
            color: #555;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .show-password-icon:hover {
            color: #333;
        }


    </style>
</head>
<body>
    <div class="container">
        <img src="admin_logo.png" alt="">
        <form action="login" method="POST">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
             <div class="wrap-icons">
            <label for="password">Password:</label>
            <i class="fas fa-eye show-password-icon" id="showPassword"></i>
            
            </div>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
    </div>
    
        <script>
        const passwordField = document.getElementById('password');
        const showPasswordButton = document.getElementById('showPassword');

        showPasswordButton.addEventListener('click', function() {
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                showPasswordButton.classList.remove('fa-eye');
                showPasswordButton.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                showPasswordButton.classList.remove('fa-eye-slash');
                showPasswordButton.classList.add('fa-eye');
            }
        });
    </script>
    
</body>
</html>
