<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%@page import="uk.ac.gre.wholesale.delivery.service.UserService"%>
<%@page import="uk.ac.gre.wholesale.delivery.entities.Order"%>
<%
	String action = request.getParameter("action");
	Order order = (Order) session.getAttribute("order");
	try {
		UserService userService = new UserService();
		if (action.equalsIgnoreCase("login")) {
			User user = userService.login(request.getParameter("txtEmail"), request.getParameter("txtPassword"), User.ROLE_CUSTOMER);
			if (user != null) {
				session.setAttribute("user", user);
				if (order == null) {
					response.sendRedirect(request.getContextPath() + "/");
				} else {
					response.sendRedirect(request.getContextPath() + "/cart.jsp");
				}		
			} else {
				session.setAttribute("errorLogin", "Invalid email or password!");
				response.sendRedirect(request.getContextPath() + "/login.jsp");	
			}
		} else if (action.equalsIgnoreCase("register")) {
			String p1 = request.getParameter("txtPassword");
			String p2 = request.getParameter("txtCPassword");
			String email = request.getParameter("txtEmail");
			if (email == null || p1 == null || p2 == null || email.length() == 0 || p1.length() == 0 || p2.length() == 0) {
				session.setAttribute("errorRegister", "Email and password should not be empty");
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			} else if (!p1.equals(p2)) {
				session.setAttribute("errorRegister", "Password must matched");
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			} else {
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				User user = new User();
				user.setId(-1L);
				user.setEmail(email);
				user.setPassword(p1);
				user.setRole(User.ROLE_CUSTOMER);
				user.setFirstName(request.getParameter("txtFirstName"));
				user.setLastName(request.getParameter("txtLastName"));
				user.setPhone(request.getParameter("txtPhone"));
				user.setAddress(request.getParameter("txtAddress"));
				user.setGender(request.getParameter("gender").equalsIgnoreCase("male"));
				String dob = request.getParameter("txtDob");
				if (dob != null && dob.length() > 0) {
					user.setDob(sdf.parse(dob));
				}
				userService.save(user);
				session.setAttribute("user", userService.login(user.getEmail(), p1, user.getRole()));
				if (order == null) {
					response.sendRedirect(request.getContextPath() + "/");
				} else {
					response.sendRedirect(request.getContextPath() + "/cart.jsp");
				}
			}
			
		} else if (action.equalsIgnoreCase("logout")) {
			session.setAttribute("user", null);
			session.setAttribute("order", null);
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	} catch (Exception ex) {
		if (order == null) {
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			response.sendRedirect(request.getContextPath() + "/cart.jsp");
		}
	}
%>