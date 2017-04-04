<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link href="<c:url value="/resources/includeFiles/includeAll.html" />"
	rel="import">
<link href="<c:url value="/resources/css/loginPage.css" />"
	rel="stylesheet">
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

									<form id="login-form" name='f'
										action="${pageContext.request.contextPath}/j_spring_security_check"
										method='POST' style="display: block;">
										<div class="form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input type="text"
												name="username" id="username" tabindex="1"
												class="form-control" placeholder="Username" value="">
										</div>
										<div class="form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												name="password" id="password" tabindex="2"
												class="form-control" placeholder="Password">
											<!-- /login?error=true -->
											<c:if test="${param.error == 'true'}">
												<div style="color: red; margin: 10px 0px;">

													Login Failed!!!<br /> Reason :
													${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

												</div>
											</c:if>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="submit" name="login-submit" id="login-submit"
														tabindex="3" class="form-control btn btn-login"
														value="Log In">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-lg-12">
													<div class="text-center">
														<a href="#" id="signup-link" tabindex="4" class="sign-up">Your
															heart is not octopied yet? Sign Up</a>
													</div>
												</div>
											</div>
										</div>
									</form>

									
										<form:form id="register-form" action="registerUser" method="post" modelAttribute="user" style="display: block;">
										<div class="form-group">
											Display Name: <form:input path="displayName" name="username"
												id="username" tabindex="1" class="form-control"
												placeholder="Display Name"/>
											
										</div>
										<div class="form-group">
											Password: <form:input path="password" name="password"
												id="password" tabindex="2" class="form-control"
												placeholder="Password"/>
										</div>
										<div class="form-group">
											Confirm Password: <input type="password"
												name="confirm-password" id="confirm-password" tabindex="3"
												class="form-control" placeholder="Confirm Password">
										</div>
										<div class="form-group">
											First Name: <form:input path="firstName" name="firstName" id="firstName"
												tabindex="4" class="form-control" placeholder="First Name"/>
										</div>
										<div class="form-group">
											Last Name: <form:input path="lastName" name="lastName" id="lastName"
												tabindex="5" class="form-control" placeholder="Last Name"/>
										</div>
										<div class="form-group">
											City: <form:select path="city" name="city" id="city" tabindex="6"
												class="form-control">
												<form:option value="bryan">Bryan</form:option>
												<form:option value="cs">College Station</form:option>
											</form:select>
										</div>
										<div class="form-group">
											State: <form:select path="state" name="state" id="state" tabindex="7"
												class="form-control">
												<form:option value="texas">Texas</form:option>
											</form:select>
										</div>
										<div class="form-group">
											Country: <form:select path="country" name="country" id="country" tabindex="8"
												class="form-control">
												<form:option value="usa">USA</form:option>
											</form:select>
										</div>
										<div class="form-group">
											Date of Birth: <form:input path="dob" type="date" name="dob" id="dob"
												tabindex="9" class="form-control" />
										</div>
										<div class="form-group">
											Email: <form:input path="email" type="email" name="email" id="email"
												tabindex="10" class="form-control"
												placeholder="Email Address" />
										</div>
										<div class="form-group">
											Gender: <form:select path="gender" name="gender" id="gender" tabindex="11"
												class="form-control">
												<form:option value="female">Female</form:option>
												<form:option value="male">Male</form:option>
											</form:select>
										</div>
										<div class="form-group">
											Looking For: <form:select path="lookingFor" name="lookingFor" id="lookingFor"
												tabindex="12" class="form-control">
												<form:option value="female">Female</form:option>
												<form:option value="male">Male</form:option>
											</form:select>
										</div>
										<div class="form-group">
											About Me:
											<form:textarea path="aboutMe" name="aboutMe" rows="10" cols="30"
												placeholder="About me"/>
											
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="submit" name="register-submit"
														id="register-submit" tabindex="11"
														class="form-control btn btn-register" value="Register Now">
												</div>
											</div>
										</div>
									</form:form>
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