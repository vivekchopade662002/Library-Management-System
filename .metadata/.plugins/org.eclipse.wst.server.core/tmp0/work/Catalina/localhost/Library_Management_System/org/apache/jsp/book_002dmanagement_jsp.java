/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.33
 * Generated at: 2024-12-05 06:39:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import com.library.model.DBConnection;

public final class book_002dmanagement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(6);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(2);
    _jspx_imports_classes.add("com.library.model.DBConnection");
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

      out.write('\n');
      out.write('\n');

    // Check if user is logged in and is admin
    String userType = (String) session.getAttribute("userType");
    if (userType == null || !userType.equals("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Book Management - Library Management System</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            background: linear-gradient(135deg, #1a1a2e, #16213e);\n");
      out.write("            color: #d1d5db;\n");
      out.write("            min-height: 100vh;\n");
      out.write("        }\n");
      out.write("        .navbar {\n");
      out.write("            background: rgba(0, 0, 0, 0.2) !important;\n");
      out.write("            backdrop-filter: blur(10px);\n");
      out.write("        }\n");
      out.write("        .card {\n");
      out.write("            background: rgba(255, 255, 255, 0.06);\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.08);\n");
      out.write("            border-radius: 12px;\n");
      out.write("        }\n");
      out.write("        .table {\n");
      out.write("            color: #d1d5db;\n");
      out.write("        }\n");
      out.write("        .table thead th {\n");
      out.write("            background: rgba(255, 255, 255, 0.04);\n");
      out.write("            color: #e2e8f0;\n");
      out.write("        }\n");
      out.write("        .price-badge {\n");
      out.write("            background: rgba(52, 211, 153, 0.1);\n");
      out.write("            color: #34d399;\n");
      out.write("            padding: 0.25rem 0.75rem;\n");
      out.write("            border-radius: 9999px;\n");
      out.write("            font-weight: 500;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <!-- Navigation Bar -->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-dark\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"admin-dashboard.jsp\">Library Management System</a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("                <ul class=\"navbar-nav ms-auto\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"admin-dashboard.jsp\">Dashboard</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"LogoutServlet\">Logout</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <div class=\"container mt-4\">\n");
      out.write("        <div class=\"card\">\n");
      out.write("            <div class=\"card-header\">\n");
      out.write("                <div class=\"d-flex justify-content-between align-items-center\">\n");
      out.write("                    <h4 class=\"mb-0\"><i class=\"fas fa-book me-2\"></i>Book Management</h4>\n");
      out.write("                    <button class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#addBookModal\">\n");
      out.write("                        <i class=\"fas fa-plus me-2\"></i>Add New Book\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                <!-- Search Box -->\n");
      out.write("                <div class=\"mb-4\">\n");
      out.write("                    <div class=\"input-group\">\n");
      out.write("                        <input type=\"text\" id=\"searchBook\" class=\"form-control\" placeholder=\"Search books...\">\n");
      out.write("                        <button class=\"btn btn-outline-secondary\" type=\"button\">\n");
      out.write("                            <i class=\"fas fa-search\"></i>\n");
      out.write("                        </button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <!-- Books Table -->\n");
      out.write("                <div class=\"table-responsive\">\n");
      out.write("                    <table class=\"table table-hover\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th><i class=\"fas fa-hashtag me-2\"></i>ID</th>\n");
      out.write("                                <th><i class=\"fas fa-book me-2\"></i>Name</th>\n");
      out.write("                                <th><i class=\"fas fa-user me-2\"></i>Author</th>\n");
      out.write("                                <th><i class=\"fas fa-tag me-2\"></i>Price</th>\n");
      out.write("                                <th><i class=\"fas fa-cog me-2\"></i>Actions</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            ");

                                try (Connection conn = DBConnection.getConnection()) {
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM books");
                                    
                                    while(rs.next()) {
                                        int id = rs.getInt("id");
                                        String name = rs.getString("name");
                                        String author = rs.getString("author");
                                        double price = rs.getDouble("price");
                            
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>#");
      out.print( id );
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print( name );
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print( author );
      out.write("</td>\n");
      out.write("                                    <td><span class=\"price-badge\">$");
      out.print( String.format("%.2f", price) );
      out.write("</span></td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form action=\"DeleteBookServlet\" method=\"post\" style=\"display: inline;\">\n");
      out.write("                                            <input type=\"hidden\" name=\"id\" value=\"");
      out.print( id );
      out.write("\">\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-danger btn-sm\" onclick=\"return confirm('Are you sure you want to delete this book?')\">\n");
      out.write("                                                <i class=\"fas fa-trash\"></i>\n");
      out.write("                                            </button>\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                            ");

                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                                }
                            
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Add Book Modal -->\n");
      out.write("    <div class=\"modal fade\" id=\"addBookModal\" tabindex=\"-1\">\n");
      out.write("        <div class=\"modal-dialog\">\n");
      out.write("            <div class=\"modal-content\">\n");
      out.write("                <div class=\"modal-header\">\n");
      out.write("                    <h5 class=\"modal-title text-dark\">Add New Book</h5>\n");
      out.write("                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\"></button>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"modal-body\">\n");
      out.write("                    <form action=\"AddBookServlet\" method=\"post\">\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"bookName\" class=\"form-label text-dark\">Book Name</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"bookName\" name=\"name\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"author\" class=\"form-label text-dark\">Author</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"author\" name=\"author\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"price\" class=\"form-label text-dark\">Price</label>\n");
      out.write("                            <input type=\"number\" step=\"0.01\" class=\"form-control\" id=\"price\" name=\"price\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\">Add Book</button>\n");
      out.write("                    </form>\n");
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