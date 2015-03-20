<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/admin"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/admin/contents"%>

<%
	String mRole = request.getParameter("role");
	int index = 1;
	if (mRole != null && mRole.equalsIgnoreCase("0")) {
		 index = 2;
	}
%>
<t:main pageTitle="Customer management" index="<%=Integer.toString(index) %>">
	<c:user-management></c:user-management>
</t:main>
