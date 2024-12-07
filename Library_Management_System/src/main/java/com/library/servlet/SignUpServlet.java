package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.library.model.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)")) {
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                response.sendRedirect("login.jsp?message=Registration successful! Please login.");
            } else {
                response.sendRedirect("signup.jsp?message=Registration failed! Please try again.");
            }
            
        } catch (SQLException e) {
            response.sendRedirect("signup.jsp?message=Error: " + e.getMessage());
        }
    }
}
