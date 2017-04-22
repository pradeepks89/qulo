<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
							<h3>Time to book your date with ${crushName}</h3>
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
										
										<input type="hidden" name="crushName" value="${crushName}">
										<div class="form-group col-lg-3 col-md-3 col-sm-3">
											Pick a Date:
											<form:input path="meetDate" type="date" name="meetDate" id="meetDate"
												tabindex="1" class="form-control"  />
										</div>
										<div class="form-group col-lg-9 col-md-9 col-sm-9">
											Location:
											<form:input path="meetLocation" name="meetLocation" id="meetLocation"
												tabindex="2" class="form-control" placeholder="Where do you want to meet?" />
										</div>

										<div class="form-group col-lg-12 col-md-12 col-sm-12">
											Note for the Date:
											
											<form:textarea path="meetNote" name="meetNote" id="meetNote"
												tabindex="3" placeholder="A special note for the date" />
										</div>
										
										<div class="form-group col-lg-6 col-md-6 col-sm-6 ">
													<input type="submit" name="register-submit"
														id="register-submit" tabindex="11"
														class="form-control btn btn-primary updateButton" value="Update">
													
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