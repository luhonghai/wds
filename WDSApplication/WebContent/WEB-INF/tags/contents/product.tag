<%@tag import="uk.ac.gre.wholesale.delivery.Constant"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.Product"%>
<%@tag import="uk.ac.gre.wholesale.delivery.service.ProductService"%>
<%@tag import="java.util.List"%>
<%@tag description="Product" pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	Product product = productService.find(Long.parseLong(request.getParameter("id")));
%>
<div class="section">
	    	<div class="container">
	    		<div class="row">
	    			<!-- Product Image & Available Colors -->
	    			<div class="col-sm-6">
	    				<div class="product-image-large">
	    					<img src="img/product<%=(product.getId() % Constant.MAX_TMP_IMAGE_COUNT) + 1%>.jpg" alt="<%=product.getName()%>">
	    				</div>
	    			</div>
	    			<!-- End Product Image & Available Colors -->
	    			<!-- Product Summary & Options -->
	    			<div class="col-sm-6 product-details">
	    				<h4><%=product.getName() %>  <% if (product.getStockLevel() > 0) { %>
						<a href="javascript:void(0);" class="btn-success btn-status">AVAILABLE</a>
						<% } else { %>
						<a href="javascript:void(0);" class="btn-danger btn-status">OUT OF STOCK</a>
						<% } %></h4>
	    				<div class="price">
							<span class="price-was">&pound;<%=product.getPrice() + 10%></span> &pound;<%=product.getPrice()%>
						</div>
						
						<h5>Category</h5>
	    				<p>
	    					<%=product.getCategory() %>
	    				</p>
						<h5>Quick Overview</h5>
	    				<p>
	    					<%=product.getDescription() %>
	    				</p>
	    				 <% if (product.getStockLevel() > 0) { %>
	    				 <form action="<%=request.getContextPath() %>/handler/cart.jsp" method="POST">
	    				 	<input type="hidden" name="pid" value="<%=product.getId()%>"/>
	    				 	<input type="hidden" name="action" value="update"/>
							<table class="shop-item-selections">
								
								<!-- Quantity -->
								<tr>
									<td><b>Quantity:</b></td>
									<td>
										<input type="text" name="quantity" class="form-control input-sm input-micro" value="1">
									</td>
								</tr>
								<!-- Add to Cart Button -->
								<tr>
									<td>&nbsp;</td>
									<td>
										<button type="submit" class="btn btn"><i class="glyphicon glyphicon-shopping-cart"></i> Add to Cart</button>
									</td>
								</tr>
								
							</table>
						</form>
						<% } %>
	    			</div>
	    			<!-- End Product Summary & Options -->
	    		</div>
			</div>
</div>