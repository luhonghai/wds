<%@tag description="Menu" pageEncoding="UTF-8" %>
<%@attribute name="index"%>

	<ul class="list-unstyled">
		<li class="nav-header"><a href="#" data-toggle="collapse"
			data-target="#userMenu">
				<h5>
					User management <i class="glyphicon glyphicon-chevron-down"></i>
				</h5>
			</a>
			<ul class="list-unstyled collapse in" id="userMenu">
				<li><a href="<%=request.getContextPath() %>/admin/user.jsp?role=0"><i class="glyphicon glyphicon-user"></i>
						Staff</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/user.jsp?role=1"><i class="glyphicon glyphicon-user"></i>
						Customer</a></li>
			</ul></li>
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/product.jsp" >
				<h5>
					Product management
				</h5>
		</a></li>
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/order.jsp" >
				<h5>
					Order management
				</h5>
		</a></li>
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/warehouse.jsp" >
				<h5>
					Warehouse management
				</h5>
		</a></li>
	</ul>

