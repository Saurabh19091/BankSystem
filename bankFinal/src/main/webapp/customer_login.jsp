<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="ok.png" sizes="80x80">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="./common/forms.css">
    <title>SIGN IN</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Merienda&family=Poppins&display=swap");

        /* Reset styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            font-family: "Poppins", sans-serif;
            background: #d7d4d5;
            overflow-x: hidden;
            background-image: url(bg1.png);
    background-size: cover;
        }

        /* Container styles */
        .container {
            position: relative;
            min-height: 95vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* User styles */
        .user {
            display: flex;
            position: relative;
            width: 800px;
            height: 560px;
            background-color: #fff;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 20px;
        }

        /* Image box styles */
        .imgBx {
            width: 50%;
            height: 100%;
            overflow: hidden;
        }

        .imgBx img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Form box styles */
        .formBx {
            width: 50%;
            height: 100%;
            background: #f9f7f7;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            border-radius: 0 20px 20px 0;
            box-shadow: 0 4px 8px rgba(15, 15, 15, 0.1);
        }

        /* Logo styles */
        .logo {
            font-family: "Merienda", cursive;
            letter-spacing: 2px;
            font-size: 28px;
            color: #fff;
            background-color: rgb(54, 54, 197);
            padding: 8px 10px;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        /* Form styles */
        form {
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        form h2 {
            font-size: 24px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 20px;
            color: #555;
        }

        /* Input styles */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: none;
            outline: none;
            border-radius: 5px;
            background: #f5f2f2;
            font-size: 16px;
            font-weight: 300;
            letter-spacing: 1px;
        }

        /* Submit button styles */
        input[type="submit"] {
            width: 100%;
            padding: 15px;
            border: none;
            outline: none;
            border-radius: 5px;
            background-color: #677eff;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #5567ff;
        }

        /* Home link styles */
        .Home a {
            text-decoration: none;
            font-size: 16px;
            color: #000;
            margin-top: 10px;
            display: block;
        }

        /* Note styles */
        .Home1 {
            font-size: 14px;
            color: #555;
            margin-top: 10px;
        }

        /* Show password icon styles */
        .show-password-icon {
            position: absolute;
            top: calc(50% - -47px);
            right: 52px;
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
    <section class="container">
        <div class="user signInBox">
            <div class="imgBx">
                <img src="ok.png" id="image" alt="">
            </div>
            <div class="formBx">
                <form action="loginc" method="POST">
                    <h3 class="logo">WelCome To Customer Portal</h3>
                    <h2>SIGN IN</h2>
                    <input required type="text" placeholder="Enter Account Number" name="acc" id="account_number">
                    <div class="wrap-icons">
                        <input required type="password" placeholder="Enter password" name="dob" id="password" autocomplete="off">
                        <i class="fas fa-eye show-password-icon" id="showPassword"></i>
                    </div>
                    <input type="submit" value="Login" class="login">
                    <div class="Home"><a href="cusindex.jsp">Home</a></div>
                    <div class="Home1"><a href="#">Note: Customers who log in for the first time use DOB as a Default Password</a></div>
                </form>
            </div>
        </div>
    </section>

    <!-- JavaScript for show/hide password functionality -->
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
