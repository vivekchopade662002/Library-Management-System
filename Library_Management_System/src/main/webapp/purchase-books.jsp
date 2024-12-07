<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*,java.sql.*, com.library.model.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Books - Library Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #1a1a2e;
            --secondary-color: #16213e;
            --accent-color: #0f3460;
            --text-color: #e94560;
            --light-text: #f8f9fa;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--primary-color);
            color: var(--light-text);
        }
        
        .navbar {
            background-color: var(--secondary-color);
            padding: 1rem 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .book-card {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            transition: transform 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        
        .book-card:hover {
            transform: translateY(-5px);
        }
        
        .btn-purchase {
            background-color: var(--text-color);
            color: var(--light-text);
            border: none;
            transition: all 0.3s ease;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }
        
        .btn-purchase:hover {
            background-color: var(--light-text);
            color: var(--text-color);
        }
        
        .page-title {
            color: var(--text-color);
            margin-bottom: 2rem;
            padding: 2rem 0;
            text-align: center;
            background: var(--secondary-color);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .alert {
            margin-top: 1rem;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">
                <i class="fas fa-book-reader me-2"></i>Library MS
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="purchase-books.jsp">Purchase Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h1 class="page-title">
            <i class="fas fa-shopping-cart me-2"></i>
            Purchase Books
        </h1>

        <% 
        String message = request.getParameter("message");
        String error = request.getParameter("error");
        if (message != null) {
        %>
            <div class="alert alert-success" role="alert">
                <%= message %>
            </div>
        <% 
        }
        if (error != null) {
        %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        <% 
        }
        %>

        <div class="row">
            <% 
            try {
                Connection conn = DBConnection.getConnection();
                if (conn == null) {
                    throw new SQLException("Failed to connect to database");
                }
                
                String sql = "SELECT * FROM books ORDER BY name";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                
                while(rs.next()) {
            %>
                <div class="col-md-4 mb-4">
                    <div class="book-card">
                        <h4 class="text-light"><%=rs.getString("name")%></h4>
                        <p class="text-muted mb-2">By <%=rs.getString("author")%></p>
                        <p class="text-warning mb-3">Price: $<%=rs.getDouble("price")%></p>
                        <form action="PurchaseBookServlet" method="post">
                            <input type="hidden" name="bookId" value="<%=rs.getInt("id")%>">
                            <input type="hidden" name="bookName" value="<%=rs.getString("name")%>">
                            <input type="hidden" name="price" value="<%=rs.getDouble("price")%>">
                            <button type="submit" class="btn btn-purchase">
                                <i class="fas fa-shopping-cart me-2"></i>Purchase
                            </button>
                        </form>
                    </div>
                </div>
            <%
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch(Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
            %>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
