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

<link href="<c:url value="/resources/css/compatibility.css" />"
	rel="stylesheet">

<title>Login / Register</title>

</head>
<body>
<div
		w3-include-html="<c:url value="/resources/includeFiles/topMenuLogin.jsp" />"></div>
	<div class="container">
		<div class="myBgImage">
			<div class="row" style="margin-top:20%">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-login">
						<div class="panel-body">
							<div class="row" >
								<div class="col-lg-12">
									<div align="center">
										<p class="fillerp">Thank you for registering with us</p>
										<p class="fillerp">
											Your user name is :
											<c:out value="${user.displayName}" />
										</p>
										<p class="fillerp">
											<a href="${pageContext.request.contextPath}/login">Click here
												to Login</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div
		w3-include-html="<c:url value="/resources/includeFiles/bottomMenuLogin.jsp" />"></div>
	<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>