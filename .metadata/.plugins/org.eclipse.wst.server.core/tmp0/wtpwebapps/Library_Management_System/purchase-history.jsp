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
    <title>Purchase History - Library Management System</title>
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
        .price-badge {
            background: rgba(52, 211, 153, 0.1);
            color: #34d399;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-weight: 500;
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
                <h4 class="mb-0"><i class="fas fa-history me-2"></i>Purchase History</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user me-2"></i>Username</th>
                                <th><i class="fas fa-hashtag me-2"></i>Book ID</th>
                                <th><i class="fas fa-book me-2"></i>Book Name</th>
                                <th><i class="fas fa-calendar me-2"></i>Purchase Date</th>
                                <th><i class="fas fa-tag me-2"></i>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try (Connection conn = DBConnection.getConnection()) {
                                    String sql = "SELECT ph.*, b.name as book_name FROM purchase_history ph " +
                                               "JOIN books b ON ph.book_id = b.id " +
                                               "ORDER BY ph.purchase_date DESC";
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(sql);
                                    
                                    while(rs.next()) {
                                        String username = rs.getString("username");
                                        int bookId = rs.getInt("book_id");
                                        String bookName = rs.getString("book_name");
                                        double price = rs.getDouble("price");
                                        Timestamp purchaseDate = rs.getTimestamp("purchase_date");
                            %>
                                <tr>
                                    <td><%= username %></td>
                                    <td>#<%= bookId %></td>
                                    <td><%= bookName %></td>
                                    <td><%= purchaseDate %></td>
                                    <td><span class="price-badge">$<%= String.format("%.2f", price) %></span></td>
                                </tr>
                            <%
                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
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
