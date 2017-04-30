<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date,java.util.Locale" %>

<%@page session="true"%>
<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>
<link href="<c:url value="/resources/css/bookDate.css" />"
	rel="stylesheet">
<title>Book Date</title>
<script>
function goBack() {
    window.history.back();
}
</script>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenu.jsp"></c:import>
	<div class="container">
		<div class="jumbotron headerContent">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headerText">
					<span style="text-transform: capitalize;">Book your date</span>
				</div>
			</div>
		</div>
		<div class="mainContent jumbotron">
			<div class="row ">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
							<div class="jumbotron datePicture octoTalk">
								<img id="QuinLori" class="" alt="Quin and Lori"
									src="<c:url value="/resources/images/quinLoriTransparent.png" />" />
							</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="jumbotron dateForm quloText">
							<c:if test="${crushDate.user1 == 0}">
								<h3>Time to book your date with ${crushName}</h3>
							</c:if>
							<c:if test="${crushDate.user1 != 0 }">
								<h3>Looks like you already have a date with ${crushName}. Would you like to update it?</h3>
							</c:if>
							
							<!--Booking a user date-->
							<form:form id="register-form" action="userBookDate"
										method="post" modelAttribute="crushDate" style="display: block;">
										<c:if test="${crushDate.user1 == 0}">
											<input type="hidden" name="action" value="insert" />
											<input type="hidden" name="user1" value="${user1}" />
											<input type="hidden" name="user2" value="${user2}"/>
										</c:if>
										<c:if test="${crushDate.user1 != 0 }">
											<input type="hidden" name="action" value="update" />
											<input type="hidden" name="user1" value="${crushDate.user1}" />
											<input type="hidden" name="user2" value="${crushDate.user2}"/>
										</c:if>
										
										<input type="hidden" name="crushName" value="${crushName}" >
										<div class="form-group col-lg-4 col-md-4 col-sm-4">
											Pick a Date: 
											<c:set var="now" value="${crushDate.meetDate}" />
											<fmt:setLocale value="en_US" />
											<fmt:parseDate value="${now}" var="parsedMeetDate" pattern="yyyy-MM-dd" />
											<fmt:formatDate var="formattedMeetDate" pattern="yyyy-MM-dd" value="${parsedMeetDate}" />
											
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate var="minDate" value="${today}" pattern="yyyy-MM-dd" />
											
											<form:input path="meetDate" type="date" name="meetDate" id="meetDate"
												tabindex="1" class="form-control txtbox" min="${minDate}" value="${formattedMeetDate}" required="required"/>
										</div>
										<div class="form-group col-lg-8 col-md-8 col-sm-8">
											Location:
											<form:input path="meetLocation" name="meetLocation" id="meetLocation"
												tabindex="2" class="form-control txtbox" placeholder="Where do you want to meet?" required="required"/>
										</div>

										<div class="form-group col-lg-12 col-md-12 col-sm-12">
											Note for the Date:
											
											<form:textarea required="required" path="meetNote" name="meetNote" id="meetNote"
												tabindex="3" placeholder="A special note for the date" />
										</div>
										
										<div class="form-group col-lg-6 col-md-6 col-sm-6 ">
											<c:if test="${crushDate.user1 == 0}">
													<input type="submit" name="register-submit"
														id="register-submit" tabindex="11"
														class="form-control btn btn-primary updateButton" value="Save">
											</c:if>
											<c:if test="${crushDate.user1 != 0}">
													<input type="submit" name="register-submit"
														id="register-submit" tabindex="11"
														class="form-control btn btn-primary updateButton" value="Update">
											</c:if>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 ">
											<button class="btn btn-primary updateButton" onclick="goBack()">Back</button>
										</div>
									
									</form:form>
									
							</div>
				</div>
								
			</div>
		</div>
		</div>
	
	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>

</body>
</html>
