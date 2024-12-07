package com.library.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session != null) {
            boolean isAdmin = session.getAttribute("isAdmin") != null && 
                            (Boolean) session.getAttribute("isAdmin");
            
            session.invalidate();
            
            if (isAdmin) {
                response.sendRedirect("adminlogin.jsp?message=Logged out successfully!");
            } else {
                response.sendRedirect("login.jsp?message=Logged out successfully!");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
