<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Bootstrap Login Form</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="<%=request.getContextPath() %>/admin/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="<%=request.getContextPath() %>/admin/css/login.css" rel="stylesheet">
	</head>
	<body>
<!--login modal-->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          
          <h1 class="text-center">Wholesale delivery system</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block" action="<%=request.getContextPath() %>/admin/login-handler.jsp">
            <div class="form-group">
              <input type="text" class="form-control input-lg" name="txtEmail" placeholder="Email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control input-lg" name="txtPassword" placeholder="Password">
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-lg btn-block">Sign In</button>
              <!-- <span class="pull-right"><a href="#">Register</a></span> -->
              <span><a href="#">Need help?</a></span>
            </div>
          </form>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
         
		  </div>	
      </div>
  </div>
  </div>
</div>
	<!-- script references -->
	<script src="<%=request.getContextPath() %>/admin/js/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/admin/js/bootstrap.min.js"></script>
	</body>
</html>