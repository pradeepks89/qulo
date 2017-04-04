<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link href="<c:url value="/resources/includeFiles/includeAll.html" />"
	rel="import">
<link href="<c:url value="/resources/css/loginPage.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/loginPage.js" />"></script>


<title>Login / Register</title>

</head>
<body>
	
	<!-- Page Content -->
	<div class="container">
		<div class="myBgImage">
			<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="http://phpoll.com/login/process" method="post" role="form" style="display: block;">
									<div class="form-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="3" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" id="signup-link" tabindex="4" class="sign-up">Your heart is not octopied yet? Sign Up</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								
								<form id="register-form" action="http://phpoll.com/register/process" method="post" role="form" style="display: block;">
									<div class="form-group">
										Display Name: <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Display Name" value="">
									</div>
									<div class="form-group">
										Password: <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										Confirm Password: <input type="password" name="confirm-password" id="confirm-password" tabindex="3" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										First Name: <input type="text" name="fname" id="FirstName" tabindex="4" class="form-control" placeholder="First Name" value="">
									</div>
									<div class="form-group">
										Last Name: <input type="text" name="lname" id="LastName" tabindex="5" class="form-control" placeholder="Last Name" value="">
									</div>
									<div class="form-group">
										City:
										<select name="city" id="city" tabindex="6" class="form-control">
										  <option value="bryan">Bryan</option>
										  <option value="cs">College Station</option>
										</select>
									</div>
									<div class="form-group">
										State:
										<select name="state" id="state" tabindex="7" class="form-control">
										  <option value="texas">Texas</option>
										</select>
									</div>
									<div class="form-group">
										Country:
										<select name="country" id="country" tabindex="8" class="form-control">
										  <option value="usa">USA</option>
										</select>
									</div>
									<div class="form-group">
										Date of Birth:
										<input type="date" name="dob" id="dob" tabindex="9" class="form-control" value="">
									</div>
									<div class="form-group">
										Email: <input type="email" name="email" id="email" tabindex="10" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										Gender:
										<select name="gender" id="gender" tabindex="11" class="form-control">
										  <option value="female">Female</option>
										  <option value="male">Male</option>
										</select>
									</div>
									<div class="form-group">
										Looking For:
										<select name="lookingfor" id="lookingfor" tabindex="12" class="form-control">
										  <option value="female">Female</option>
										  <option value="male">Male</option>
										</select>
									</div>
									<div class="form-group">
											About Me: <textarea name="message" rows="10" cols="30" placeholder="About me">
											</textarea>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="11" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form> 
							</div>
						</div>
					</div> 
				</div>
			</div>
		</div>
		</div>
	</div>
	
</body>
</html>