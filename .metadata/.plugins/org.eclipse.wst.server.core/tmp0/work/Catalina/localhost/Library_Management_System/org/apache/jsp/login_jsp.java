/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.33
 * Generated at: 2024-12-04 19:05:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Login - Library Management System</title>\n");
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
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            background-color: var(--primary-color);\n");
      out.write("            color: var(--light-text);\n");
      out.write("            min-height: 100vh;\n");
      out.write("            display: flex;\n");
      out.write("            align-items: center;\n");
      out.write("            justify-content: center;\n");
      out.write("            padding: 20px;\n");
      out.write("            position: relative;\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body::before {\n");
      out.write("            content: '';\n");
      out.write("            position: absolute;\n");
      out.write("            width: 200px;\n");
      out.write("            height: 200px;\n");
      out.write("            background: var(--text-color);\n");
      out.write("            border-radius: 50%;\n");
      out.write("            top: -100px;\n");
      out.write("            right: -100px;\n");
      out.write("            opacity: 0.1;\n");
      out.write("            animation: float 8s infinite ease-in-out;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body::after {\n");
      out.write("            content: '';\n");
      out.write("            position: absolute;\n");
      out.write("            width: 150px;\n");
      out.write("            height: 150px;\n");
      out.write("            background: var(--accent-color);\n");
      out.write("            border-radius: 50%;\n");
      out.write("            bottom: -75px;\n");
      out.write("            left: -75px;\n");
      out.write("            opacity: 0.1;\n");
      out.write("            animation: float 6s infinite ease-in-out reverse;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @keyframes float {\n");
      out.write("            0%, 100% { transform: translate(0, 0); }\n");
      out.write("            50% { transform: translate(20px, 20px); }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            max-width: 400px;\n");
      out.write("            margin: 0 auto;\n");
      out.write("            position: relative;\n");
      out.write("            z-index: 1;\n");
      out.write("            padding-top: 60px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container {\n");
      out.write("            background: var(--secondary-color);\n");
      out.write("            border-radius: 15px;\n");
      out.write("            padding: 1.5rem;\n");
      out.write("            margin: 1rem auto;\n");
      out.write("            max-width: 500px;\n");
      out.write("            width: 90%;\n");
      out.write("            box-shadow: 0 4px 15px rgba(0,0,0,0.2);\n");
      out.write("            transition: transform 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container:hover {\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("            box-shadow: 0 8px 25px rgba(0,0,0,0.3);\n");
      out.write("            background: var(--accent-color);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-header {\n");
      out.write("            text-align: center;\n");
      out.write("            margin-bottom: 35px;\n");
      out.write("            position: relative;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-header i {\n");
      out.write("            color: var(--text-color);\n");
      out.write("            font-size: 3rem;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("            display: block;\n");
      out.write("            transform: scale(1);\n");
      out.write("            transition: transform 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container:hover .login-header i {\n");
      out.write("            transform: scale(1.1) rotate(5deg);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-header h2 {\n");
      out.write("            color: var(--text-color);\n");
      out.write("            font-size: 2rem;\n");
      out.write("            margin-bottom: 10px;\n");
      out.write("            font-weight: 600;\n");
      out.write("            position: relative;\n");
      out.write("            display: inline-block;\n");
      out.write("            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-header h2::after {\n");
      out.write("            content: '';\n");
      out.write("            position: absolute;\n");
      out.write("            bottom: -5px;\n");
      out.write("            left: 0;\n");
      out.write("            width: 0;\n");
      out.write("            height: 2px;\n");
      out.write("            background: var(--text-color);\n");
      out.write("            transition: width 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container:hover .login-header h2::after {\n");
      out.write("            width: 100%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-header p {\n");
      out.write("            color: rgba(248, 249, 250, 0.8);\n");
      out.write("            font-size: 1rem;\n");
      out.write("            margin-bottom: 0;\n");
      out.write("            transform: translateY(0);\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container:hover .login-header p {\n");
      out.write("            transform: translateY(2px);\n");
      out.write("            color: var(--light-text);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-control {\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            border-radius: 12px;\n");
      out.write("            height: 50px;\n");
      out.write("            color: var(--light-text);\n");
      out.write("            font-size: 1rem;\n");
      out.write("            padding: 8px 16px;\n");
      out.write("            width: 100%;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            position: relative;\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-control:hover {\n");
      out.write("            background: rgba(255, 255, 255, 0.12);\n");
      out.write("            transform: translateX(3px);\n");
      out.write("            box-shadow: -3px 0 10px rgba(233, 69, 96, 0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-control:focus {\n");
      out.write("            border-color: var(--text-color);\n");
      out.write("            background: rgba(255, 255, 255, 0.15);\n");
      out.write("            box-shadow: 0 0 15px rgba(233, 69, 96, 0.2);\n");
      out.write("            outline: none;\n");
      out.write("            transform: translateX(5px);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-group {\n");
      out.write("            margin-bottom: 0.75rem;\n");
      out.write("            text-align: left;\n");
      out.write("            position: relative;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-group:hover .form-label {\n");
      out.write("            color: var(--text-color);\n");
      out.write("            transform: translateX(3px);\n");
      out.write("            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-label {\n");
      out.write("            color: var(--light-text);\n");
      out.write("            font-weight: 500;\n");
      out.write("            margin-bottom: 8px;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            display: block;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-custom {\n");
      out.write("            background: var(--text-color);\n");
      out.write("            color: var(--light-text);\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 12px;\n");
      out.write("            padding: 12px 25px;\n");
      out.write("            font-size: 1.1rem;\n");
      out.write("            font-weight: 600;\n");
      out.write("            width: 100%;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            margin-bottom: 10px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-admin {\n");
      out.write("            background: var(--accent-color);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-admin:hover {\n");
      out.write("            background: #0a2647;\n");
      out.write("            transform: translateY(-2px);\n");
      out.write("            box-shadow: 0 4px 15px rgba(15, 52, 96, 0.3);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-custom i {\n");
      out.write("            margin-right: 8px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-link {\n");
      out.write("            position: fixed;\n");
      out.write("            top: 20px;\n");
      out.write("            left: 20px;\n");
      out.write("            color: var(--light-text);\n");
      out.write("            text-decoration: none;\n");
      out.write("            font-size: 1.1rem;\n");
      out.write("            display: flex;\n");
      out.write("            align-items: center;\n");
      out.write("            gap: 8px;\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            z-index: 100;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-link:hover {\n");
      out.write("            background: rgba(233, 69, 96, 0.2);\n");
      out.write("            transform: translateX(-3px);\n");
      out.write("            color: var(--text-color);\n");
      out.write("            box-shadow: 3px 0 10px rgba(233, 69, 96, 0.2);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-link i {\n");
      out.write("            transition: transform 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .back-link:hover i {\n");
      out.write("            transform: translateX(-3px);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .error-message {\n");
      out.write("            color: var(--text-color);\n");
      out.write("            background: rgba(233, 69, 96, 0.1);\n");
      out.write("            padding: 10px;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("            text-align: center;\n");
      out.write("            transform: translateY(0);\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .error-message:hover {\n");
      out.write("            transform: translateY(-2px);\n");
      out.write("            background: rgba(233, 69, 96, 0.15);\n");
      out.write("            box-shadow: 0 3px 10px rgba(233, 69, 96, 0.2);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Add subtle glow to focused elements */\n");
      out.write("        .form-control:focus,\n");
      out.write("        .btn-custom:focus {\n");
      out.write("            box-shadow: 0 0 25px rgba(233, 69, 96, 0.3);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-type-selector {\n");
      out.write("            display: flex;\n");
      out.write("            gap: 10px;\n");
      out.write("            margin-bottom: 25px;\n");
      out.write("            padding: 5px;\n");
      out.write("            background: rgba(255, 255, 255, 0.05);\n");
      out.write("            border-radius: 12px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-type {\n");
      out.write("            flex: 1;\n");
      out.write("            padding: 10px;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            background: transparent;\n");
      out.write("            color: var(--light-text);\n");
      out.write("            font-weight: 500;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-type:hover {\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-type.active {\n");
      out.write("            background: var(--text-color);\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .signup-text {\n");
      out.write("            margin-top: 25px;\n");
      out.write("            text-align: center;\n");
      out.write("            color: var(--light-text);\n");
      out.write("            padding-top: 20px;\n");
      out.write("            border-top: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .signup-text a {\n");
      out.write("            color: var(--text-color);\n");
      out.write("            text-decoration: none;\n");
      out.write("            font-weight: 600;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .signup-text a:hover {\n");
      out.write("            color: #d13b54;\n");
      out.write("            text-decoration: underline;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <a href=\"index.jsp\" class=\"back-link\">\n");
      out.write("        <i class=\"fas fa-arrow-left\"></i>\n");
      out.write("        Back to Home\n");
      out.write("    </a>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"login-container\">\n");
      out.write("            <div class=\"login-header\">\n");
      out.write("                <i class=\"fas fa-book-reader\"></i>\n");
      out.write("                <h2>Welcome Back!</h2>\n");
      out.write("                <p>Please login to continue</p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"login-type-selector\">\n");
      out.write("                <button class=\"btn-type\" onclick=\"setLoginType('user')\" id=\"userBtn\">User Login</button>\n");
      out.write("                <button class=\"btn-type\" onclick=\"setLoginType('admin')\" id=\"adminBtn\">Admin Login</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            ");
 String error = request.getParameter("error");
               if(error != null && !error.isEmpty()) { 
      out.write("\n");
      out.write("                <div class=\"error-message\">\n");
      out.write("                    ");
      out.print( error );
      out.write("\n");
      out.write("                </div>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("            <form action=\"LoginServlet\" method=\"post\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label class=\"form-label\">Username</label>\n");
      out.write("                    <input type=\"text\" name=\"username\" class=\"form-control\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label class=\"form-label\">Password</label>\n");
      out.write("                    <input type=\"password\" name=\"password\" class=\"form-control\" required>\n");
      out.write("                </div>\n");
      out.write("                <input type=\"hidden\" name=\"loginType\" id=\"loginType\" value=\"user\">\n");
      out.write("                <button type=\"submit\" class=\"btn btn-custom\">\n");
      out.write("                    <i class=\"fas fa-sign-in-alt me-2\"></i>Login\n");
      out.write("                </button>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("            <div class=\"signup-text\">\n");
      out.write("                Don't have an account? <a href=\"signup.jsp\">Sign up</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        function setLoginType(type) {\n");
      out.write("            document.getElementById('loginType').value = type;\n");
      out.write("            document.getElementById('userBtn').classList.remove('active');\n");
      out.write("            document.getElementById('adminBtn').classList.remove('active');\n");
      out.write("            document.getElementById(type + 'Btn').classList.add('active');\n");
      out.write("        }\n");
      out.write("        // Set default active button\n");
      out.write("        document.getElementById('userBtn').classList.add('active');\n");
      out.write("    </script>\n");
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
