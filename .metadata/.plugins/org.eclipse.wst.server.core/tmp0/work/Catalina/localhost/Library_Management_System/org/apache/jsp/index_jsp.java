/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.33
 * Generated at: 2024-12-05 06:39:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Library Management System</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("    <style>\n");
      out.write("        :root {\n");
      out.write("            --primary-color: #1a1a2e;\n");
      out.write("            --secondary-color: #16213e;\n");
      out.write("            --accent-color: #0f3460;\n");
      out.write("            --text-color: #e94560;\n");
      out.write("            --light-text: #f8f9fa;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body {\n");
      out.write("            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));\n");
      out.write("            color: var(--light-text);\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            min-height: 100vh;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .navbar {\n");
      out.write("            background: rgba(26, 26, 46, 0.8);\n");
      out.write("            backdrop-filter: blur(10px);\n");
      out.write("            border-bottom: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            padding: 1rem 0;\n");
      out.write("        }\n");
      out.write("        .navbar-brand {\n");
      out.write("            color: var(--text-color) !important;\n");
      out.write("            font-weight: bold;\n");
      out.write("            font-size: 1.5rem;\n");
      out.write("        }\n");
      out.write("        .nav-link {\n");
      out.write("            color: var(--light-text) !important;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            margin: 0 10px;\n");
      out.write("            position: relative;\n");
      out.write("        }\n");
      out.write("        .nav-link:hover {\n");
      out.write("            color: var(--text-color) !important;\n");
      out.write("        }\n");
      out.write("        .nav-link::after {\n");
      out.write("            content: '';\n");
      out.write("            position: absolute;\n");
      out.write("            width: 0;\n");
      out.write("            height: 2px;\n");
      out.write("            background: var(--text-color);\n");
      out.write("            bottom: -5px;\n");
      out.write("            left: 0;\n");
      out.write("            transition: width 0.3s ease;\n");
      out.write("        }\n");
      out.write("        .nav-link:hover::after {\n");
      out.write("            width: 100%;\n");
      out.write("        }\n");
      out.write("        .hero-section {\n");
      out.write("            padding: 120px 0;\n");
      out.write("            text-align: center;\n");
      out.write("            background: rgba(255, 255, 255, 0.05);\n");
      out.write("            backdrop-filter: blur(10px);\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            margin: 50px 0;\n");
      out.write("            border-radius: 20px;\n");
      out.write("        }\n");
      out.write("        .contact-section {\n");
      out.write("            background: rgba(255, 255, 255, 0.05);\n");
      out.write("            backdrop-filter: blur(10px);\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            border-radius: 20px;\n");
      out.write("            padding: 50px 30px;\n");
      out.write("            margin: 50px 0;\n");
      out.write("        }\n");
      out.write("        .contact-info {\n");
      out.write("            background: rgba(255, 255, 255, 0.05);\n");
      out.write("            padding: 30px;\n");
      out.write("            border-radius: 15px;\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            height: 100%;\n");
      out.write("        }\n");
      out.write("        .social-links {\n");
      out.write("            margin-top: 30px;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            gap: 20px;\n");
      out.write("        }\n");
      out.write("        .social-links a {\n");
      out.write("            color: var(--light-text);\n");
      out.write("            font-size: 24px;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            padding: 10px;\n");
      out.write("            border-radius: 50%;\n");
      out.write("            background: rgba(255, 255, 255, 0.05);\n");
      out.write("        }\n");
      out.write("        .social-links a:hover {\n");
      out.write("            color: var(--text-color);\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\n");
      out.write("        }\n");
      out.write("        .btn-primary {\n");
      out.write("            background: var(--text-color);\n");
      out.write("            border: none;\n");
      out.write("            padding: 12px 30px;\n");
      out.write("            border-radius: 30px;\n");
      out.write("            font-weight: 600;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("        }\n");
      out.write("        .btn-primary:hover {\n");
      out.write("            transform: translateY(-3px);\n");
      out.write("            box-shadow: 0 5px 15px rgba(233, 69, 96, 0.4);\n");
      out.write("            background: #d13b54;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg sticky-top\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\">\n");
      out.write("                <i class=\"fas fa-book-reader me-2\"></i>Library MS\n");
      out.write("            </a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("                <ul class=\"navbar-nav ms-auto\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#features\">Features</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#contact\">Contact</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"login.jsp\">Login</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <!-- Hero Section -->\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"hero-section\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h1 class=\"display-4 mb-4\">Welcome to Library Management System</h1>\n");
      out.write("                <p class=\"lead mb-4\">A modern solution for managing your library resources efficiently</p>\n");
      out.write("                <a href=\"login.jsp\" class=\"btn btn-primary btn-lg\">\n");
      out.write("                    Get Started <i class=\"fas fa-arrow-right ms-2\"></i>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Features Section -->\n");
      out.write("        <div id=\"features\" class=\"row g-4 mb-5\">\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"feature-card\">\n");
      out.write("                    <i class=\"fas fa-search feature-icon\"></i>\n");
      out.write("                    <h3>Easy Search</h3>\n");
      out.write("                    <p>Find books instantly with our powerful search system</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"feature-card\">\n");
      out.write("                    <i class=\"fas fa-book feature-icon\"></i>\n");
      out.write("                    <h3>Digital Library</h3>\n");
      out.write("                    <p>Access our vast collection anytime, anywhere</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"feature-card\">\n");
      out.write("                    <i class=\"fas fa-users feature-icon\"></i>\n");
      out.write("                    <h3>User Management</h3>\n");
      out.write("                    <p>Efficient member tracking and management</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Contact Section -->\n");
      out.write("        <div id=\"contact\" class=\"contact-section\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6 mb-4\">\n");
      out.write("                    <div class=\"contact-info\">\n");
      out.write("                        <h2 class=\"mb-4\">Visit Our Library</h2>\n");
      out.write("                        <div class=\"mb-4\">\n");
      out.write("                            <h5><i class=\"fas fa-map-marker-alt me-2\"></i>Location</h5>\n");
      out.write("                            <p>123 meow Street<br>meow City, BC 12345</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-4\">\n");
      out.write("                            <h5><i class=\"fas fa-clock me-2\"></i>Hours</h5>\n");
      out.write("                            <p>Monday - Friday: 9:00 AM - 8:00 PM<br>\n");
      out.write("                            Saturday: 10:00 AM - 6:00 PM<br>\n");
      out.write("                            Sunday: Closed</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-4\">\n");
      out.write("                            <h5><i class=\"fas fa-phone me-2\"></i>Contact</h5>\n");
      out.write("                            <p>Phone: +917744922077<br>\n");
      out.write("                            Email: vivek.chopade18@gmail.com.com</p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-6 mb-4\">\n");
      out.write("                    <div class=\"contact-info\">\n");
      out.write("                        <h2 class=\"mb-4\">Connect With Us</h2>\n");
      out.write("                        <p class=\"mb-4\">Follow us on social media to stay updated with our latest events, new arrivals, and library news!</p>\n");
      out.write("                        <div class=\"social-links\">\n");
      out.write("                            <a href=\"#\" title=\"Facebook\"><i class=\"fab fa-facebook\"></i></a>\n");
      out.write("                            <a href=\"#\" title=\"Twitter\"><i class=\"fab fa-twitter\"></i></a>\n");
      out.write("                            <a href=\"#\" title=\"Instagram\"><i class=\"fab fa-instagram\"></i></a>\n");
      out.write("                            <a href=\"#\" title=\"LinkedIn\"><i class=\"fab fa-linkedin\"></i></a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mt-5\">\n");
      out.write("                            <h5 class=\"mb-3\">Quick Links</h5>\n");
      out.write("                            <ul class=\"list-unstyled\">\n");
      out.write("                                <li class=\"mb-2\"><a href=\"#\" class=\"text-light text-decoration-none\"><i class=\"fas fa-angle-right me-2\"></i>Library Rules</a></li>\n");
      out.write("                                <li class=\"mb-2\"><a href=\"#\" class=\"text-light text-decoration-none\"><i class=\"fas fa-angle-right me-2\"></i>Membership</a></li>\n");
      out.write("                                <li class=\"mb-2\"><a href=\"#\" class=\"text-light text-decoration-none\"><i class=\"fas fa-angle-right me-2\"></i>Events Calendar</a></li>\n");
      out.write("                                <li class=\"mb-2\"><a href=\"#\" class=\"text-light text-decoration-none\"><i class=\"fas fa-angle-right me-2\"></i>FAQs</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}