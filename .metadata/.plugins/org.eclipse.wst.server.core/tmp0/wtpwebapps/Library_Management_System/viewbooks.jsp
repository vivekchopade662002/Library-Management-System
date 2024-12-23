<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.library.model.DBConnection" %>
<%
    // Check if user is admin
    String userType = (String) session.getAttribute("userType");
    boolean isAdmin = userType != null && userType.equals("admin");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Books - Library Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
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
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--light-text);
            padding-bottom: 2rem;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 1rem 0;
            margin-bottom: 2rem;
        }

        .navbar-nav .nav-link {
            color: var(--light-text);
            margin: 0 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--text-color);
            transform: translateY(-2px);
        }

        .navbar-nav .nav-link.active {
            background: var(--text-color);
            color: var(--light-text);
        }

        .page-title {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 1rem;
            color: var(--light-text);
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--text-color);
            border-radius: 3px;
        }

        .books-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 2rem;
            margin: 0 auto;
            max-width: 1200px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .books-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.3);
        }

        .table {
            color: var(--light-text);
            margin-bottom: 0;
        }

        .table thead th {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.1);
            color: var(--text-color);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1rem;
        }

        .table tbody td {
            border-color: rgba(255, 255, 255, 0.1);
            padding: 1rem;
            vertical-align: middle;
            transition: all 0.3s ease;
        }

        .table tbody tr {
            transition: all 0.3s ease;
        }

        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: scale(1.01);
        }

        .table tbody tr:hover td {
            color: var(--text-color);
        }

        .book-id {
            font-weight: 600;
            color: var(--text-color);
        }

        .price-badge {
            background: var(--text-color);
            color: var(--light-text);
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-weight: 600;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .price-badge:hover {
            transform: scale(1.1);
            box-shadow: 0 0 15px var(--text-color);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .table tbody tr {
            animation: fadeIn 0.5s ease forwards;
            opacity: 0;
        }

        .table tbody tr:nth-child(1) { animation-delay: 0.1s; }
        .table tbody tr:nth-child(2) { animation-delay: 0.2s; }
        .table tbody tr:nth-child(3) { animation-delay: 0.3s; }
        .table tbody tr:nth-child(4) { animation-delay: 0.4s; }
        .table tbody tr:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
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
                        <a class="nav-link" href="home.jsp">
                            <i class="fas fa-home me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="viewbooks.jsp">
                            <i class="fas fa-book me-1"></i>View Books
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="search.jsp">
                            <i class="fas fa-search me-1"></i>Search
                        </a>
                    </li>
                    <%
                    if (userType != null && userType.equals("admin")) {
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="admin-dashboard.jsp">
                                <i class="fas fa-cog"></i> Admin Dashboard
                            </a>
                        </li>
                    <% } %>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="page-title">Books in the Library</h2>
        
        <div class="books-container">
            <table class="table">
                <thead>
                    <tr>
                        <th><i class="fas fa-hashtag me-2"></i>Book ID</th>
                        <th><i class="fas fa-book me-2"></i>Name</th>
                        <th><i class="fas fa-user me-2"></i>Author</th>
                        <th><i class="fas fa-tag me-2"></i>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = DBConnection.getConnection();
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM books");

                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="book-id">#<%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("author") %></td>
                        <td><span class="price-badge">$<%= String.format("%.2f", rs.getDouble("price")) %></span></td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>