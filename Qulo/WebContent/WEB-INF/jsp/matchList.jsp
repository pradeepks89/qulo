<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page session="true"%>

<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>

<link href="<c:url value="/resources/css/matchList.css" />"
	rel="stylesheet">



<title>Match List</title>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenu.jsp"></c:import>

	<div class="container">
		<div class="jumbotron headerContent">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headerText">
					<span style="text-transform: capitalize;">Your Ideal Matches</span>
				</div>
			</div>

		</div>
		
			<div class="mainContent jumbotron">
				<div class="row ">
					<c:if test="${removeSuccess == 1}">
					<div class="alert alert-info alert-dismissable">
						<img id="alertlogo" alt="Logo" 
							src="<c:url value="/resources/images/logo.gif" />" />
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Well !</strong> ${crushName} has
						been removed from your crush list.
						</div>
					</c:if>
					<c:if test="${addSuccess == 1}">
					<div class="alert alert-info alert-dismissable">
							<img id="alertlogo" alt="Logo" 
							src="<c:url value="/resources/images/logo.gif" />" />
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Awesome !</strong> ${crushName} has
						been added to your crush list.
						</div>
					</c:if>
					<c:forEach var="user" items="${matchList.userMatchList}"
						varStatus="status">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 quloText">
							<div class="jumbotron mainContentPart ">
							<p>${user.lastName}, ${user.firstName} </p>
							<p>${user.age} years old</p>
							<c:if test="${user.fileName == null }">
								<c:if test="${user.gender.equals('male') }">
								<center><img align="middle" alt="User Pic"
									src="<c:url value="/resources/images/boyAvatar.png" />"
									class="img-circle img-responsive profilePic" ></center>
								</c:if>
								<c:if test="${user.gender.equals('female') }">
								<center><img align="middle" alt="User Pic"
									src="<c:url value="/resources/images/girlAvatar.png" />"
									class="img-circle img-responsive profilePic"></center>
								</c:if>
							</c:if>
							<c:if test="${user.fileName != null }">
								<center><img align="middle" alt="User Pic" class="img-circle img-responsive profilePic"
									src="data:image/${user.fileName};base64,${user.fileData}" />
									</center>
							</c:if>
							<br/>
							<form:form 
								action="userMatchList" method="post">
							
									<input type="hidden" name="crush" value ="${user.id}">
									<input type="hidden" name="crushName" value="${user.firstName}">
									<c:if test="${user.isCrush == 0}">
									<input type="hidden" name="action" value ="add">
									<button  class="btn btn-primary addCrushButton" type="submit" 
										 align="center">Add
									to Crush list</button>
									</c:if>
									<c:if test="${user.isCrush == 1}">
									<input type="hidden" name="action" value ="remove">
									<button  class="btn btn-primary removeCrushButton" type="submit" 
										 align="center">Remove from Crush list</button>
									</c:if>
								</form:form>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		
	</div>
	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>

</body>
</html>