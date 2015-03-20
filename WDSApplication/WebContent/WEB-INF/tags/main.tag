<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="include" tagdir="/WEB-INF/tags/sub" %>
<%@attribute name="pageTitle" required="true" %>
<%@attribute name="index"%>
<%@tag import="uk.ac.gre.wholesale.delivery.entities.User"%>
<%
	User user = (User) session.getAttribute("user");
 	if (user == null) {
 		//response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
 	}
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <include:head pageTitle="<%=pageTitle%>">
    </include:head>
<body>
	<include:header index="<%=index %>"></include:header>
	<jsp:doBody/>
    <include:footer></include:footer>
</body>
</html>

