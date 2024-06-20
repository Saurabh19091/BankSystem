package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateCustomerServlet")
public class updateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String idProof = request.getParameter("id_proof");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");

        // Get session
        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("account_number");

        // Database connection parameters
        String JDBC_URL = "jdbc:mysql://localhost:3306/bank2";
        String JDBC_USERNAME = "root";
        String JDBC_PASSWORD = "Saurabh@19091"; // Change this to your actual database password

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            // Update customer details in the database
            String updateQuery = "UPDATE customers SET full_name=?, mobile_no=?, email=?, id_proof=?, dob=?, address=? WHERE account_number=?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, phone);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, idProof);
            preparedStatement.setString(5, dob);
            preparedStatement.setString(6, address);
            preparedStatement.setString(7, accountNumber);
            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated > 0) {
                // Update successful
            	 PrintWriter out = response.getWriter();
                 out.println("<script>alert('Customer details updated successfully!,Go and ReLogin');</script>");
                 out.println("<script>window.location.href='customerdash.jsp';</script>");
            } else {
                // Update failed
                response.getWriter().println("Failed to update customer details.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection errors
            response.getWriter().println("Database connection error: " + e.getMessage());
        }
    }
}
