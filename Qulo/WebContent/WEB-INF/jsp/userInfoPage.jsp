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

<script src="<c:url value="/resources/js/bootstrap-filestyle.min.js"/>"></script>
<script type="text/javascript">
$(":file").filestyle({icon: false});
</script>
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
				<div class="col-lg-4 col-md-4 col-sm-4 quloText">
					<div class="jumbotron mainContentPart1 octoTalk">
						<img id="QuinLori" class="" alt="Quin and Lori"
							src="<c:url value="/resources/images/quinLoriTransparent.png" />" />

						<c:if test="${user.compatibilityQuestionsOver==0}">
							<h1 class="">"Get started with the compatibility questions
								to find your match just like we did!"</h1>

							<form
								action="${pageContext.request.contextPath}/userCompatibility">
								<button type="submit"
									class="btn btn-primary compatibilityButton">Proceed to
									Compatibility Questions!</button>
							</form>
						</c:if>
						<c:if test="${user.compatibilityQuestionsOver==1}">
							<h1 class="octoTalk">"You are all set! Let's find you a
								match"</h1>

							<form:form action="userMatchList" method="post">
								<button type="submit"
									class="btn btn-primary compatibilityButton">Proceed to
									Match List!</button>
							</form:form>
						</c:if>
					</div>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-8 quloText">
					<div class="jumbotron mainContentPart2">
						<div class="row">
							<div
								class="col-lg-12 col-md-12 col-sm-12 quloText">
								<h3>Profile Picture</h3>
								<hr />
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4  ">
							<c:if test="${userImageExt == null}">
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
								<c:if test="${userImageExt != null}">
									<img class="img-circle img-responsive profilePic"
									src="data:image/${userImageExt};base64,${userImage}" />
								</c:if>
								
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 quloText">
								<form method="post" action="userImageUpload"
									enctype="multipart/form-data">
									<h3>
										Upload new picture to change your profile picture
									</h3>
									<input type="file" class="filestyle" name="fileUpload" data-icon="false" >
									<p>
										<input type="submit" class="btn btn-primary uploadButton"
											value="Upload" />
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
		<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>
		<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>