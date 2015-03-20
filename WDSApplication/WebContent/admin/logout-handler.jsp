<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%@page import="uk.ac.gre.wholesale.delivery.service.UserService"%>

<%
session.setAttribute("admin", null);
response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>