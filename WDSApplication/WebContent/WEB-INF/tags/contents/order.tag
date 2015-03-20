<%@tag import="java.text.SimpleDateFormat"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%@tag import="uk.ac.gre.wholesale.delivery.service.OrderService"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.Order"%>
<%@tag import="java.util.List"%>
<%@tag description="Login" pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} else {
%>
<!-- Page Title -->
<div class="section section-breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Order list</h1>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<%
				OrderService orderService = new OrderService();
				List<Order> orders = orderService.findByCustomer(user.getId());
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				if (orders != null && orders.size() > 0) {
				%>
					<table class="table">
						<thead>
							<tr>
								<th>Order date</th>
								<th>Total price</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
						<% for (Order order: orders) {
								String statusClass = "";
								String statusText = "";
								switch(order.getOrderStatus()) {
								case Order.STATUS_PLACED:
									statusText = "PLACED";
									statusClass = "btn-warning";
									break;
								case Order.STATUS_AWAITING_ITEMS:
									statusText = "AWAITING ITEMS";
									statusClass = "btn-success";
									break;
								case Order.STATUS_BEING_PACKED:
									statusText = "BEING PACKED";
									statusClass = "btn-success";
									break;
								case Order.STATUS_DISPATCHED:
									statusText = "DISPATCHED";
									statusClass = "btn-info";
									break;
								case Order.STATUS_DELIVERED:
									statusText = "DELEVERED";
									statusClass = "btn-primary";
									break;
								}
						%> 
							<tr>
								<td>
									<%=sdf.format(order.getCreatedDate()) %>
								</td>
								<td>&pound;<%=order.getTotalPrice() %></td>
								<td>
									<a class="btn-status <%=statusClass %>" href="javascript:void(0);"><%=statusText %></a>
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
				<%} else { %>
				<h4>You do not have any order yet <a href="<%=request.getContextPath()%>/">Shopping now</a></h4>
				<% }%>
			</div>
		</div>
	</div>
</div>
<%}%>