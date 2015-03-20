<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%@page import="uk.ac.gre.wholesale.delivery.service.UserService"%>

<%
	String action = request.getParameter("txtEmail");
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	UserService service = new UserService();
	User user = service.login(email, password, User.ROLE_STAFF);
	if (user != null) {
		session.setAttribute("admin", user);
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	} else {
		session.setAttribute("error", "Invalid username or password");
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
	}
%>