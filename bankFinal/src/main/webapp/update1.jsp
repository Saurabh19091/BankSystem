<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Your Profile</h1>
        <form action="UpdateCustomerServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= session.getAttribute("full_name") %>"><br>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" value="<%= session.getAttribute("mobile_no") %>"><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= session.getAttribute("email") %>"><br>
            <label for="id_proof">ID Proof:</label>
            <input type="text" id="id_proof" name="id_proof" value="<%= session.getAttribute("id_proof") %>"><br>
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="<%= session.getAttribute("dob") %>"><br>
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="4" cols="50"><%= session.getAttribute("address") %></textarea><br>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
