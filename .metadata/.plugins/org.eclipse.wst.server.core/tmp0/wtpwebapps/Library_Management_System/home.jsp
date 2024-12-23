<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--primary-color);
            color: var(--light-text);
        }
        
        .navbar {
            background-color: var(--secondary-color);
            padding: 1rem 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .navbar-brand {
            color: var(--text-color) !important;
            font-weight: bold;
            font-size: 1.5rem;
        }
        
        .nav-link {
            color: var(--light-text) !important;
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            color: var(--text-color) !important;
            transform: translateY(-2px);
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
            color: var(--light-text);
            padding: 3rem 0;
            margin-bottom: 2rem;
        }
        
        .hero-section .welcome-name {
            color: var(--text-color);
            font-weight: bold;
        }
        
        .feature-card {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 2.5rem 2rem;
            margin: 1rem;
            height: 400px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            color: var(--light-text);
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            background: var(--accent-color);
        }
        
        .feature-icon {
            font-size: 4rem;
            color: var(--text-color);
            margin-bottom: 2rem;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .feature-card h3 {
            font-size: 1.75rem;
            margin-bottom: 1.5rem;
            color: var(--light-text);
            font-weight: 600;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .feature-card p {
            color: #b0b0b0;
            margin-bottom: 2rem;
            flex-grow: 1;
            font-size: 1.1rem;
            line-height: 1.6;
            text-align: center;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-custom {
            background-color: var(--text-color);
            color: var(--light-text);
            padding: 0.8rem 2rem;
            border-radius: 30px;
            border: none;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            text-decoration: none;
            margin-top: auto;
        }
        
        .btn-custom:hover {
            background: var(--light-text);
            color: var(--text-color);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">
                <i class="fas fa-book-reader me-2"></i>CITY LIBRARY
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewbooks.jsp">View Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="search.jsp">Search Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="purchase-books.jsp">
                            <i class="fas fa-shopping-cart me-1"></i>Purchase Books
                        </a>
                    </li>
                    <%
                    String userType = (String) session.getAttribute("userType");
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

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 mb-3">Welcome, <span class="welcome-name"><%= session.getAttribute("username") %></span>!</h1>
            <p class="lead mb-0">Manage your library efficiently with our comprehensive management system.</p>
        </div>
    </section>

    <!-- Features Section -->
    <section class="container" style="margin-top: -30px;">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card text-center">
                    <i class="fas fa-book feature-icon"></i>
                    <h3>Browse Books</h3>
                    <p>Explore our extensive collection of books available in the library.</p>
                    <a href="viewbooks.jsp" class="btn btn-custom">View Books</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card text-center">
                    <i class="fas fa-search feature-icon"></i>
                    <h3>Quick Search</h3>
                    <p>Find any book instantly using our powerful search feature.</p>
                    <a href="search.jsp" class="btn btn-custom">Search Now</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card text-center">
                    <i class="fas fa-shopping-cart feature-icon"></i>
                    <h3>Purchase Books</h3>
                    <p>Buy your favorite books from our collection.</p>
                    <a href="purchase-books.jsp" class="btn btn-custom">Purchase Now</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
