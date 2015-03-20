<%@page import="uk.ac.gre.wholesale.delivery.service.OrderItemService"%>
<%@page import="uk.ac.gre.wholesale.delivery.service.OrderService"%>
<%@page import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%@page import="uk.ac.gre.wholesale.delivery.entities.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="uk.ac.gre.wholesale.delivery.entities.Order"%>
<%
	String action = request.getParameter("action");
	Order order = (Order) session.getAttribute("order");
	if (order == null) order = new Order();
	final List<OrderItem> orderItems = order.getOrderItems();
 	try {
	if (action != null) {
		if (action.equalsIgnoreCase("delete")) {
			long productId = Long.parseLong(request.getParameter("pid"));
			int index = -1;
			for (int i = 0; i < orderItems.size(); i++) {
				if (orderItems.get(i).getProductId() == productId) {
					index = i;
					break;
				}
			}
			if (index != -1) {
				order.getOrderItems().remove(index);
				session.setAttribute("order", order);
			}
			response.sendRedirect(request.getContextPath() + "/cart.jsp");
		} else if (action.equalsIgnoreCase("update")) {
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			long productId = Long.parseLong(request.getParameter("pid"));
			boolean found = false;
			for (final OrderItem item : orderItems) {
				if (item.getProductId() == productId) {
					item.setQuantity(quantity);
					found = true;
					break;
				}
			}
			if (!found) {
				OrderItem orderItem = new OrderItem();
				orderItem.setProductId(productId);
				orderItem.setQuantity(quantity);
				order.getOrderItems().add(orderItem);
			}
			session.setAttribute("order", order);
			response.sendRedirect(request.getContextPath() + "/cart.jsp");
		} else if (action.equalsIgnoreCase("checkout")) {
			long wareHouseId = Long.parseLong(request.getParameter("selWarehouse"));
			User user = (User) session.getAttribute("user");
			if (user == null) {
				response.sendRedirect(request.getContextPath() + "/login.jsp");		
			} else {
				OrderService orderService = new OrderService();
				if (orderService.checkout(order, user.getId(), wareHouseId)) {
					session.setAttribute("order", null);
					response.sendRedirect(request.getContextPath() + "/order.jsp");
				} else {
					response.sendRedirect(request.getContextPath() + "/cart.jsp");
				}
			}
		}
	} else {
		response.sendRedirect(request.getContextPath() + "/");
	}
 	} catch (Exception ex) {
 		ex.printStackTrace();
 		response.sendRedirect(request.getContextPath() + "/cart.jsp");
 	}
	
%>