<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page session="true"%>

<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>

<link href="<c:url value="/resources/css/landingPage.css" />"
	rel="stylesheet">



<title>User Info</title>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenu.jsp"></c:import>

	<div class="container">
		<div class="jumbotron headerContent">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headerText">
					<span style="text-transform: capitalize;">Welcome to Qulo,
						${sessionScope.user.firstName}</span>
				</div>
			</div>

		</div>
		
		<div class="mainContent jumbotron">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 landingTextPage">
				<div class="jumbotron mainContentPart1 octoTalk">
					<img id="QuinLori" class="" alt="Quin and Lori"
							src="<c:url value="/resources/images/quinLoriTransparent.png" />" />
							${user.score}
							<c:if test="${user.compatibilityQuestionsOver==0}">
						<h1 class="">"Get started with the compatibility
							questions to find your match just like we did!"</h1>
						
						<form action="${pageContext.request.contextPath}/userCompatibility">
						    <button type="submit" class="btn btn-primary compatibilityButton">Proceed to Compatibility Questions!</button>
						</form>
						</c:if>
						<c:if test="${user.compatibilityQuestionsOver==1}">
						<h1 class="octoTalk">"You are all set! Let's find you a match"</h1>
						
						<form action="">
						    <button type="submit" class="btn btn-primary compatibilityButton">Proceed to Match List!</button>
						</form>
						</c:if>
						</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 landingTextPage">
				<div class="jumbotron">
					<span style="text-transform: capitalize;">Welcome to Qulo,
						${sessionScope.user.firstName}</span>
						</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 landingTextPage">
				<div class="jumbotron">
					<span style="text-transform: capitalize;">Welcome to Qulo,
						${sessionScope.user.firstName}</span>
						</div>
				</div>
			</div>

		</div>
	</div>

	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>
	<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>