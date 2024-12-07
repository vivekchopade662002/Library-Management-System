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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        
        if (username != null && !username.trim().isEmpty()) {
            try (Connection conn = DBConnection.getConnection()) {
                // First check if the user exists
                String checkUserSQL = "SELECT COUNT(*) FROM users WHERE username = ?";
                try (PreparedStatement pstmtCheck = conn.prepareStatement(checkUserSQL)) {
                    pstmtCheck.setString(1, username);
                    var rs = pstmtCheck.executeQuery();
                    if (rs.next() && rs.getInt(1) == 0) {
                        response.sendRedirect("admin-dashboard.jsp?error=User not found");
                        return;
                    }
                }

                // Start transaction
                conn.setAutoCommit(false);
                try {
                    // First delete from admins table if user is an admin
                    String deleteAdminSQL = "DELETE FROM admins WHERE username = ?";
                    try (PreparedStatement pstmtAdmin = conn.prepareStatement(deleteAdminSQL)) {
                        pstmtAdmin.setString(1, username);
                        pstmtAdmin.executeUpdate();
                    }

                    // Then delete from users table
                    String deleteUserSQL = "DELETE FROM users WHERE username = ?";
                    try (PreparedStatement pstmtUser = conn.prepareStatement(deleteUserSQL)) {
                        pstmtUser.setString(1, username);
                        int rowsAffected = pstmtUser.executeUpdate();
                        
                        if (rowsAffected > 0) {
                            conn.commit();
                            response.sendRedirect("admin-dashboard.jsp?msg=User deleted successfully");
                        } else {
                            conn.rollback();
                            response.sendRedirect("admin-dashboard.jsp?error=Failed to delete user");
                        }
                    }
                } catch (SQLException e) {
                    conn.rollback();
                    throw e;
                } finally {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("admin-dashboard.jsp?error=Database error: " + e.getMessage());
            }
        } else {
            response.sendRedirect("admin-dashboard.jsp?error=Invalid username provided");
        }
    }
}
