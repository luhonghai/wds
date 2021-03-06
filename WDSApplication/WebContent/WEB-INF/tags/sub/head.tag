<%@tag description="Head" pageEncoding="UTF-8" %>
<%@attribute name="pageTitle" required="true" %>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><%=pageTitle %></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
        <link href="<%=request.getContextPath() %>/admin/css/bootstrap-datepicker3.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/icomoon-social.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/leaflet.css" />
		<!--[if lte IE 8]>
		    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/leaflet.ie.css" />
		<![endif]-->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">

        <script src="<%=request.getContextPath() %>/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script type="text/javascript">
		var App = {
			contextPath: "<%=request.getContextPath()%>",
			name: "Wholesale delivery system"
		}
		</script>
</head>