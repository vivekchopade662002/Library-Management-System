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
import jakarta.servlet.http.HttpSession;

@WebServlet("/PurchaseBookServlet")
public class PurchaseBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String bookName = request.getParameter("bookName");
        double price = Double.parseDouble(request.getParameter("price"));

        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                throw new SQLException("Failed to connect to database");
            }
            
            String sql = "INSERT INTO purchase_history (username, book_id, book_name, price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setInt(2, bookId);
                pstmt.setString(3, bookName);
                pstmt.setDouble(4, price);
                
                pstmt.executeUpdate();
                response.sendRedirect("purchase-books.jsp?message=Book purchased successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("purchase-books.jsp?error=" + e.getMessage());
        }
    }
}
