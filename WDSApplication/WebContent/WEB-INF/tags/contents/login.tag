<%@tag description="Login" pageEncoding="UTF-8"%>
<!-- Page Title -->
<div class="section section-breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Login</h1>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<div class="basic-login">
					<%
						String errorLogin = (String) session.getAttribute("errorLogin");
					if (errorLogin != null && errorLogin.length() > 0) {
					%>
					<div class="alert alert-danger alert-dismissible" role="alert">
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						  <strong>Could not login!</strong> <%=errorLogin %>
					</div>
					<%
						session.setAttribute("errorLogin", null);
					} %>
					<form action="<%=request.getContextPath() %>/handler/auth.jsp" role="form" role="form">
						<div class="form-group">
							<label for="login-username"><i class="icon-user"></i> <b>Username
									or Email</b></label> <input class="form-control" name="txtEmail" id="login-username"
								type="text" placeholder="">
						</div>
						<div class="form-group">
							<label for="login-password"><i class="icon-lock"></i> <b>Password</b></label>
							<input class="form-control" id="login-password" name="txtPassword" type="password"
								placeholder="">
						</div>
						<div class="form-group">
							<label class="checkbox"> <input type="checkbox">
								Remember me
							</label> <a href="<%=request.getContextPath() %>/forgot-password.jsp"
								class="forgot-password">Forgot password?</a>
							<button type="submit" name="action" value="login" class="btn pull-right">Login</button>
							<div class="clearfix"></div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-7 social-login">
				<div class="basic-login">
					<%
						String errorRegister = (String) session.getAttribute("errorRegister");
					if (errorRegister != null && errorRegister.length() > 0) {
					%>
					<div class="alert alert-danger alert-dismissible" role="alert">
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						  <strong>Could not register!</strong> <%=errorRegister %>
					</div>
					<%
						session.setAttribute("errorRegister", null);
					} %>
					<form role="form" action="<%=request.getContextPath() %>/handler/auth.jsp">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="txtFirstName"><i class="icon-user"></i>
										<b>First name</b></label> <input class="form-control"
										name="txtFirstName" type="text" placeholder="">
								</div>
								<div class="form-group">
									<label for="txtLastName"><i class="icon-lock"></i>
										<b>Last name</b></label> <input class="form-control"
										name="txtLastName" type="text" placeholder="">
								</div>
								<div class="form-group">
									<label for="txtEmail"><i class="icon-user"></i>
										<b>Email</b></label> <input class="form-control"
										name="txtEmail" type="text" placeholder="">
								</div>
								<div class="form-group">
									<label for="txtPassword"><i class="icon-lock"></i>
										<b>Password</b></label> <input class="form-control"
										name="txtPassword" type="password" placeholder="">
								</div>
								<div class="form-group">
									<label for="txtCPassword"><i class="icon-lock"></i>
										<b>Re-enter Password</b></label> <input class="form-control"
										name="txtCPassword" type="password" placeholder="">
								</div>
							</div>
							<div class="col-sm-6">
								
								<div class="form-group">
									<label for="gender"><i class="icon-lock"></i>
										<b>Gender</b></label> 
					                <label class="checkbox-inline">
					                  <input type="radio" name="gender" value="male" checked>
					                  Male
					                </label>
					                <label class="checkbox-inline">
					                  <input type="radio" name="gender" value="female">
					                  Female
					                </label>
								</div>
								<div class="form-group">
									<label for="txtDob"><i class="icon-lock"></i>
										<b>Date of birth</b></label> <input class="form-control datepicker-input"
										name="txtDob" type="text" placeholder="">
								</div>
								<div class="form-group">
									<label for="txtPhone"><i class="icon-lock"></i>
										<b>Phone</b></label> <input class="form-control"
										name="txtPhone" type="text" placeholder="">
								</div>
								<div class="form-group">
									<label for="txtAddress"><i class="icon-lock"></i>
										<b>Address</b></label> <textarea class="form-control"
										name="txtAddress" placeholder="" rows="7"></textarea>
								</div>
							</div>
						</div>

						<div class="form-group">
							<button name="action" value="register" type="submit" class="btn pull-right">Register now</button>
							<div class="clearfix"></div>
						</div>
					</form>
					<div class="not-member">
						<p>Not a member? Register now!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>