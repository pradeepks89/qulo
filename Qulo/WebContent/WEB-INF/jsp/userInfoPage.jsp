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
<link href="<c:url value="/resources/includeFiles/includeAll.html" />"
	rel="import">
<link href="<c:url value="/resources/css/compatibility.css" />"
	rel="stylesheet">


<title>User Info</title>
</head>
<body> 
    <div
		w3-include-html="<c:url value="/resources/includeFiles/topMenu.jsp" />"></div>
	

	<div class="container-fluid" id="mainContainer">
		<div class="row" >
			<div class="col-sm-6 col-xs-12 vcenter">
				<c:out value="${user.displayName}"/> ${sessionScope.user.compatibilityQuestionsOver} 
    <a href="${pageContext.request.contextPath}/userProfileEdit">Edit Profile</a>
			</div>
			<div class="col-sm-6 col-xs-12 vcenter">
					<h3>Welcome : ${pageContext.request.userPrincipal.name}</h3>
	</div>
</div>
</div>

	<div
		w3-include-html="<c:url value="/resources/includeFiles/bottomMenu.jsp" />"></div>
	<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>