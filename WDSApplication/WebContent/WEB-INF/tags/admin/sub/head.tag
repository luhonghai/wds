<%@tag description="Head" pageEncoding="UTF-8" %>
<%@attribute name="pageTitle" required="true" %>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title><%=pageTitle %></title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="<%=request.getContextPath() %>/admin/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/admin/css/bootstrap-datepicker3.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/admin/css/dataTables.bootstrap.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/admin/css/font-awesome.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/admin/css/sweet-alert.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="<%=request.getContextPath() %>/admin/css/styles.css" rel="stylesheet">
		<script type="text/javascript">
		var App = {
			contextPath: "<%=request.getContextPath()%>",
			name: "Wholesale delivery system"
		}
		</script>
</head>