package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.model.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String loginType = request.getParameter("loginType");
        
        System.out.println("Login attempt - Type: " + loginType + ", Username: " + username);
        
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=Please enter both username and password");
            return;
        }

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("Database connection failed!");
                response.sendRedirect("login.jsp?error=Unable to connect to database");
                return;
            }

            boolean loginSuccessful = false;
            
            if ("admin".equals(loginType)) {
                System.out.println("Attempting admin login...");
                String adminSQL = "SELECT * FROM admins WHERE username = ? AND password = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(adminSQL)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    System.out.println("Executing admin query: " + adminSQL);
                    ResultSet rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        System.out.println("Admin login successful");
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        session.setAttribute("userType", "admin");
                        response.sendRedirect("admin-dashboard.jsp");
                        loginSuccessful = true;
                    } else {
                        System.out.println("Admin credentials not found");
                    }
                } catch (SQLException e) {
                    System.out.println("Admin login SQL error: " + e.getMessage());
                    e.printStackTrace();
                    response.sendRedirect("login.jsp?error=Admin login error: " + e.getMessage());
                    return;
                }
            } else if ("user".equals(loginType)) {
                System.out.println("Attempting user login...");
                String userSQL = "SELECT * FROM users WHERE username = ? AND password = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(userSQL)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    System.out.println("Executing user query: " + userSQL);
                    ResultSet rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        System.out.println("User login successful");
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        session.setAttribute("userType", "user");
                        response.sendRedirect("home.jsp");
                        loginSuccessful = true;
                    } else {
                        System.out.println("User credentials not found");
                    }
                } catch (SQLException e) {
                    System.out.println("User login SQL error: " + e.getMessage());
                    e.printStackTrace();
                    response.sendRedirect("login.jsp?error=User login error: " + e.getMessage());
                    return;
                }
            }
            
            if (!loginSuccessful) {
                String errorMessage = "admin".equals(loginType) ? 
                    "Invalid admin credentials" : "Invalid user credentials";
                System.out.println("Login failed: " + errorMessage);
                response.sendRedirect("login.jsp?error=" + errorMessage);
            }
            
        } catch (Exception e) {
            System.out.println("General error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
