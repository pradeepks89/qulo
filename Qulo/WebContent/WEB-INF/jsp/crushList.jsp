<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>
<link href="<c:url value="/resources/css/crushList.css" />"
	rel="stylesheet">
<title>Crush List</title>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenu.jsp"></c:import>
	<div class="container">
		<div class="jumbotron headerContent">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headerText">
					<span style="text-transform: capitalize;">Your Crush List</span>
				</div>
			</div>
		</div>
		
		<!--Main container-->
		<div class="mainContent jumbotron">
			
			<!--Area that notifies the user that a new user has been added to crushlist or an existing user has been removed from crushlist-->
			<div class="row ">
				<c:if test="${dateSuccess == 1}">
					<div class="alert alert-success alert-dismissable">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Congratulations!</strong> Your date with ${crushName} has
						been booked.
					</div>
				</c:if>
				
				<c:if test="${removeSuccess == 1}">
					<div class="alert alert-info alert-dismissable">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Well !</strong> ${crushName} has
						been removed from your crush list.
					</div>
				</c:if>
				<c:set var="count" value="0" scope="page" />
				<c:forEach var="user" items="${matchList.userMatchList}"
					varStatus="status">
					
					<!--Area that displays the entire crushlist-->
					<c:if test="${user.isCrush == 1}">
						<c:set var="count" value="${count + 1}" scope="page" />
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 quloText">
							<div class="jumbotron mainContentPart ">
								<p>${user.firstName} ${user.lastName}</p>
								<p>${user.age}years old</p>
								<c:if test="${user.fileName == null }">
									<c:if test="${user.gender.equals('male') }">
										<center>
											<img align="middle" alt="User Pic"
												src="<c:url value="/resources/images/boyAvatar.png" />"
												class="img-circle img-responsive profilePic">
										</center>
									</c:if>
									<c:if test="${user.gender.equals('female') }">
										<center>
											<img align="middle" alt="User Pic"
												src="<c:url value="/resources/images/girlAvatar.png" />"
												class="img-circle img-responsive profilePic">
										</center>
									</c:if>
								</c:if>
								<c:if test="${user.fileName != null }">
									<center>
										<img align="middle" alt="User Pic"
											class="img-circle img-responsive profilePic"
											src="data:image/${user.fileName};base64,${user.fileData}" />
									</center>
								</c:if>
								<br />
								<form:form action="userCrushList" method="post">
									<input type="hidden" name="crush" value="${user.id}">
									<input type="hidden" name="action" value="remove">
									<input type="hidden" name="crushName" value="${user.firstName}">
									<button class="btn btn-primary removeCrushButton" type="submit"
										align="center">Remove from Crush list</button>
								</form:form>
								<form:form action="userBookDate" method="post">
									<input type="hidden" name="user1" value="${loggedInUser.id}">
									<input type="hidden" name="user2" value="${user.id}">
									<input type="hidden" name="crushName" value="${user.firstName}">
									<button type="submit" class="btn btn-primary addDateButton"
										<c:if test="${user.mutualCrush == 0}">
													    	disabled="disabled"
													    	title="Waiting for your crush to add you"
													    </c:if>>
										Book / View Date</button>
								</form:form>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${count == 0}">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="jumbotron mainContentPart octoTalk">
							<img id="QuinLori" class="" alt="Quin and Lori"
								src="<c:url value="/resources/images/quinLoriTransparent.png" />" />
							<c:if test="${loggedInUser.compatibilityQuestionsOver==0}">
								<h1 class="">"Get started with the compatibility questions
									to find your match to add to your crush list!"</h1>

								<form
									action="${pageContext.request.contextPath}/userCompatibility">
									<button type="submit"
										class="btn btn-primary compatibilityButton">Proceed
										to Compatibility Questions!</button>
								</form>
							</c:if>
							<!--Message that is displayed when the crushlist is empty-->
							<c:if test="${loggedInUser.compatibilityQuestionsOver==1}">
								<h1 class="octoTalk">"Looks like no one is here! Let's find
									you some matches to add to your crush list "</h1>

								<form:form action="userMatchList" method="post">
									<button type="submit"
										class="btn btn-primary compatibilityButton">Click
										here to view Match List!</button>
								</form:form>
							</c:if>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>

</body>
</html>
