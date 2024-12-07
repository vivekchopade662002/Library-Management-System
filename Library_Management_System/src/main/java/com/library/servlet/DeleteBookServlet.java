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

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        boolean deleted = false;
        
        try (Connection conn = DBConnection.getConnection()) {
            // Delete by ID
            if (id != null && !id.trim().isEmpty()) {
                try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM books WHERE id = ?")) {
                    stmt.setInt(1, Integer.parseInt(id));
                    deleted = stmt.executeUpdate() > 0;
                }
            }
            // Delete by Name
            else if (name != null && !name.trim().isEmpty()) {
                try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM books WHERE name = ?")) {
                    stmt.setString(1, name);
                    deleted = stmt.executeUpdate() > 0;
                }
            }
            
            if (deleted) {
                request.setAttribute("message", "Book deleted successfully!");
                request.setAttribute("messageClass", "success");
            } else {
                request.setAttribute("message", "Book not found or could not be deleted.");
                request.setAttribute("messageClass", "error");
            }
            
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageClass", "error");
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid book ID format.");
            request.setAttribute("messageClass", "error");
        }
        
        response.sendRedirect("admin-dashboard.jsp");
    }
}
