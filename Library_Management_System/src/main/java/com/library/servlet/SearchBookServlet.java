package com.library.servlet;
import java.io.*;
import com.library.model.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/SearchBookServlet")
public class SearchBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("bookId");
        String bookName = request.getParameter("bookName");
        
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps;
            
            if (bookId != null && !bookId.trim().isEmpty()) {
                // Search by ID
                ps = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
                ps.setInt(1, Integer.parseInt(bookId));
            } else if (bookName != null && !bookName.trim().isEmpty()) {
                // Search by name
                ps = conn.prepareStatement("SELECT * FROM books WHERE name LIKE ?");
                ps.setString(1, "%" + bookName + "%");
            } else {
                // No search criteria provided
                response.sendRedirect("search.jsp");
                return;
            }
            
            ResultSet rs = ps.executeQuery();
            
            // Forward to the search results page
            request.setAttribute("searchResults", rs);
            request.getRequestDispatcher("searchResults.jsp").forward(request, response);
            
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (NumberFormatException e) {
            // Invalid book ID format
            request.setAttribute("error", "Invalid Book ID format");
            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
    }
}
