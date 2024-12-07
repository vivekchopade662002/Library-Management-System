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
    <title>Book Management - Library Management System</title>
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
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0"><i class="fas fa-book me-2"></i>Book Management</h4>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBookModal">
                        <i class="fas fa-plus me-2"></i>Add New Book
                    </button>
                </div>
            </div>
            <div class="card-body">
                <!-- Search Box -->
                <div class="mb-4">
                    <div class="input-group">
                        <input type="text" id="searchBook" class="form-control" placeholder="Search books...">
                        <button class="btn btn-outline-secondary" type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
                
                <!-- Books Table -->
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                <th><i class="fas fa-book me-2"></i>Name</th>
                                <th><i class="fas fa-user me-2"></i>Author</th>
                                <th><i class="fas fa-tag me-2"></i>Price</th>
                                <th><i class="fas fa-cog me-2"></i>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try (Connection conn = DBConnection.getConnection()) {
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM books");
                                    
                                    while(rs.next()) {
                                        int id = rs.getInt("id");
                                        String name = rs.getString("name");
                                        String author = rs.getString("author");
                                        double price = rs.getDouble("price");
                            %>
                                <tr>
                                    <td>#<%= id %></td>
                                    <td><%= name %></td>
                                    <td><%= author %></td>
                                    <td><span class="price-badge">$<%= String.format("%.2f", price) %></span></td>
                                    <td>
                                        <form action="DeleteBookServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="id" value="<%= id %>">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this book?')">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
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

    <!-- Add Book Modal -->
    <div class="modal fade" id="addBookModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-dark">Add New Book</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="AddBookServlet" method="post">
                        <div class="mb-3">
                            <label for="bookName" class="form-label text-dark">Book Name</label>
                            <input type="text" class="form-control" id="bookName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="author" class="form-label text-dark">Author</label>
                            <input type="text" class="form-control" id="author" name="author" required>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label text-dark">Price</label>
                            <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Book</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
