<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .page-title {
            color: var(--text-color);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.5rem;
            font-weight: bold;
        }
        
        .form-container {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 500px;
            width: 90%;
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
        
        .btn-signup {
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
        
        .btn-signup:hover {
            background: #d03651;
            transform: translateY(-2px);
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
        }
        
        .login-link a {
            color: var(--text-color);
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .login-link a:hover {
            color: #d03651;
            text-decoration: underline;
        }
        
        .error { 
            color: var(--text-color);
            background: rgba(233, 69, 96, 0.1);
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
        }
        
        .success { 
            color: #28a745;
            background: rgba(40, 167, 69, 0.1);
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
        }
        
        .input-group-text {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--text-color);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2 class="page-title">Sign Up</h2>
            
            <%-- Display any error or success messages --%>
            <% 
                String error = request.getParameter("error");
                String message = request.getParameter("message");
                if (error != null && !error.isEmpty()) {
            %>
                <div class="error"><%= error %></div>
            <% 
                }
                if (message != null && !message.isEmpty()) {
            %>
                <div class="success"><%= message %></div>
            <% 
                }
            %>
            
            <form action="SignUpServlet" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">
                        <i class="fas fa-user me-2"></i>Username
                    </label>
                    <input type="text" class="form-control" id="username" name="username" required 
                           placeholder="Enter username">
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">
                        <i class="fas fa-lock me-2"></i>Password
                    </label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="password" name="password" required 
                               placeholder="Enter password">
                        <span class="input-group-text">
                            <i class="fas fa-eye" id="togglePassword" style="cursor: pointer;"></i>
                        </span>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-signup">
                    <i class="fas fa-user-plus me-2"></i>Sign Up
                </button>
                
                <div class="login-link">
                    Already have an account? <a href="login.jsp">Login here</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const password = document.getElementById('password');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
