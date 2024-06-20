<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <style>
        .nav{
          background-color: #f2f2f2;
    border: 1px solid lightgray;
    width: 25%;
    height: 100%;
        }
        
.main{
    display: flex;
    gap:30px;
}


/* Container styles */
.container1, .container2, .container3, .container4 {
    background-color: #f2f2f2;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 20px;
    margin-top:30px;
   
    flex-basis: 50%; /* Two containers per row */
}

.welcome-bar {
    background: linear-gradient(to right, #2196F3, #ffffff);/* to Pink gradient */
    padding: 10px;
    text-align: center;
    color: black;
    font-weight:bold; /* Text color */
}



.nav {
    background: linear-gradient(to right, #2196F3, #ffffff); /*to Pink gradient */
    border: none;
    width: 250px;
    height: auto;
    overflow-y: auto;
}
.page__name {
    margin-top: 10px;
}

/* Button styles */
button {
    padding: 10px 20px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background-color: #007bff;
    color: white;
}

button:hover {
    background-color: #0056b3;
}
/* Additional styles */
.ownblog {
    width: 100%;
    height: 25%;
    text-align: center;
    padding: 50px;
    font-size: 200%;
    font-family: "Sofia", sans-serif;
    font-weight: 500;
}

.nav2 a {
    text-decoration: none;
    text-align: left;
    padding: 15px;
    padding-left: 10px;
    color:black;
    font-weight:bold;
}

.home, .profile, .message, .setting, .photo {
    padding: 20px;
    font-size: large;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-weight: 500;
}

.icon {
    font-size: large;
    padding-right: 5px;
}

.footer1 {
    font-family: 'Times New Roman', Times, serif;
    font-weight: 500;
    font-size: 110%;
}

.menu1 {
    background-color: #f2f2f2;
    width: 50px;
    height: 50px;
    text-align: right;
    padding: 10px;
    font-size: 200%;
    font-family: "Sofia", sans-serif;
    font-weight: 500;
    margin-left: 75%;
    margin-top: 60%;
    cursor: pointer;
}

.heading {
    text-align: left;
    padding: 50px;
    width: 100%;
    background-color: rgb(165, 165, 202);
    margin-top: 0%;
}

img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    align-items: center;
}
        
    </style>
    <title>first page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="welcome-bar">
      <h3>Welcome, <%= session.getAttribute("full_name") %></h3>
  </div>
  <div class="main">
    <ul class="nav flex-column">
        <li class="nav-item ownblog">
          <img src="login.jpeg" alt="">
          
          
          </href>
        </li>
        <div class="nav2">
          <ul>
          <a href="customerdash.jsp">
            <div class="home">
          
          <span class="text home-outline">Dashboard</span>
          </a>   
           </div>
           <div class="profile">
          <a href="transaction.jsp"> 
          
            <span class="text">Transactions</span></a>
          </div>
        
          <div class="photo">
            <a href="#">
                <span class="text">Deposit</span></a>
             </a>
            </div>
            <div class="photo ">
                <a href="withdraw.jsp">
                    <span class="text">Withdraw</span></a>
                 </a>
                </div>
        <div class="setting">
          <a href="logout.jsp"></span>
          <span class="text">Logout</span></a></div>
          
         
         
          </ul>
          <!-- link for icon "ionicons"-->
          <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
          <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>   
       </ul>

          <!-- part2 -->
          
          <div class="container container3">
            <h2>Deposits Your Money</h2>
            <div class="transaction-container">
                <!-- Deposit table -->
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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

        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    
    </style>
</head>
<body>
    
    
    <%-- Form to deposit money --%>
    

    <%-- Import necessary Java classes --%>
    <%@ page import="java.sql.*, java.text.SimpleDateFormat" %>

    <%-- Database connection parameters --%>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.SQLException" %>

    <%-- Define database connection parameters --%>
    <%!
        String JDBC_URL = "jdbc:mysql://localhost:3306/bank2";
        String JDBC_USERNAME = "root";
        String JDBC_PASSWORD = "Saurabh@19091";
    %>

    <%-- Fetch user details from the database --%>
    <% String fullName = "";
       String dob = "";
       String accountNumber = (String) session.getAttribute("account_number");
       if (accountNumber != null) {
           try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
               String userDetailsSql = "SELECT full_name, dob FROM customers WHERE account_number = ?";
               PreparedStatement userDetailsStatement = connection.prepareStatement(userDetailsSql);
               userDetailsStatement.setString(1, accountNumber);
               ResultSet userDetailsResult = userDetailsStatement.executeQuery();
               if (userDetailsResult.next()) {
                   fullName = userDetailsResult.getString("full_name");
                   dob = userDetailsResult.getString("dob");
               }
           } catch (SQLException e) {
               e.printStackTrace();
               // Handle other database errors if needed
           }
       }
    %>

    <%-- Display user details from the database --%>
    <p>Name: <%= fullName %></p>
    <p>Date of Birth: <%= dob %></p>

    <%-- Deposit form --%>
    <form action="Depo" method="post">
        <label for="amount">Amount to Deposit:</label>
        <input type="number" step="0.01" name="amount" id="amount" required><br>
        <button type="submit">Deposit</button>
    </form>

    <%-- JavaScript function to print the content --%>
    <script>
        function printContent() {
            // Your print content function code here
        }
    </script>
</body>
</html>
                
          
