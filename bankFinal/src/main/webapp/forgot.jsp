<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            position: relative;
        }
        input[type="password"]::after {
            content: "\f070";
            font-family: "Font Awesome 5 Free";
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }
        input[type="password"].show-password::after {
            content: "\f06e";
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Password Reset</h2>
        <form action="resetPassword" method="post" onsubmit="return validatePasswords()">
            <input type="hidden" name="account_number" value="<%= session.getAttribute("account_number") %>">
            <label for="old-password">Old Password</label>
            <input type="password" id="old-password" name="old-password" required>

            <label for="new-password">New Password</label>
            <input type="password" id="new-password" name="new-password" required>

            <label for="confirm-password">Confirm New Password</label>
            <input type="password" id="confirm-password" name="confirm-password" required>
            <span id="password-mismatch" class="error-message"></span>
            <input type="submit" value="Reset Password">
        </form>
    </div>

    <script>
        // Function to toggle password visibility
        function togglePasswordVisibility(inputId) {
            var input = document.getElementById(inputId);
            input.type = input.type === "password" ? "text" : "password";
            input.classList.toggle("show-password");
        }

        // Function to validate passwords
        function validatePasswords() {
            var newPassword = document.getElementById('new-password').value;
            var confirmPassword = document.getElementById('confirm-password').value;
            var errorMessageElement = document.getElementById('password-mismatch');
            
            if (newPassword !== confirmPassword) {
                errorMessageElement.textContent = 'New passwords do not match';
                return false; // Prevent form submission
            } else {
                errorMessageElement.textContent = '';
                return true; // Allow form submission
            }
        }
    </script>
</body>
</html>
