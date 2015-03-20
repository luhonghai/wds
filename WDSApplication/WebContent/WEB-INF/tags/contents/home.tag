<%@tag import="uk.ac.gre.wholesale.delivery.entities.Product"%>
<%@tag import="uk.ac.gre.wholesale.delivery.service.ProductService"%>
<%@tag import="java.util.List"%>
<%@tag description="Home" pageEncoding="UTF-8"%>
<%
	int MAX_TMP_IMAGE_COUNT = 8;
	ProductService productService = new ProductService();
	List<Product> products = productService.findAll();
%>
<div class="eshop-section section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="products-slider">
					<%
						if (products != null && products.size() > 0) {
							for (Product product : products) {
								/* if (product.getStockLevel() == 0)
									continue; */
					%>
					<!-- Products Slider Item -->
					<div class="shop-item">
						<!-- Pricing Ribbon -->
						<div class="ribbon-wrapper">
							<div class="price-ribbon ribbon-green">New</div>
						</div>
						<!-- Product Image -->
						<div class="image">
							<a
								href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"><img
								src="img/product<%=(product.getId() % MAX_TMP_IMAGE_COUNT) + 1%>.jpg"
								alt="<%=product.getName()%>"></a>
						</div>
						<!-- Product Title -->
						<div class="title">
							<h3>
								<a
									href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"><%=product.getName()%></a>
							</h3>
						</div>
						<!-- Product Price -->
						<div class="price">
							&pound;<%=product.getPrice()%>
						</div>
						<!-- Buy Button -->
						<div class="actions">
							<a
								href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"
								class="btn btn-small"><i
								class="icon-shopping-cart icon-white"></i> Buy</a>
						</div>
					</div>
					<%
						}
						}
					%>

				</div>
			</div>
		</div>
		<div class="row">
			<%
				if (products != null && products.size() > 0) {
					for (int i = 0; i < products.size(); i++) {
						Product product = products.get(i);
						/* if (product.getStockLevel() == 0)
							continue; */
			%>

			<div class="col-md-3 col-sm-6">
				<div class="shop-item">
					<div class="shop-item-image">
						<a
							href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"><img
							src="img/product<%=(product.getId() % MAX_TMP_IMAGE_COUNT) + 1%>.jpg"
							alt="<%=product.getName()%>"></a>
					</div>
					<div class="title">
						<h3>
							<a
								href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"><%=product.getName()%></a>
						</h3>
					</div>
					<div class="price">
						&pound;<%=product.getPrice()%></div>
					<div class="description">
						<p><%=product.getDescription()%></p>
					</div>
					<div class="actions">
						<a
							href="<%=request.getContextPath()%>/product.jsp?id=<%=product.getId()%>"
							class="btn btn-small"><i
							class="glyphicon glyphicon-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
			</div>
			<%
				if (i > 3 && (i + 1) % 4 == 0) {
			%>
		</div>
		<div class="row">
			<%
				}
			%>
			<%
				}
				}
			%>
		</div>
		<div class="pagination-wrapper ">
			<ul class="pagination pagination-lg">
				<li class="disabled"><a href="#">Previous</a></li>
				<li class="active"><a href="#">1</a></li>
				<li class="disabled"><a href="#">Next</a></li>
			</ul>
		</div>
	</div>
</div>