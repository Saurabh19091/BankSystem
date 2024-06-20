package com.apna.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    public static Connection getConn() throws SQLException {
        Connection connection = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection
            String url = "jdbc:mysql://localhost:3306/bank2";
            String username = "root";
            String password = "Saurabh@19091";
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions properly in a real application
        }
        return connection;
    }
}

