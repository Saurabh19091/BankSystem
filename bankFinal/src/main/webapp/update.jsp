<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
// Get customer ID from request parameter
String customerId = request.getParameter("id");

// Database connection parameters
String jdbcUrl = "jdbc:mysql://localhost:3306/bank2";
String jdbcUsername = "root";
String jdbcPassword = "Saurabh@19091";

Connection conn = null;
PreparedStatement stmt = null;

try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

    // Retrieve customer details based on customer ID
    String sql = "SELECT * FROM customers WHERE id=?";
    stmt = conn.prepareStatement(sql);
    stmt.setString(1, customerId);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // Customer details
        String fullName = rs.getString("full_name");
        String mobileNo = rs.getString("mobile_no");
        String email = rs.getString("email");
        // Add more fields as needed

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer Details</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    /* CSS for Dynamic Button */
.dynamic-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-decoration: none; /* Remove default link underline */
}

.dynamic-button:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Update Customer Details</h2>
        <form action="" method="post">
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" class="form-control" id="fullName" name="full_name" value="<%= fullName %>">
            </div>
            <div class="form-group">
                <label for="mobileNo">Mobile Number:</label>
                <input type="text" class="form-control" id="mobileNo" name="mobile_no" value="<%= mobileNo %>">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" id="email" name="email" value="<%= email %>">
            </div>
            <!-- Add more fields here -->
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="admin.jsp" class="btn btn-primary">Home</a>
            
            
            
        </form>
    </div>
</body>
</html>
<%
    } else {
        out.println("Customer not found!");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

// Process the form submission
if (request.getMethod().equals("POST")) {
    // Get form parameters
    String fullName = request.getParameter("full_name");
    String mobileNo = request.getParameter("mobile_no");
    String email = request.getParameter("email");
    // Get more form parameters as needed

    try {
        // Establish database connection
        conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

        // Update SQL query
        String updateSql = "UPDATE customers SET full_name=?, mobile_no=?, email=? WHERE id=?";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setString(1, fullName);
        updateStmt.setString(2, mobileNo);
        updateStmt.setString(3, email);
        // Set more parameters as needed
        updateStmt.setString(4, customerId);

        // Execute the update query
        int rowsAffected = updateStmt.executeUpdate();

        // Redirect to a confirmation page or display a message
        if (rowsAffected > 0) {
            out.println("<p>Customer details updated successfully!</p>");
        } else {
            out.println("<p>Failed to update customer details.</p>");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>
