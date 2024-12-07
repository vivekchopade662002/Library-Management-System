<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
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
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--light-text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        .navbar {
            background: rgba(26, 26, 46, 0.8);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 1rem 0;
        }
        .navbar-brand {
            color: var(--text-color) !important;
            font-weight: bold;
            font-size: 1.5rem;
        }
        .nav-link {
            color: var(--light-text) !important;
            transition: all 0.3s ease;
            margin: 0 10px;
            position: relative;
        }
        .nav-link:hover {
            color: var(--text-color) !important;
        }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: var(--text-color);
            bottom: -5px;
            left: 0;
            transition: width 0.3s ease;
        }
        .nav-link:hover::after {
            width: 100%;
        }
        .hero-section {
            padding: 120px 0;
            text-align: center;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            margin: 50px 0;
            border-radius: 20px;
        }
        .contact-section {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 50px 30px;
            margin: 50px 0;
        }
        .contact-info {
            background: rgba(255, 255, 255, 0.05);
            padding: 30px;
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            height: 100%;
        }
        .social-links {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .social-links a {
            color: var(--light-text);
            font-size: 24px;
            transition: all 0.3s ease;
            padding: 10px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
        }
        .social-links a:hover {
            color: var(--text-color);
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.1);
        }
        .btn-primary {
            background: var(--text-color);
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(233, 69, 96, 0.4);
            background: #d13b54;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-book-reader me-2"></i>Library MS
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container">
        <div class="hero-section">
            <div class="container">
                <h1 class="display-4 mb-4">Welcome to Library Management System</h1>
                <p class="lead mb-4">A modern solution for managing your library resources efficiently</p>
                <a href="login.jsp" class="btn btn-primary btn-lg">
                    Get Started <i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>

        <!-- Features Section -->
        <div id="features" class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-search feature-icon"></i>
                    <h3>Easy Search</h3>
                    <p>Find books instantly with our powerful search system</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-book feature-icon"></i>
                    <h3>Digital Library</h3>
                    <p>Access our vast collection anytime, anywhere</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-users feature-icon"></i>
                    <h3>User Management</h3>
                    <p>Efficient member tracking and management</p>
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div id="contact" class="contact-section">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="contact-info">
                        <h2 class="mb-4">Visit Our Library</h2>
                        <div class="mb-4">
                            <h5><i class="fas fa-map-marker-alt me-2"></i>Location</h5>
                            <p>123 meow Street<br>meow City, BC 12345</p>
                        </div>
                        <div class="mb-4">
                            <h5><i class="fas fa-clock me-2"></i>Hours</h5>
                            <p>Monday - Friday: 9:00 AM - 8:00 PM<br>
                            Saturday: 10:00 AM - 6:00 PM<br>
                            Sunday: Closed</p>
                        </div>
                        <div class="mb-4">
                            <h5><i class="fas fa-phone me-2"></i>Contact</h5>
                            <p>Phone: +917744922077<br>
                            Email: vivek.chopade18@gmail.com.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="contact-info">
                        <h2 class="mb-4">Connect With Us</h2>
                        <p class="mb-4">Follow us on social media to stay updated with our latest events, new arrivals, and library news!</p>
                        <div class="social-links">
                            <a href="#" title="Facebook"><i class="fab fa-facebook"></i></a>
                            <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                            <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="#" title="LinkedIn"><i class="fab fa-linkedin"></i></a>
                        </div>
                        <div class="mt-5">
                            <h5 class="mb-3">Quick Links</h5>
                            <ul class="list-unstyled">
                                <li class="mb-2"><a href="#" class="text-light text-decoration-none"><i class="fas fa-angle-right me-2"></i>Library Rules</a></li>
                                <li class="mb-2"><a href="#" class="text-light text-decoration-none"><i class="fas fa-angle-right me-2"></i>Membership</a></li>
                                <li class="mb-2"><a href="#" class="text-light text-decoration-none"><i class="fas fa-angle-right me-2"></i>Events Calendar</a></li>
                                <li class="mb-2"><a href="#" class="text-light text-decoration-none"><i class="fas fa-angle-right me-2"></i>FAQs</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
