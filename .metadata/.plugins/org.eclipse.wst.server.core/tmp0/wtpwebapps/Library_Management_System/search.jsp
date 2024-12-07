<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*,java.sql.*"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Books</title>
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
        
        .nav-link {
            color: var(--light-text) !important;
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            color: var(--text-color) !important;
            transform: translateY(-2px);
        }
        
        .search-container {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 2.5rem 2rem;
            margin: 2rem auto;
            max-width: 800px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        
        .search-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            background: var(--accent-color);
        }
        
        .page-title {
            color: var(--text-color);
            text-align: center;
            margin: 2rem 0;
            font-size: 2.5rem;
            font-weight: bold;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--light-text);
            padding: 12px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .form-control:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: var(--text-color);
            color: var(--light-text);
            box-shadow: 0 0 0 0.25rem rgba(233, 69, 96, 0.25);
        }
        
        .form-control::placeholder {
            color: rgba(248, 249, 250, 0.5);
        }
        
        .form-label {
            color: var(--light-text);
            font-weight: 500;
            margin-bottom: 8px;
        }
        
        .btn {
            padding: 12px 30px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: var(--text-color);
            border: none;
        }
        
        .btn-primary:hover {
            background: #d03651;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background: var(--accent-color);
            border: none;
        }
        
        .btn-secondary:hover {
            background: #0a2647;
            transform: translateY(-2px);
        }
        
        .alert {
            background: rgba(233, 69, 96, 0.1);
            border: 1px solid var(--text-color);
            color: var(--text-color);
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <div class="navbar-nav mx-auto">
                <a class="nav-link" href="home.jsp"><i class="fas fa-home me-2"></i>Home</a>
                <a class="nav-link" href="viewbooks.jsp"><i class="fas fa-book me-2"></i>View Books</a>
                <a class="nav-link" href="addbook.jsp"><i class="fas fa-plus me-2"></i>Add Book</a>
                <a class="nav-link active" href="search.jsp"><i class="fas fa-search me-2"></i>Search Books</a>
                <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="page-title">Search Books</h2>
        
        <div class="search-container">
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert" role="alert">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="SearchBookServlet" method="get">
                <div class="mb-4">
                    <label class="form-label"><i class="fas fa-hashtag me-2"></i>Search by Book ID</label>
                    <input type="number" name="bookId" class="form-control" placeholder="Enter Book ID">
                </div>
                
                <div class="mb-4">
                    <label class="form-label"><i class="fas fa-book me-2"></i>Search by Book Name</label>
                    <input type="text" name="bookName" class="form-control" placeholder="Enter Book Name">
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search me-2"></i>Search
                    </button>
                    <button type="reset" class="btn btn-secondary">
                        <i class="fas fa-undo me-2"></i>Clear
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
