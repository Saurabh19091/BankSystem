<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Page</title>
</head>
<body>
    <h1>Transaction Page</h1>

    <%-- Import necessary Java classes --%>
    <%@ page import="java.sql.*, java.text.SimpleDateFormat" %>

</head>
<body>
    <h1>Transaction Page</h1>

    <%-- Import necessary Java classes --%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>

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

    <%-- Check if form is submitted --%>
    <% if (request.getMethod().equals("POST")) { %>
        <%-- Retrieve form data --%>
        <% String transactionType = request.getParameter("transactionType");
           double amount = Double.parseDouble(request.getParameter("amount"));

           // Retrieve account number from session
           String accountNumber = (String) session.getAttribute("account_number");

           if (accountNumber != null) {
               // Insert transaction into the database
               try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                   // Insert transaction
                   String insertSql = "INSERT INTO transactions (Account_Number, date, transaction_type, amount) VALUES (?, NOW(), ?, ?)";
                   PreparedStatement insertStatement = connection.prepareStatement(insertSql);
                   insertStatement.setString(1, accountNumber);
                   insertStatement.setString(2, transactionType);
                   insertStatement.setDouble(3, amount);
                   insertStatement.executeUpdate();

                   // Update initial_balance in customers table
                   String initialBalanceUpdateSql = "UPDATE customers SET initial_balance = ? WHERE Account_Number = ?";
                   PreparedStatement initialBalanceUpdateStatement = connection.prepareStatement(initialBalanceUpdateSql);
                   initialBalanceUpdateStatement.setDouble(1, (transactionType.equals("Deposit") ? amount : -amount));
                   initialBalanceUpdateStatement.setString(2, accountNumber);
                   initialBalanceUpdateStatement.executeUpdate();
               } catch (SQLException e) {
                   e.printStackTrace();
                   // Handle other database errors if needed
               }
           } else {
               out.println("Account number not found in session. Please log in again.");
           }
        %>
    <% } %>

    <%-- Fetch name and date of birth from the database --%>
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

    <form action="" method="post">
        <label for="transactionType">Transaction Type:</label>
        <select name="transactionType" id="transactionType">
            <option value="Deposit">Deposit</option>
            <option value="Withdrawal">Withdrawal</option>
        </select><br>
        <label for="amount">Amount:</label>
        <input type="number" step="0.01" name="amount" id="amount"><br>
        <button type="submit" name="submit" value="deposit">Deposit</button>
        <button type="submit" name="submit" value="withdraw">Withdraw</button>
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
            <th>Closing Balance</th>
        </tr>
        <% double totalAmount = 0;
           double balance = 0;
           if (accountNumber != null) {
               try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                   // Fetch initial_balance from customers table
                   String initialBalanceSql = "SELECT initial_balance FROM customers WHERE account_number = ?";
                   PreparedStatement initialBalanceStatement = connection.prepareStatement(initialBalanceSql);
                   initialBalanceStatement.setString(1, accountNumber);
                   ResultSet initialBalanceResult = initialBalanceStatement.executeQuery();
                   double initialBalance = 0;
                   if (initialBalanceResult.next()) {
                       initialBalance = initialBalanceResult.getDouble("initial_balance");
                   }

                   // Calculate total amount and balance
                   String sql = "SELECT * FROM transactions WHERE account_number = ? ORDER BY date";
                   PreparedStatement statement = connection.prepareStatement(sql);
                   statement.setString(1, accountNumber);
                   ResultSet rs = statement.executeQuery();
                   while (rs.next()) {
                       int transactionId = rs.getInt("transaction_id");
                       String transactionAccountNumber = rs.getString("account_number");
                       String transactionType = rs.getString("transaction_type");
                       double amount = rs.getDouble("amount");
                       Timestamp date = rs.getTimestamp("date");

                       // Calculate closing balance
                       balance += (transactionType.equals("Deposit") ? amount : -amount);

                       // Display the transaction in the table
                       %>
                       <tr>
                           <td><%= transactionId %></td>
                           <td><%= transactionAccountNumber %></td>
                           <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date) %></td>
                           <td><%= transactionType %></td>
                           <td><%= amount %></td>
                           <td><%= balance %></td>
                       </tr>
                       <%
                       // Calculate total amount
                       totalAmount += (transactionType.equals("Deposit") ? amount : -amount);
                   }
                   // Update initial_balance in session
                   session.setAttribute("initialBalance", initialBalance);
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
    <p>Total Amount: <%= totalAmount %></p>
    <p>Closing Balance: <%= balance %></p>

    <!-- JavaScript function to print the page -->
    <script>
        function printPage() {
            window.print();
        }
    </script>
</body>
</html>
