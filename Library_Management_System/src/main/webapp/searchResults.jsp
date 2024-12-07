<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.library.model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
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
        
        .results-container {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 2.5rem 2rem;
            margin: 2rem auto;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        
        .results-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            background: var(--accent-color);
        }
        
        .table {
            color: var(--light-text);
            margin-top: 1rem;
        }
        
        .table thead th {
            background-color: rgba(255, 255, 255, 0.05);
            color: var(--text-color);
            font-weight: 600;
            border: none;
            padding: 1rem;
        }
        
        .table tbody td {
            border-color: rgba(255, 255, 255, 0.05);
            padding: 1rem;
            vertical-align: middle;
        }
        
        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }
        
        .book-id {
            font-family: monospace;
            color: var(--text-color);
            font-weight: 600;
        }
        
        .price-badge {
            background: var(--text-color);
            color: var(--light-text);
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .search-form {
            margin-bottom: 2rem;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--light-text);
            padding: 12px 20px;
            border-radius: 8px;
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
        
        .btn-search {
            background: var(--text-color);
            color: var(--light-text);
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-search:hover {
            background: #d03651;
            transform: translateY(-2px);
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
                <a class="nav-link active" href="search.jsp"><i class="fas fa-search me-2"></i>Search Books</a>
                <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="page-title">Search Results</h2>
        
        <!-- Search Form -->
        <div class="search-form">
            <form action="SearchBookServlet" method="get" class="d-flex gap-2">
                <input type="text" name="query" class="form-control" placeholder="Search by book name or author">
                <button type="submit" class="btn btn-search">
                    <i class="fas fa-search me-2"></i>Search
                </button>
            </form>
        </div>

        <div class="results-container">
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
                        ResultSet rs = (ResultSet) request.getAttribute("searchResults");
                        if (rs != null) {
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
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>