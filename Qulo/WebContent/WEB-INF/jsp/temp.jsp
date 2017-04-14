<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page session="true"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link href="<c:url value="/resources/css/compatibility.css" />"
	rel="stylesheet">

<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>

<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">



<title>User Info</title>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenu.jsp"></c:import>	


	<div class="container-fluid" id="mainContainer">
		<div class="row">
			<div class="clearFlt"></div>

			<div class="col-sm-12 col-xs-12 landingTopHalf">
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-top:3%">
				<c:if test="${sessionScope.user.gender.equals('male') }">
					<img align="center" alt="User Pic"
						src="<c:url value="/resources/images/boyAvatar.png" />"
						class="img-circle img-responsive">
					</c:if>
					<c:if test="${sessionScope.user.gender.equals('female') }">
					<img align="center" alt="User Pic"
						src="<c:url value="/resources/images/girlAvatar.png" />"
						class="img-circle img-responsive">
					</c:if>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 landingTopText">
					<span style="text-transform: capitalize;">Welcome to Qulo,
						${sessionScope.user.firstName}</span>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3"></div>

			</div>
			<div class="col-sm-12 col-xs-12 landingMid">
				<div class="clearFlt"></div>
				<div class="row ">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-2"></div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-8 "
						style="margin-left: 3%;">
						<img id="QuinLori" class="img-thumbnail" alt="Quin and Lori"
							src="<c:url value="/resources/images/quinLoriTransparent.png" />" />
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-2"></div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12"
						style="text-align: center; margin-left: 3%">
						<c:if test="${user.compatibilityQuestionsOver==0}">
						<h1 class="filler1">"Get started with the compatibility
							questions to find your match just like we did!"</h1>
						
						<form action="${pageContext.request.contextPath}/userCompatibility">
						    <button type="submit" class="btn btn-primary landingButton">Proceed to Compatibility Questions!</button>
						</form>
						</c:if>
						<c:if test="${user.compatibilityQuestionsOver==1}">
						<h1 class="filler1">"You are all set! Let's find you a match"</h1>
						
						<form action="">
						    <button type="submit" class="btn btn-primary landingButton">Proceed to Match List!</button>
						</form>
						</c:if>
					</div>
				</div>


			</div>
			<div class="col-sm-12 col-xs-12 "></div>

		</div>
	</div>

	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>
	<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>