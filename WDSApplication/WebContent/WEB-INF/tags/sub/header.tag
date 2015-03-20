<%@tag import="uk.ac.gre.wholesale.delivery.entities.Order"%>
<%@tag description="Header" pageEncoding="UTF-8" %>
<%@attribute name="index"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%
	User user = (User) session.getAttribute("user");
	int items = 0;
	Order order = (Order) session.getAttribute("order");
	if (order != null)
		items = order.getOrderItems().size();
%>
<!-- Header -->
<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        
        <!-- Navigation & Logo-->
        <div class="mainmenu-wrapper">
	        <div class="container">
	        	<div class="menuextras">
					<div class="extras">
						<ul>
							<li><i class="glyphicon glyphicon-shopping-cart icon-white"></i> <a href="<%=request.getContextPath()%>/cart.jsp"><b><%=items %> item<%=items > 0 ? "s" :"" %></b></a></li>
							<li>
								<div class="dropdown choose-country">
									<a class="#" data-toggle="dropdown" href="#"><img src="img/flags/gb.png" alt="Great Britain"> UK</a>
									<ul class="dropdown-menu" role="menu">
										<li role="menuitem"><a href="#"><img src="img/flags/us.png" alt="United States"> US</a></li>
										<li role="menuitem"><a href="#"><img src="img/flags/de.png" alt="Germany"> DE</a></li>
										<li role="menuitem"><a href="#"><img src="img/flags/es.png" alt="Spain"> ES</a></li>
									</ul>
								</div>
							</li>
			        		<li>
			        			<%
			        			 if (user == null) {
			        			%>
			        			<a href="<%=request.getContextPath()%>/login.jsp">Login</a>
			        			<% } else { %>
			        			<div class="dropdown choose-country">
			        			<a class="#" data-toggle="dropdown" href="#"><%=user.getEmail()%></a>
									<ul class="dropdown-menu" role="menu">
										<li role="menuitem"><a href="#">Profile</a></li>
										<li role="menuitem"><a href="<%=request.getContextPath()%>/handler/auth.jsp?action=logout">Logout</a></li>
									</ul>
									</div>
			        			<% } %>
			        		</li>
			        	</ul>
					</div>
		        </div>
		        <nav id="mainmenu" class="mainmenu">
					<ul>
						<li class="logo-wrapper"><a style="font-size: 24px;font-weight: bold;" href="<%=request.getContextPath()%>/">Shopping Online</a></li>
						<li <%=(Integer.parseInt(index) == 0 ? "class=\"active\"" : "")%> >
							<a href="<%=request.getContextPath()%>/">Home</a>
						</li>
						<li <%=(Integer.parseInt(index) == 1 ? "class=\"active\"" : "")%>>
							<a href="<%=request.getContextPath()%>/cart.jsp">Shopping Cart</a>
						</li >	
						<li <%=(Integer.parseInt(index) == 2 ? "class=\"active\"" : "")%>>
							<a href="<%=request.getContextPath()%>/order.jsp">Orders</a>
						</li >
						<%-- <li <%=(Integer.parseInt(index) == 3 ? "class=\"active\"" : "")%>>
							<a href="<%=request.getContextPath()%>/contact-us.jsp">Contact us</a>
						</li> --%>
					</ul>
				</nav>
			</div>
</div>
<!-- /Header -->
