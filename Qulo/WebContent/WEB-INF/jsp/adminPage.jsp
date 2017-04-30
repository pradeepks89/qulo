<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page session="true"%>

<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>

<link href="<c:url value="/resources/css/adminPage.css" />"
	rel="stylesheet">	
<style type="text/css">
.mainContent {
	width: 70%;
	height: auto;
	background-color: white !important;
	-webkit-box-shadow: rgba(0, 0, 255, 0.8) 0px 0 10px;
	margin-bottom: 2%;
	margin-top: 2%;
	padding-top: 10px !important;
}

.quloText {
	margin-top: 1%;
	font-family: 'Bubblegum Sans', cursive;
	font-size: 150%;
	text-align: center;
	padding-top: 0%;
	vertical-align: middle;
}

/* disable button for admin */
.blockButton {
	height: 6%;
	width: 90%;
	-webkit-box-shadow: rgba(0, 0, 255, 0.8) 0px 0 10px;
	font-size: 100%;
	letter-spacing: 1px;
	white-space: normal;
	padding-top: 10px;
}

/* Enable button for the admin page */
.enableButton {
	height: 6%;
	width: 90%;
	-webkit-box-shadow: rgba(0, 0, 255, 0.8) 0px 0 10px;
	font-size: 100%;
	letter-spacing: 1px;
	white-space: normal;
	padding-top: 10px;
	background-color: #e65a58;
}

@media ( max-width : 767px) {
	/* For mobile phones: */
	[class*="col-sm-"] {
		width: 50%;
	}
	[class*="col-sm-6"] {
		width: 100%;
	}
	.mainContent {
		width: 90%;
	}
	.quloText {
		font-size: 120%;
	}
}
</style>


<title>Admin Page</title>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenuAdmin.jsp"></c:import>
	<div class="container">
		<div class="jumbotron headerContent">
			<div class="row">
				<!-- responsive webpage for the div container -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headerText">
					<span style="text-transform: capitalize;">Admin Page</span>
				</div>
			</div>

		</div>
		<center>
			<div class="jumbotron mainContent">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 quloText">
						
					</div>
				</div>
			</div>
		</center>
		<!-- List of all users registered with Qulo website -->
		<c:forEach var="user" items="${userList}" varStatus="status">
			<center>
				<div class="jumbotron mainContent">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 quloText">
							<span>User Name <span
								class="glyphicon glyphicon-arrow-right"></span></span>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 quloText">
							<span> ${user.displayName}</span>
						</div>
						<!-- delete user button -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 quloText">
							<form:form action="adminDelete" method="post">
								<input type="hidden" name="userID" value="${user.id}">
								<!-- enable user -->
								<c:if test="${user.isEnabled == 1}">
									<input type="hidden" name="action" value="b">
									<button class="btn btn-primary blockButton" type="submit"
										align="center">Block User</button>
								</c:if>
								<c:if test="${user.isEnabled == 0}">
									<input type="hidden" name="action" value="e">
									<button class="btn btn-primary enableButton" type="submit"
										align="center">Enable User</button>
								</c:if>
							</form:form>
						</div>
					</div>
				</div>
			</center>
		</c:forEach>

		<br /> <br /> <br />
	</div>
	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>

</body>
</html>
