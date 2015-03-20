<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/contents"%>

<t:main pageTitle="Forgot password" index="0">
	
<!-- Page Title -->
		<div class="section section-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Password Reset</h1>
					</div>
				</div>
			</div>
		</div>
        
        <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<div class="basic-login">
							<form>
								<div class="form-group">
		        				 	<label for="restore-email"><i class="icon-envelope"></i> <b>Enter Your Email</b></label>
									<input class="form-control" id="restore-email" type="text" placeholder="">
								</div>
								<div class="form-group">
									<button type="submit" class="btn pull-right">Reset Password</button>
									<div class="clearfix"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</t:main>
