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
    <title>Admin Dashboard - Library Management System</title>
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
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .dashboard-card {
            cursor: pointer;
            height: 100%;
            color: #ffffff;
        }
        .dashboard-card .icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        .dashboard-card.users {
            background: linear-gradient(135deg, #4834d4, #686de0);
            border: none;
        }
        .dashboard-card.books {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            border: none;
        }
        .dashboard-card.purchases {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            border: none;
        }
        .dashboard-card.revenue {
            background: linear-gradient(135deg, #f1c40f, #f39c12);
            border: none;
        }
        .stat-value {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: #ffffff;
        }
        .card-title {
            color: #ffffff;
            font-weight: 600;
            font-size: 1.25rem;
        }
        .card-text {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            opacity: 0.9;
        }
        .icon.text-primary, .icon.text-success, .icon.text-danger, .icon.text-warning,
        .stat-value.text-primary, .stat-value.text-success, .stat-value.text-danger, .stat-value.text-warning {
            color: #ffffff !important;
        }
        /* Top Selling Books Table Styles */
        .top-books-card {
            background: linear-gradient(135deg, rgba(44, 62, 80, 0.9), rgba(52, 73, 94, 0.9));
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            max-width: 1700px;
            margin-left: auto;
            margin-right: auto;
        }
        .top-books-card .card-header {
            background: rgba(255, 255, 255, 0.05);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 0.8rem 1rem;
            border-radius: 12px 12px 0 0;
        }
        .top-books-card .card-header h4 {
            color: #ffffff;
            font-weight: 600;
            margin: 0;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
        }
        .top-books-card .card-header h4 i {
            color: #f1c40f;
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }
        .top-books-card .table {
            color: #ffffff;
            margin: 0;
            font-size: 0.9rem;
        }
        .top-books-card .table thead th {
            background: rgba(0, 0, 0, 0.2);
            color: #ffffff;
            font-weight: 600;
            padding: 0.7rem 1rem;
            border: none;
            font-size: 0.9rem;
        }
        .top-books-card .table tbody td {
            padding: 0.7rem 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            vertical-align: middle;
        }
        .top-books-card .badge {
            padding: 0.4rem 0.8rem;
            font-weight: 500;
            font-size: 0.85rem;
        }
        .top-books-card .badge.bg-warning {
            background: linear-gradient(135deg, #f1c40f, #f39c12) !important;
            box-shadow: 0 2px 4px rgba(243, 156, 18, 0.2);
        }
        .top-books-card .badge.bg-info {
            background: linear-gradient(135deg, #3498db, #2980b9) !important;
            box-shadow: 0 2px 4px rgba(52, 152, 219, 0.2);
        }
        .top-books-card .badge.bg-success {
            background: linear-gradient(135deg, #2ecc71, #27ae60) !important;
            box-shadow: 0 2px 4px rgba(46, 204, 113, 0.2);
        }
        .top-books-card .badge.bg-secondary {
            background: linear-gradient(135deg, #95a5a6, #7f8c8d) !important;
            box-shadow: 0 2px 4px rgba(127, 140, 141, 0.2);
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Library Management System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">
                            <i class="fas fa-home me-2"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewbooks.jsp">
                            <i class="fas fa-book-open me-2"></i>View Books
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addbook.jsp">
                            <i class="fas fa-plus-circle me-2"></i>Add Book
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="update.jsp">
                            <i class="fas fa-edit me-2"></i>Update Book
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="search.jsp">
                            <i class="fas fa-search me-2"></i>Search Books
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="delete.jsp">
                            <i class="fas fa-trash me-2"></i>Delete Book
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">
                            <i class="fas fa-sign-out-alt me-2"></i>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4"><i class="fas fa-tachometer-alt me-2"></i>Admin Dashboard</h2>
        
        <div class="row g-4">
            <!-- User Management Card -->
            <div class="col-md-6 col-lg-3">
                <div class="card dashboard-card users" onclick="window.location.href='user-management.jsp'">
                    <div class="card-body text-center">
                        <div class="icon text-primary">
                            <i class="fas fa-users"></i>
                        </div>
                        <%
                            int userCount = 0;
                            try (Connection conn = DBConnection.getConnection()) {
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM users");
                                if(rs.next()) {
                                    userCount = rs.getInt("count");
                                }
                            } catch(Exception e) { }
                        %>
                        <div class="stat-value text-primary"><%= userCount %></div>
                        <h5 class="card-title mb-0">User Management</h5>
                        <p class="card-text mt-2">Manage system users and roles</p>
                    </div>
                </div>
            </div>

            <!-- Book Management Card -->
            <div class="col-md-6 col-lg-3">
                <div class="card dashboard-card books" onclick="window.location.href='book-management.jsp'">
                    <div class="card-body text-center">
                        <div class="icon text-success">
                            <i class="fas fa-book"></i>
                        </div>
                        <%
                            int bookCount = 0;
                            try (Connection conn = DBConnection.getConnection()) {
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM books");
                                if(rs.next()) {
                                    bookCount = rs.getInt("count");
                                }
                            } catch(Exception e) { }
                        %>
                        <div class="stat-value text-success"><%= bookCount %></div>
                        <h5 class="card-title mb-0">Book Management</h5>
                        <p class="card-text mt-2">Manage library books</p>
                    </div>
                </div>
            </div>

            <!-- Purchase History Card -->
            <div class="col-md-6 col-lg-3">
                <div class="card dashboard-card purchases" onclick="window.location.href='purchase-history.jsp'">
                    <div class="card-body text-center">
                        <div class="icon text-danger">
                            <i class="fas fa-history"></i>
                        </div>
                        <%
                            int purchaseCount = 0;
                            try (Connection conn = DBConnection.getConnection()) {
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM purchase_history");
                                if(rs.next()) {
                                    purchaseCount = rs.getInt("count");
                                }
                            } catch(Exception e) { }
                        %>
                        <div class="stat-value text-danger"><%= purchaseCount %></div>
                        <h5 class="card-title mb-0">Purchase History</h5>
                        <p class="card-text mt-2">View all transactions</p>
                    </div>
                </div>
            </div>

            <!-- Revenue Card -->
            <div class="col-md-6 col-lg-3">
                <div class="card dashboard-card revenue">
                    <div class="card-body text-center">
                        <div class="icon text-warning">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <%
                            double totalRevenue = 0;
                            try (Connection conn = DBConnection.getConnection()) {
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT SUM(price) as total FROM purchase_history");
                                if(rs.next()) {
                                    totalRevenue = rs.getDouble("total");
                                }
                            } catch(Exception e) { }
                        %>
                        <div class="stat-value text-warning">$<%= String.format("%.2f", totalRevenue) %></div>
                        <h5 class="card-title mb-0">Total Revenue</h5>
                        <p class="card-text mt-2">Overall earnings</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Top Selling Books Section -->
    <div class="row mt-4">
        <div class="col-12 col-xl-10 mx-auto">
            <div class="card top-books-card">
                <div class="card-header">
                    <h4><i class="fas fa-star me-2"></i>Top Selling Books</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th><i class="fas fa-hashtag me-2"></i>Rank</th>
                                    <th><i class="fas fa-book me-2"></i>Book Name</th>
                                    <th><i class="fas fa-user me-2"></i>Author</th>
                                    <th><i class="fas fa-shopping-cart me-2"></i>Total Sales</th>
                                    <th><i class="fas fa-dollar-sign me-2"></i>Revenue Generated</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try (Connection topBooksConn = DBConnection.getConnection();
                                         Statement topBooksStmt = topBooksConn.createStatement()) {
                                        String topBooksSql = 
                                            "SELECT b.name as book_name, b.author, " +
                                            "COUNT(ph.id) as total_sales, " +
                                            "SUM(ph.price) as total_revenue " +
                                            "FROM books b " +
                                            "JOIN purchase_history ph ON b.id = ph.book_id " +
                                            "GROUP BY b.id, b.name, b.author " +
                                            "ORDER BY total_sales DESC " +
                                            "LIMIT 5";
                                        
                                        ResultSet topBooksRs = topBooksStmt.executeQuery(topBooksSql);
                                        int rank = 1;
                                        while(topBooksRs.next()) {
                                %>
                                <tr>
                                    <td>
                                        <span class="badge <%= rank <= 3 ? "bg-warning" : "bg-secondary" %> rounded-pill">
                                            #<%= rank %>
                                        </span>
                                    </td>
                                    <td><%= topBooksRs.getString("book_name") %></td>
                                    <td><%= topBooksRs.getString("author") %></td>
                                    <td>
                                        <span class="badge bg-info rounded-pill">
                                            <%= topBooksRs.getInt("total_sales") %> copies
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-success rounded-pill">
                                            $<%= String.format("%.2f", topBooksRs.getDouble("total_revenue")) %>
                                        </span>
                                    </td>
                                </tr>
                                <%
                                            rank++;
                                        }
                                    } catch(Exception e) {
                                        out.println("<tr><td colspan='5' class='text-danger'>Error loading top books: " + e.getMessage() + "</td></tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
