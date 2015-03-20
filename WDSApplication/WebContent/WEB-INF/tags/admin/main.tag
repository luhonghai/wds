<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="include" tagdir="/WEB-INF/tags/admin/sub" %>
<%@attribute name="pageTitle" required="true" %>
<%@attribute name="index"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%
	User user = (User) session.getAttribute("admin");
 	if (user == null) {
 		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
 	}
%>
<!DOCTYPE html>
<html lang="en">
    <include:head pageTitle="<%=pageTitle%>">
    </include:head>
<body>
	<include:header index="<%=index %>"></include:header>
	<!-- Main -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3">
				<include:menu index="<%=index %>"></include:menu>
			</div>
			<div class="col-sm-9">
				<jsp:doBody/>
			</div>
		</div>
	</div>
	
    <include:footer></include:footer>
</body>
</html>

