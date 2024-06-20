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
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/loginc")
public class logincus extends HttpServlet {
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
        String acNum = request.getParameter("acc");
        String dobStr = request.getParameter("dob");

        // Parse DOB string to Date object
        Date dob = null;
        try {
            dob = new SimpleDateFormat("yyyy-MM-dd").parse(dobStr);
        } catch (java.text.ParseException e) {
            // dobStr is not in date format; treat it as temporary password
            dob = null; // Setting dob to null to indicate it's not a valid date
        }

        // Database connection
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM customers WHERE account_number = ? AND (dob = ? OR temporary_password = ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, acNum);
            
            if (dob != null) {
                statement.setDate(2, new java.sql.Date(dob.getTime()));
            } else {
                statement.setNull(2, java.sql.Types.DATE); // Treat dob as null
            }
            
            statement.setString(3, dobStr); // Check for temporary password too

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Authentication successful, check if it's the first login ever
                boolean firstLogin = resultSet.getInt("first_login") == 1;
                
                

                // If it's the first login, update the database flag
                if (firstLogin) {
                    PreparedStatement updateStatement = connection.prepareStatement("UPDATE customers SET first_login = 0 WHERE account_number = ?");
                    updateStatement.setString(1, acNum);
                    updateStatement.executeUpdate();
                }

                // Store necessary details in session
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                
                session.setAttribute("id", resultSet.getString("id"));
                session.setAttribute("full_name", resultSet.getString("full_name"));
                session.setAttribute("address", resultSet.getString("address"));
                session.setAttribute("mobile_no", resultSet.getString("mobile_no"));
                session.setAttribute("email", resultSet.getString("email"));
                session.setAttribute("account_type", resultSet.getString("account_type"));
                session.setAttribute("account_number", resultSet.getString("account_number"));
                session.setAttribute("temporary_password", resultSet.getString("temporary_password"));
                session.setAttribute("initial_balance", resultSet.getDouble("initial_balance"));
                session.setAttribute("dob", resultSet.getString("dob"));
                session.setAttribute("id_proof", resultSet.getString("id_proof"));                
                // Set other attributes...

                // Redirect accordingly
                if (firstLogin) {
                    response.sendRedirect("forgot.jsp");
                } else {
                    response.sendRedirect("customerdash.jsp");
                }
            } else {
                // Authentication failed, redirect back to login page with error message
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Wrong Password');");
                out.println("window.location.href='customer_login.jsp';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during login process");
        }
    }

}
