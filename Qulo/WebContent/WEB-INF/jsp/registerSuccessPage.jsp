<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>
	

<title>Login / Register</title>

</head>
<body>
<c:import url="/resources/includeFiles/topMenuLogin.jsp"></c:import>
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

	<c:import url="/resources/includeFiles/bottomMenuLogin.jsp"></c:import>
</body>
</html>