<%@ page import="jakarta.servlet.http.*" %>
<%
    session.invalidate();  // Use the implicit session
    response.sendRedirect("./login.jsp");
%>
