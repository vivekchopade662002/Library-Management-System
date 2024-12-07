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

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    
    // Handle the search request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");
        
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM books WHERE " + 
                        (searchType.equals("id") ? "id = ?" : "name = ?");
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                if (searchType.equals("id")) {
                    stmt.setInt(1, Integer.parseInt(searchValue));
                } else {
                    stmt.setString(1, searchValue);
                }
                
                ResultSet rs = stmt.executeQuery();
                
                if (rs.next()) {
                    String url = String.format("update.jsp?bookFound=true&id=%s&name=%s&author=%s&price=%s",
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("author"),
                        rs.getString("price"));
                    response.sendRedirect(url);
                } else {
                    response.sendRedirect("update.jsp?message=Book not found!");
                }
            }
        } catch (SQLException e) {
            response.sendRedirect("update.jsp?message=Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            response.sendRedirect("update.jsp?message=Invalid ID format!");
        }
    }
    
    // Handle the update request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        
        StringBuilder sql = new StringBuilder("UPDATE books SET");
        boolean needsComma = false;
        
        // Only update fields that were filled in
        if (name != null && !name.trim().isEmpty()) {
            sql.append(" name = ?");
            needsComma = true;
        }
        if (author != null && !author.trim().isEmpty()) {
            if (needsComma) sql.append(",");
            sql.append(" author = ?");
            needsComma = true;
        }
        if (price != null && !price.trim().isEmpty()) {
            if (needsComma) sql.append(",");
            sql.append(" price = ?");
        }
        sql.append(" WHERE id = ?");
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            if (name != null && !name.trim().isEmpty()) {
                stmt.setString(paramIndex++, name);
            }
            if (author != null && !author.trim().isEmpty()) {
                stmt.setString(paramIndex++, author);
            }
            if (price != null && !price.trim().isEmpty()) {
                stmt.setDouble(paramIndex++, Double.parseDouble(price));
            }
            stmt.setInt(paramIndex, Integer.parseInt(id));
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                response.sendRedirect("update.jsp?message=Book updated successfully!");
            } else {
                response.sendRedirect("update.jsp?message=Book not found!");
            }
            
        } catch (SQLException e) {
            response.sendRedirect("update.jsp?message=Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            response.sendRedirect("update.jsp?message=Invalid number format!");
        }
    }
}
