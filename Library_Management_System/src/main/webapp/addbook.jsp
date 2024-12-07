<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book</title>
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
            min-height: 100vh;
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
        
        .page-title {
            color: var(--text-color);
            text-align: center;
            margin: 2rem 0;
            font-size: 2.5rem;
            font-weight: bold;
        }
        
        .form-container {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 600px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        
        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        
        .form-label {
            color: var(--text-color);
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--light-text);
            padding: 12px 20px;
            border-radius: 8px;
            margin-bottom: 1rem;
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
        
        .btn-submit {
            background: var(--text-color);
            color: var(--light-text);
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 500;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }
        
        .btn-submit:hover {
            background: #d03651;
            transform: translateY(-2px);
        }
        
        .error { color: red; }
        .success { color: green; }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <div class="navbar-nav mx-auto">
                <a class="nav-link" href="home.jsp"><i class="fas fa-home me-2"></i>Home</a>
                <a class="nav-link" href="viewbooks.jsp"><i class="fas fa-book me-2"></i>View Books</a>
                <a class="nav-link active" href="addbook.jsp"><i class="fas fa-plus me-2"></i>Add Book</a>
                <a class="nav-link" href="search.jsp"><i class="fas fa-search me-2"></i>Search Books</a>
                <a class="nav-link" href="delete.jsp"><i class="fas fa-trash me-2"></i>Delete Book</a>
                <a class="nav-link" href="update.jsp"><i class="fas fa-edit me-2"></i>Update Book</a>
                <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="page-title">Add New Book</h2>
        
        <%-- Display any error or success messages --%>
        <% 
            String error = request.getParameter("error");
            String message = request.getParameter("message");
            if (error != null && !error.isEmpty()) {
        %>
            <p class="error"><%= error %></p>
        <% 
            }
            if (message != null && !message.isEmpty()) {
        %>
            <p class="success"><%= message %></p>
        <% 
            }
        %>
        
        <div class="form-container">
            <form action="AddBookServlet" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label"><i class="fas fa-id-card me-2"></i>Book ID</label>
                    <input type="number" class="form-control" id="id" name="id" required min="1" placeholder="Enter book ID">
                </div>
                
                <div class="mb-3">
                    <label for="name" class="form-label"><i class="fas fa-book me-2"></i>Book Name</label>
                    <input type="text" class="form-control" id="name" name="name" required placeholder="Enter book name">
                </div>
                
                <div class="mb-3">
                    <label for="author" class="form-label"><i class="fas fa-user me-2"></i>Author</label>
                    <input type="text" class="form-control" id="author" name="author" required placeholder="Enter author name">
                </div>
                
                <div class="mb-3">
                    <label for="price" class="form-label"><i class="fas fa-tag me-2"></i>Price</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" required placeholder="Enter price">
                </div>
                
                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-plus me-2"></i>Add Book
                </button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
