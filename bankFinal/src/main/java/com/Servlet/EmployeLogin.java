package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class EmployeLogin extends HttpServlet {
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
        String uemail = request.getParameter("email");
        String upass = request.getParameter("password");

        // Database connection
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM admin WHERE Email=? AND Password=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, uemail);
            statement.setString(2, upass);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // User found, store user's name in session
                String uname = resultSet.getString("Name");
                HttpSession session = request.getSession();
                session.setAttribute("username", uname);
                
                // Redirect to dashboard or any other page
                response.sendRedirect("admin.jsp");
            } else {
                // User not found, show error message
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h2>Login Failed</h2>");
                out.println("<p>Invalid email or password. Please try again.</p>");
                out.println("</body></html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing login request");
        }
    }
}
