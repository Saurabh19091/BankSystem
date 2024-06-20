package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/with")
public class withdraw extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double amount = Double.parseDouble(request.getParameter("amount"));

        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("account_number");

        if (accountNumber != null) {
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank2", "root",
                    "Saurabh@19091")) {
                // Insert withdrawal transaction into the database
                String insertSql = "INSERT INTO transactions (Account_Number, date, transaction_type, amount) VALUES (?, NOW(), ?, ?)";
                PreparedStatement insertStatement = connection.prepareStatement(insertSql);
                insertStatement.setString(1, accountNumber);
                insertStatement.setString(2, "withdrawal");
                insertStatement.setDouble(3, amount);
                insertStatement.executeUpdate();

                // Update initial_balance in customers table
                String initialBalanceUpdateSql = "UPDATE customers SET initial_balance = initial_balance - ? WHERE Account_Number = ?";
                PreparedStatement initialBalanceUpdateStatement = connection.prepareStatement(initialBalanceUpdateSql);
                initialBalanceUpdateStatement.setDouble(1, amount);
                initialBalanceUpdateStatement.setString(2, accountNumber);
                initialBalanceUpdateStatement.executeUpdate();

                // Retrieve updated balance from the database
                String balanceQuery = "SELECT initial_balance FROM customers WHERE Account_Number = ?";
                PreparedStatement balanceStatement = connection.prepareStatement(balanceQuery);
                balanceStatement.setString(1, accountNumber);
                ResultSet balanceResult = balanceStatement.executeQuery();
                if (balanceResult.next()) {
                    double updatedBalance = balanceResult.getDouble("initial_balance");
                    // Update session attribute with the updated balance
                    session.setAttribute("balance", updatedBalance);
                }

                response.sendRedirect("transaction.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle other database errors if needed
                response.getWriter().println("Database Error: " + e.getMessage());
            }
        } else {
            response.getWriter().println("Account number not found in session. Please log in again.");
        }
    }
}
