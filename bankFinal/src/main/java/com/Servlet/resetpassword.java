package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/resetPassword")
public class resetpassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bank2";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Saurabh@19091";

    static {
        try {
            // Load MySQL JDBC driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new IllegalStateException("Failed to load MySQL JDBC driver: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("account_number");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("confirm-password");
        System.out.println("Account Number: " + accountNumber);
        System.out.println("New Password: " + newPassword);
        System.out.println("Confirm Password: " + confirmPassword);

        // Check if new password and confirm password match
        if (!newPassword.equals(confirmPassword)) {
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Passwords do not match');");
            out.println("window.location.href='forgot.jsp';");
            out.println("</script>");
            return;
        }

        // Database connection
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            // Retrieve old password from the database
            String sql = "SELECT temporary_password FROM customers WHERE account_number = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String oldPassword = resultSet.getString("temporary_password");

                // Update the password if old password matches
                sql = "UPDATE customers SET temporary_password = ? WHERE account_number = ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, newPassword);
                statement.setString(2, accountNumber);
                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
                    // Password reset successful
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Password reset successfully');");
                    out.println("window.location.href='forgot.jsp';");
                    out.println("</script>");
                } else {
                    // Incorrect old password
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Incorrect Old password');");
                    out.println("window.location.href='forgot.jsp';");
                    out.println("</script>");
                }
            } else {
                // Account not found
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Account not found');");
                out.println("window.location.href='forgot.jsp';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during password reset process");
        }
    }
}
