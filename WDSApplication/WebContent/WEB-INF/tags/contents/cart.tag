<%@tag import="uk.ac.gre.wholesale.delivery.entities.WareHouse"%>
<%@tag import="uk.ac.gre.wholesale.delivery.service.WareHouseService"%>
<%@tag import="uk.ac.gre.wholesale.delivery.Constant"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.Product"%>
<%@tag import="uk.ac.gre.wholesale.delivery.service.ProductService"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.OrderItem"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.Order"%>
<%@tag import="java.util.List"%>
<%@tag description="Login" pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	Order order = (Order) session.getAttribute("order");
	float totalPrice = 0;
%>
<!-- Page Title -->
		<div class="section section-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Shopping Cart</h1>
					</div>
				</div>
			</div>
		</div>
 <% if (order == null || order.getOrderItems().size() == 0) { %>
 <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-md-12">
 <h4>No item found. <a href="<%=request.getContextPath()%>/">Shopping now</a></h4>
 </div>
 </div>
 </div></div>
 <% } else { %>
        <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-md-12">
						<!-- Action Buttons -->
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/cart.jsp" class="btn btn-grey btn-update"><i class="glyphicon glyphicon-refresh"></i> UPDATE</a>
							<a href="#" class="btn btn-checkout"><i class="glyphicon glyphicon-shopping-cart icon-white"></i> CHECK OUT</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!-- Shopping Cart Items -->
						<table class="shopping-cart">
						<%
							List<OrderItem> orderItems = order.getOrderItems();
							
							for (OrderItem orderItem : orderItems) {
								Product  product = productService.find(orderItem.getProductId());
								int quality = orderItem.getQuantity();
								totalPrice += product.getPrice() * quality;
						%>
							<!-- Shopping Cart Item -->
							
							<tr>
								<form action="<%=request.getContextPath()%>/handler/cart.jsp" method="POST">
								<!-- Shopping Cart Item Image -->
								<td class="image"><a href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"><img src="img/product<%=(product.getId() % Constant.MAX_TMP_IMAGE_COUNT) + 1%>.jpg" alt="<%=product.getName()%>"></a></td>
								<!-- Shopping Cart Item Description & Features -->
								<td>
									<div class="cart-item-title"><a href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"><%=product.getName()%></a></div>
								</td>
								<!-- Shopping Cart Item Quantity -->
								<td class="quantity">
									<input type="hidden" name="pid" value="<%=product.getId()%>"/>
									<input class="form-control input-sm input-micro" name="quantity" type="text" value="<%=quality%>">
								</td>
								<!-- Shopping Cart Item Price -->
								<td class="price">&pound;<%=product.getPrice() * quality%></td>
								<!-- Shopping Cart Item Actions -->
								<td class="actions">
									<button type="submit" name="action" value="update" class="btn btn-xs btn-grey"><i class="glyphicon glyphicon-pencil"></i></button>
									<button type="submit" name="action" value="delete" class="btn btn-xs btn-grey"><i class="glyphicon glyphicon-trash"></i></button>
								</td>
								</form>
							</tr>
							<% } %>
						</table>
						<!-- End Shopping Cart Items -->
					</div>
				</div>
				<div class="row">
					
					<form action="<%=request.getContextPath()%>/handler/cart.jsp" method="POST">
					
					<!-- Shopping Cart Totals -->
					<div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-6 pull-right">
						<table class="cart-totals">
							<tr>
								<td><b>Shipping</b></td>
								<td>Free</td>
							</tr>
							<tr>
								<td><b>Discount</b></td>
								<td>- $0.0</td>
							</tr>
							<tr class="cart-grand-total">
								<td><b>Total</b></td>
								<td><b>&pound;<%=totalPrice%></b></td>
							</tr>
						</table>
						<!-- Action Buttons -->
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/cart.jsp" class="btn btn-grey btn-update"><i class="glyphicon glyphicon-refresh"></i> UPDATE</a>
							<button type="submit" name="action" value="checkout" class="btn btn-checkout"><i class="glyphicon glyphicon-shopping-cart icon-white"></i> CHECK OUT</button>
						</div>
					</div>
					<!-- Choose warehouse -->
					<div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-6 pull-right">
						<div class="cart-shippment-options">
							<h6><i class="glyphicon glyphicon-plane"></i> Choose warehouse</h6>
							<div class="input-append">
								<select name="selWarehouse" class="form-control input-sm">
								<%
								 WareHouseService wareHouseService = new WareHouseService();
								List<WareHouse> wareHouses = wareHouseService.findAll();
								for (WareHouse wareHouse : wareHouses) {
								%>
									<option value="<%=wareHouse.getId()%>"><%=wareHouse.getName() %></option>
									<% } %>
								</select>
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
		
<% } %>