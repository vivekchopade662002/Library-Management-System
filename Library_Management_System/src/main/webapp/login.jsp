<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Library Management System</title>
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
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: var(--text-color);
            border-radius: 50%;
            top: -100px;
            right: -100px;
            opacity: 0.1;
            animation: float 8s infinite ease-in-out;
        }

        body::after {
            content: '';
            position: absolute;
            width: 150px;
            height: 150px;
            background: var(--accent-color);
            border-radius: 50%;
            bottom: -75px;
            left: -75px;
            opacity: 0.1;
            animation: float 6s infinite ease-in-out reverse;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(20px, 20px); }
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
            padding-top: 60px;
        }

        .login-container {
            background: var(--secondary-color);
            border-radius: 15px;
            padding: 1.5rem;
            margin: 1rem auto;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            background: var(--accent-color);
        }

        .login-header {
            text-align: center;
            margin-bottom: 35px;
            position: relative;
        }

        .login-header i {
            color: var(--text-color);
            font-size: 3rem;
            margin-bottom: 20px;
            display: block;
            transform: scale(1);
            transition: transform 0.3s ease;
        }

        .login-container:hover .login-header i {
            transform: scale(1.1) rotate(5deg);
        }

        .login-header h2 {
            color: var(--text-color);
            font-size: 2rem;
            margin-bottom: 10px;
            font-weight: 600;
            position: relative;
            display: inline-block;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .login-header h2::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--text-color);
            transition: width 0.3s ease;
        }

        .login-container:hover .login-header h2::after {
            width: 100%;
        }

        .login-header p {
            color: rgba(248, 249, 250, 0.8);
            font-size: 1rem;
            margin-bottom: 0;
            transform: translateY(0);
            transition: all 0.3s ease;
        }

        .login-container:hover .login-header p {
            transform: translateY(2px);
            color: var(--light-text);
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            height: 50px;
            color: var(--light-text);
            font-size: 1rem;
            padding: 8px 16px;
            width: 100%;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .form-control:hover {
            background: rgba(255, 255, 255, 0.12);
            transform: translateX(3px);
            box-shadow: -3px 0 10px rgba(233, 69, 96, 0.1);
        }

        .form-control:focus {
            border-color: var(--text-color);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 15px rgba(233, 69, 96, 0.2);
            outline: none;
            transform: translateX(5px);
        }

        .form-group {
            margin-bottom: 0.75rem;
            text-align: left;
            position: relative;
            transition: all 0.3s ease;
        }

        .form-group:hover .form-label {
            color: var(--text-color);
            transform: translateX(3px);
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .form-label {
            color: var(--light-text);
            font-weight: 500;
            margin-bottom: 8px;
            transition: all 0.3s ease;
            display: block;
        }

        .btn-custom {
            background: var(--text-color);
            color: var(--light-text);
            border: none;
            border-radius: 12px;
            padding: 12px 25px;
            font-size: 1.1rem;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
            margin-bottom: 10px;
        }

        .btn-admin {
            background: var(--accent-color);
        }

        .btn-admin:hover {
            background: #0a2647;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(15, 52, 96, 0.3);
        }

        .btn-custom i {
            margin-right: 8px;
        }

        .back-link {
            position: fixed;
            top: 20px;
            left: 20px;
            color: var(--light-text);
            text-decoration: none;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 15px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            z-index: 100;
        }

        .back-link:hover {
            background: rgba(233, 69, 96, 0.2);
            transform: translateX(-3px);
            color: var(--text-color);
            box-shadow: 3px 0 10px rgba(233, 69, 96, 0.2);
        }

        .back-link i {
            transition: transform 0.3s ease;
        }

        .back-link:hover i {
            transform: translateX(-3px);
        }

        .error-message {
            color: var(--text-color);
            background: rgba(233, 69, 96, 0.1);
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            transform: translateY(0);
            transition: all 0.3s ease;
        }

        .error-message:hover {
            transform: translateY(-2px);
            background: rgba(233, 69, 96, 0.15);
            box-shadow: 0 3px 10px rgba(233, 69, 96, 0.2);
        }

        /* Add subtle glow to focused elements */
        .form-control:focus,
        .btn-custom:focus {
            box-shadow: 0 0 25px rgba(233, 69, 96, 0.3);
        }

        .login-type-selector {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
            padding: 5px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 12px;
        }

        .btn-type {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 10px;
            background: transparent;
            color: var(--light-text);
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-type:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .btn-type.active {
            background: var(--text-color);
            color: white;
        }

        .signup-text {
            margin-top: 25px;
            text-align: center;
            color: var(--light-text);
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .signup-text a {
            color: var(--text-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .signup-text a:hover {
            color: #d13b54;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <a href="index.jsp" class="back-link">
        <i class="fas fa-arrow-left"></i>
        Back to Home
    </a>

    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <i class="fas fa-book-reader"></i>
                <h2>Welcome Back!</h2>
                <p>Please login to continue</p>
            </div>
            
            <div class="login-type-selector">
                <button class="btn-type" onclick="setLoginType('user')" id="userBtn">User Login</button>
                <button class="btn-type" onclick="setLoginType('admin')" id="adminBtn">Admin Login</button>
            </div>

            <% String error = request.getParameter("error");
               if(error != null && !error.isEmpty()) { %>
                <div class="error-message">
                    <%= error %>
                </div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <input type="hidden" name="loginType" id="loginType" value="user">
                <button type="submit" class="btn btn-custom">
                    <i class="fas fa-sign-in-alt me-2"></i>Login
                </button>
            </form>

            <div class="signup-text">
                Don't have an account? <a href="signup.jsp">Sign up</a>
            </div>
        </div>
    </div>

    <script>
        function setLoginType(type) {
            document.getElementById('loginType').value = type;
            document.getElementById('userBtn').classList.remove('active');
            document.getElementById('adminBtn').classList.remove('active');
            document.getElementById(type + 'Btn').classList.add('active');
        }
        // Set default active button
        document.getElementById('userBtn').classList.add('active');
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
