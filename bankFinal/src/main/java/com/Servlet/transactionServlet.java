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
import java.sql.SQLException;

@WebServlet("/Trans")
public class transactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String transactionType = request.getParameter("transactionType");
        double amount = Double.parseDouble(request.getParameter("amount"));

        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("account_number");

        if (accountNumber != null) {
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank2", "root",
                    "Saurabh@19091")) {
                if (transactionType.equals("Delete")) {
                    // Delete account
                    String deleteSql = "DELETE FROM customers WHERE Account_Number = ?";
                    PreparedStatement deleteStatement = connection.prepareStatement(deleteSql);
                    deleteStatement.setString(1, accountNumber);
                    deleteStatement.executeUpdate();

                    // Show success message
                    response.setContentType("text/html");
                    response.getWriter().println("<html><head>");
                    response.getWriter().println("<title>Account Deleted</title>");
                    response.getWriter().println("</head><body>");
                    response.getWriter().println("<h2>Account Deleted Successfully</h2>");
                    response.getWriter().println("</body></html>");
                } else {
                    // Perform deposit or withdrawal transaction
                    // Your existing transaction handling code goes here

                    // Insert transaction into the database
                    String insertSql = "INSERT INTO transactions (Account_Number, date, transaction_type, amount) VALUES (?, NOW(), ?, ?)";
                    PreparedStatement insertStatement = connection.prepareStatement(insertSql);
                    insertStatement.setString(1, accountNumber);
                    insertStatement.setString(2, transactionType);
                    insertStatement.setDouble(3, amount);
                    insertStatement.executeUpdate();

                    // Update balance based on transaction type
                    String updateBalanceSql = "UPDATE customers SET initial_balance = initial_balance ";
                    if (transactionType.equals("Deposit")) {
                        updateBalanceSql += "+ ?";
                    } else if (transactionType.equals("Withdrawal")) {
                        updateBalanceSql += "- ?";
                    }
                    updateBalanceSql += " WHERE Account_Number = ?";
                    PreparedStatement updateBalanceStatement = connection.prepareStatement(updateBalanceSql);
                    updateBalanceStatement.setDouble(1, amount);
                    updateBalanceStatement.setString(2, accountNumber);
                    updateBalanceStatement.executeUpdate();

                    // Show success message
                    response.setContentType("text/html");
                    response.getWriter().println("<html><head>");
                    response.getWriter().println("<meta charset=\"UTF-8\">");
                    response.getWriter().println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
                    response.getWriter().println("<title>Transaction Status</title>");
                    response.getWriter().println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">");
                    response.getWriter().println("<style>");
                    response.getWriter().println(".modal-dialog { max-width: 400px; }"); // Adjust maximum width
                    response.getWriter().println(".modal-content { border-radius: 10px; }"); // Add border radius
                    response.getWriter().println(".modal-header { border-bottom: none; }"); // Remove border from header
                    response.getWriter().println(".modal-title { font-weight: bold; }"); // Set title font weight
                    response.getWriter().println(".modal-body { text-align: center; }"); // Center align content
                    response.getWriter().println("</style>");
                    response.getWriter().println("</head><body>");
                    response.getWriter().println("<div class=\"modal\" tabindex=\"-1\" role=\"dialog\" id=\"transactionStatusModal\">");
                    response.getWriter().println("<div class=\"modal-dialog\" role=\"document\">");
                    response.getWriter().println("<div class=\"modal-content\">");
                    response.getWriter().println("<div class=\"modal-header\">");
                    response.getWriter().println("<h5 class=\"modal-title\">Transaction Status</h5>");
                    response.getWriter().println("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>"); // Use Bootstrap close button
                    response.getWriter().println("</div>");
                    response.getWriter().println("<div class=\"modal-body\">");
                    response.getWriter().println("<p>" + transactionType + " successful!</p>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("<div class=\"modal-footer\">");
                    response.getWriter().println("<button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>"); // Use Bootstrap button style
                    response.getWriter().println("</div>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>");
                    response.getWriter().println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\"></script>");
                    response.getWriter().println("<script>$(document).ready(function() { $('#transactionStatusModal').modal('show'); });</script>");
                    response.getWriter().println("</body></html>");
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
                // Handle other database errors if needed
            }
        } else {
            response.getWriter().println("Account number not found in session. Please log in again.");
        }
        response.sendRedirect("transaction.jsp");
    }
    
}