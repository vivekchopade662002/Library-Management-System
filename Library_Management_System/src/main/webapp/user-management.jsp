<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.library.model.DBConnection" %>
<%
    // Check if user is logged in and is admin
    String userType = (String) session.getAttribute("userType");
    if (userType == null || !userType.equals("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - Library Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: #d1d5db;
            min-height: 100vh;
        }
        .navbar {
            background: rgba(0, 0, 0, 0.2) !important;
            backdrop-filter: blur(10px);
        }
        .card {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
        }
        .table {
            color: #d1d5db;
        }
        .table thead th {
            background: rgba(255, 255, 255, 0.04);
            color: #e2e8f0;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="admin-dashboard.jsp">Library Management System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="admin-dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-users me-2"></i>User Management</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user me-2"></i>Username</th>
                                <th><i class="fas fa-key me-2"></i>Role</th>
                                <th><i class="fas fa-cog me-2"></i>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try (Connection conn = DBConnection.getConnection()) {
                                    String sql = "SELECT users.username, " +
                                               "CASE WHEN admins.username IS NOT NULL THEN 'Admin' ELSE 'User' END as role " +
                                               "FROM users " +
                                               "LEFT JOIN admins ON users.username = admins.username";
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(sql);
                                    
                                    while(rs.next()) {
                                        String username = rs.getString("username");
                                        String role = rs.getString("role");
                            %>
                                <tr>
                                    <td><%= username %></td>
                                    <td><span class="badge bg-<%= role.equals("Admin") ? "danger" : "primary" %>"><%= role %></span></td>
                                    <td>
                                        <a href="DeleteUserServlet?username=<%= username %>" 
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('Are you sure you want to delete this user?')">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            <%
                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='3' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
