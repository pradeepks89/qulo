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

<link href="<c:url value="/resources/includeFiles/includeAll.html" />"
	rel="import">


<title>Edit Profile</title>
</head>
<body>

<div
		w3-include-html="<c:url value="/resources/includeFiles/topMenu.jsp" />"></div>

<div class="container-fluid" id="mainContainer">
<div class="row">
  <div class="col-sm-4">.col-sm-4</div>
  <div class="col-sm-8">.col-sm-8</div>
</div>
		<div class="row" >
		
			<div class="clearFlt"></div>

			<div class="col-sm-12 col-xs-12 editProfileTopHalf">
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-top:3%">
				<!-- gender variable retrieved from database to display appropriate logo - male for male, female for female -->
				<c:if test="${sessionScope.user.gender.equals('male') }">
					<img align="center" alt="User Pic"
						src="<c:url value="/resources/images/boyAvatar.png" />"
						class="img-circle img-responsive">
					</c:if>
				<!-- gender variable retrieved from database to display appropriate logo - male for male, female for female -->
					<c:if test="${sessionScope.user.gender.equals('female') }">
					<img align="center" alt="User Pic"
						src="<c:url value="/resources/images/girlAvatar.png" />"
						class="img-circle img-responsive">
					</c:if>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 editProfileTopText">
					<span style="text-transform: capitalize;">Edit Profile</span>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3"></div>

			</div>
			
			<div class="col-sm-12 col-xs-12 editProfileMid">
				
				<div class="form-group col-lg-6 col-md-6 col-sm-6">
											First Name: 
										</div>
										<div class="form-group col-lg-6 col-md-6 col-sm-6">
											Last Name: 
										</div>
										
										<div class="form-group col-lg-12 col-md-12 col-sm-12">
											Display Name: 
											
										</div>
										
										<div class="form-group form-group-lg col-lg-6 col-md-6 col-sm-6">
											Gender: 
										</div>
										<div class="form-group form-group-lg col-lg-6 col-md-6 col-sm-6">
											Looking For: 
										</div>
										<div class="form-group form-group-lg col-lg-6 col-md-6 col-sm-6">
											Date of Birth: 
										</div>
										<div class="form-group form-group-lg col-lg-6 col-md-6 col-sm-6">
											Email: 
										</div>
										
										<div class="form-group col-lg-12 col-md-12 col-sm-12">
											<p>About Yourself:</p>
											
											
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="submit" name="register-submit"
														id="register-submit" tabindex="11"
														class="form-control btn btn-register" value="Register Now">
												</div>
											</div>
										</div>
				

			</div>
			

		</div>
	</div>


<div
		w3-include-html="<c:url value="/resources/includeFiles/bottomMenu.jsp" />"></div>



    <div align="center">
        <h1>New/Edit Contact</h1>
       <c:out value="${user.displayName}"/>
        <form:form action="userProfileSave" method="post" modelAttribute="user">
        <table>
            <form:hidden path="id"/>
            
            <tr>
                <td>Email:</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><form:input path="city" /></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><form:input path="state" /></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><form:input path="country" /></td>
            </tr>
            
            <tr>
                <td>Looking for:</td>
                <td><form:input path="lookingFor" /></td>
            </tr>
            <tr>
                <td>About Yourself:</td>
                <td><form:input path="aboutMe" /></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>
