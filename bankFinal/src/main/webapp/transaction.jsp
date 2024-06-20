<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #333;
            background-image: url(bg1.png);
    background-size: cover;
        }
        h1 {
            color: #007bff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        .custom-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Hover effect for all buttons */
        .custom-button:hover {
            background-color: #0056b3;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .Home a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff; /* Button background color */
            color: #fff; /* Button text color */
            text-decoration: none;
            border-radius: 5px;
        }

        .Home a:hover {
            background-color: #0056b3; /* Hover background color */
        }
        button{
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff; /* Button background color */
            color: #fff; /* Button text color */
            text-decoration: none;
            border-radius: 5px;
        }


        .print-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .print-button:hover {
            background-color: #0056b3;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Style for input fields */
        input[type="text"] {
            padding: 10px; /* Adjust the padding as needed */
            border: 1px solid #ccc; /* Border color */
            border-radius: 10px; /* Rounded corners */
            font-size: 16px; /* Font size */
            width: 12%; /* Full width */
            box-sizing: border-box; /* Include padding and border in width */
            margin-bottom: 10px; /* Add spacing between input fields */
        }

        /* Style for buttons */
        button[type="submit"] {
            padding: 10px 20px; /* Adjust padding as needed */
            border: none; /* Remove default button border */
            border-radius: 10px; /* Rounded corners */
            background-color: #007bff; /* Button background color */
            color: #fff; /* Button text color */
            font-size: 16px; /* Font size */
            cursor: pointer; /* Add pointer cursor on hover */
        }

        /* Hover effect for buttons */
        button[type="submit"]:hover {
            background-color: #0056b3; /* Darker shade of button background color */
        }

        /* Style for select element */
        select {
            padding: 10px; /* Adjust the padding as needed */
            border: 1px solid #ccc; /* Border color */
            border-radius: 10px; /* Rounded corners */
            font-size: 16px; /* Font size */
            width: 12%; /* Full width */
            box-sizing: border-box; /* Include padding and border in width */
            margin-bottom: 10px; /* Add spacing below the select element */
            background-color: #fff; /* Background color */
            color: #333; /* Text color */
            cursor: pointer; /* Add pointer cursor on hover */
        }

        /* Hover effect for select element */
        select:hover {
            border-color: #007bff; /* Change border color on hover */
        }
        .trans{
        margin: 20px;
        padding: 20px;
        color:white;
        
        
        }
        #transactionTable{
        color:black}
               .Home1 {
            font-size: 14px;
            color: white;
            margin-top: 10px;
        }
        
    </style>
</head>

<body>
<div class="trans">
<h1>Transaction Page</h1>
<h3 class="page__name text__color">Welcome, <%= session.getAttribute("full_name") %></h3>


<%-- Import necessary Java classes --%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>

<%-- Database connection parameters --%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<%-- Define database connection parameters --%>
<%!
    String JDBC_URL = "jdbc:mysql://localhost:3306/bank2";
    String JDBC_USERNAME = "root";
    String JDBC_PASSWORD = "Saurabh@19091";
%>

<%-- Fetch name and date of birth from the database --%>
<% String fullName = "";
   String dob = "";
   String accountno="";
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
               accountno=userDetailsResult.getString("account_number");
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
<p>Acoount Number: <%=  accountNumber%></p>
<%-- Display updated balance --%>
<p>Balance: <%= session.getAttribute("balance") %></p>



<form action="Trans" method="post" onsubmit="return validateTransaction()">

    <label for="transactionType">Transaction Type:</label>
    <select name="transactionType" id="transactionType">
        <option value="Deposit">Deposit</option>
        <option value="Withdrawal">Withdrawal</option>
        <option value="Delete">Delete Account</option>
    </select><br>
    <label for="amount">Amount:</label>
    <input type="text" step="0.01" name="amount" id="amount">
    <p> Note: Please Write DELETE to delete the Acoount</p>
    <br>
     
    <button type="submit" name="submit" value="Deposit">Deposit</button>
    <button type="submit" name="submit" value="Withdrawal">Withdraw</button>
    <!-- Inside the form -->
<button type="submit" name="submit" value="Delete">Delete Account</button>
    
</form>

<br>

<%-- Display transactions from the database --%>
<table id="transactionTable" border="1">
    <tr>
        <th>Transaction ID</th>
        <th>Account Number</th>
        <th>Date</th>
        <th>Transaction Type</th>
        <th>Amount</th>
    </tr>
    <% 
    double totalAmount = 0;
    double balance = 0;
    boolean balanceError = false;
    if (accountNumber != null) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String initialBalanceSql = "SELECT balance FROM balance WHERE account_number = ?";
            PreparedStatement initialBalanceStatement = connection.prepareStatement(initialBalanceSql);
            initialBalanceStatement.setString(1, accountNumber);
            ResultSet initialBalanceResult = initialBalanceStatement.executeQuery();
            double initialBalance = 0;
            if (initialBalanceResult.next()) {
                initialBalance = initialBalanceResult.getDouble("balance");
                balance = initialBalance;
            }

            String sql = "SELECT * FROM transactions WHERE account_number = ? ORDER BY date";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                String transactionAccountNumber = rs.getString("account_number");
                String transactionType = rs.getString("transaction_type");
                double amount = rs.getDouble("amount");
                java.sql.Timestamp date = rs.getTimestamp("date");

                // Update balance based on transaction type
                if (transactionType.equals("Deposit")) {
                    balance += amount;
                } else if (transactionType.equals("Withdrawal")) {
                    balance -= amount;
                }

                // Display the transaction in the table with row color based on transaction type
                %>
                <tr style="background-color: <%= transactionType.equals("Deposit") ? "#ffffff" : "#cccccc" %>;">
                    <td><%= transactionId %></td>
                    <td><%= transactionAccountNumber %></td>
                    <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date) %></td>
                    <td><%= transactionType %></td>
                    <td><%= amount %></td>
                </tr>
                <%
                // Calculate total amount
                totalAmount += amount;
            }

            // Update balance in the balance table
            String updateBalanceSql = "UPDATE balance SET balance = ? WHERE account_number = ?";
            PreparedStatement updateBalanceStatement = connection.prepareStatement(updateBalanceSql);
            updateBalanceStatement.setDouble(1, balance);
            updateBalanceStatement.setString(2, accountNumber);
            updateBalanceStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle other database errors if needed
            out.println("Database Error: " + e.getMessage());
        }
    } else {
        out.println("Account number not found in session. Please log in again.");
    }
    %>
</table>

<br>
<%-- Display total amount and closing balance --%>

<p>Balance: <%= balance %></p>



<p class="Home"><a href="customerdash.jsp">Home</a></p>

<button type="button" onclick="printContent()">Print</button>


<!-- JavaScript function to print the content -->
<!-- JavaScript function to handle transaction submission and display pop-up -->
<!-- JavaScript function to handle balance error and display pop-up -->
<!-- JavaScript function to handle transaction submission and display pop-up -->
<script>
function printContent() {
    var name = "<p>Name: <%= fullName %></p>";
    var dob = "<p>Date of Birth: <%= dob %></p>";
    var Account_number="<p>Acoount Number: <%=  accountNumber%></p>";
    var totalAmountHTML = "<p>Total Amount: <%= balance %></p>";

    var transactionTableHTML = document.getElementById("transactionTable").outerHTML;
    var printContent = name + dob + Account_number + totalAmountHTML  + transactionTableHTML;
    var originalContent = document.body.innerHTML;
    document.body.innerHTML = printContent;
    window.print();
    document.body.innerHTML = originalContent;
}
    function validateTransaction() {
        var amount = parseFloat(document.getElementById("amount").value);
        var balance = <%= balance %>;
        var transactionType = document.getElementById("transactionType").value;
        
        if (transactionType === "Withdrawal" && amount > balance) {
            alert("Transaction not allowed. Amount exceeds available balance.");
            return false;
        }
        
        if (amount <= 0) {
            alert("Amount must be greater than zero.");
            return false;
        }
        if (transactionType === "Delete" && balance !== 0) {
            alert("You are not authorized to fill out this form. Please contact the college or a nearby authorized cyber cafe for assistance.");
            return false;
        }
        
        return true;
    }
</script>
</div>


</body>
</html>
