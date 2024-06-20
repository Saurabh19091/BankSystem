package com.Servlet;




import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import com.apna.util.DBUtil;

@SuppressWarnings("serial")
@WebServlet("/addCus")
public class addcus extends HttpServlet {
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String email = request.getParameter("email");
        String accountType = request.getParameter("accountType");
        double initialBalance = Double.parseDouble(request.getParameter("initialBalance"));
        String dob = request.getParameter("dob");
        String idProof = request.getParameter("idProof");

        // Validate mobile number length
        if (mobileNo.length() != 10) {
            String errorMessage = "Mobile number must be exactly 10 digits!";
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("window.location.href='/bankFinal/admin.jsp';");
            out.println("</script>");
            return;
        }

        // Validate email format
        if (!email.contains("@")) {
            String errorMessage = "Invalid email format!";
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("window.location.href='/bankFinal/admin.jsp';");
            out.println("</script>");
            return;
        }


        // Check if mobile number or email already exists
        if (isDuplicate(mobileNo, email)) {
            String message = "User with the same mobile number or email already exists!";
            request.setAttribute("errorMessage", message);
            request.getRequestDispatcher("/duplicate.jsp").forward(request, response);
            return;
        }

        // Check if ID proof is duplicate
        if (isIdProofDuplicate(idProof)) {
            String message = "ID proof already exists!";
            request.setAttribute("errorMessage", message);
            request.getRequestDispatcher("/duplicate.jsp").forward(request, response);
            return;
        }

        // Database connection and insertion
        try (Connection connection = DBUtil.getConn()) {
            String sql = "INSERT INTO customers (full_name, address, mobile_no, email, account_type, account_number, temporary_password, initial_balance, dob, id_proof) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, fullName);
            statement.setString(2, address);
            statement.setString(3, mobileNo);
            statement.setString(4, email);
            statement.setString(5, accountType);
            // Generate random account number
            String accountNumber = generateRandomAccountNumber();
            statement.setString(6, accountNumber);
            // Generate random temporary password
            String temporaryPassword = generateRandomPassword();
            statement.setString(7, temporaryPassword);
            statement.setDouble(8, initialBalance);
            statement.setString(9, dob);
            statement.setString(10, idProof);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                String successMessage = "Customer Registration Successful. <br> Account Number: " + accountNumber + ",<br> Temporary Password: " + temporaryPassword;
                request.setAttribute("successMessage", successMessage);
                request.getRequestDispatcher("/success.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Error storing customer registration data');</script>");
            out.println("</body></html>");
        }
    }

    // Method to check if mobile number or email already exists
    private boolean isDuplicate(String mobileNo, String email) {
        try (Connection connection = DBUtil.getConn()) {
            String sql = "SELECT COUNT(*) AS count FROM customers WHERE mobile_no = ? OR email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, mobileNo);
            statement.setString(2, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to check if ID proof already exists
    private boolean isIdProofDuplicate(String idProof) {
        try (Connection connection = DBUtil.getConn()) {
            String sql = "SELECT COUNT(*) AS count FROM customers WHERE id_proof = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, idProof);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to generate a random 12-digit account number
    private String generateRandomAccountNumber() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 12; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }

    // Method to generate a random alphanumeric temporary password
    private String generateRandomPassword() {
        int length = 8;
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }
}
