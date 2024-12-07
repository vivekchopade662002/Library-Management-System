package com.library.servlet;
import java.io.*;
import com.library.model.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AddBookServlet: Starting to process request");
        
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Get parameters
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String author = request.getParameter("author");
            String priceStr = request.getParameter("price");
            
            System.out.println("Received parameters - ID: " + idStr + ", Name: " + name + ", Author: " + author + ", Price: " + priceStr);

            // Parse ID and price
            int id = Integer.parseInt(idStr);
            double price = Double.parseDouble(priceStr);
            
            // Get database connection
            conn = DBConnection.getConnection();
            System.out.println("Database connection established");

            // Insert the book
            String sql = "INSERT INTO books (id, name, author, price) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, author);
            ps.setDouble(4, price);
            
            System.out.println("Executing SQL: " + sql);
            int result = ps.executeUpdate();
            System.out.println("SQL execution complete. Rows affected: " + result);

            if (result > 0) {
                System.out.println("Book added successfully");
                response.sendRedirect("viewbooks.jsp?message=Book added successfully!");
            } else {
                System.out.println("No rows affected");
                response.sendRedirect("addbook.jsp?error=Failed to add book");
            }

        } catch (NumberFormatException e) {
            System.out.println("Invalid number format: " + e.getMessage());
            response.sendRedirect("addbook.jsp?error=Please enter valid numbers for ID and price");
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("addbook.jsp?error=Database error: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("addbook.jsp?error=Error: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
                System.out.println("Resources closed");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
