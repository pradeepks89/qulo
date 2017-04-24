<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>
<link href="<c:url value="/resources/css/registerSuccessPage.css" />"
	rel="stylesheet">

<title>Login / Register</title>
<script type="text/javascript">

function moveRight(){
	$("#b").marginLeft ="0px";
    $("#b").animate({marginLeft: "+="+($(document).width()-($(document).width()* 0.4))+"px"}, 3000,moveLeft);
}

function moveLeft(){
	$("#b").marginLeft =($(document).width()-($(document).width()* 0.4))+"px";
    $("#b").animate({marginLeft: "-="+($(document).width()-($(document).width()* 0.4))+"px"}, 3000,moveRight);
}

$(document).ready(function() {
	$('#moveright').click(function() {
		$("#b").css( "left" , "0px" );
		if($("#b").css( "left" ) == "0px")
		$("#b").animate({left: "+="+($(document).width()-($(document).width()* 0.4))+"px"}, 3000);
	});
	$('#moveleft').click(function() {
		$("#b").css( "left" , $(document).width()-($(document).width()* 0.4)+"px"  );
		if($("#b").css( "left" ) == $(document).width()-($(document).width()* 0.4)+"px" )
		$("#b").animate({left: "-="+($(document).width()-($(document).width()* 0.4))+"px"}, 3000);
	});
});

</script>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenuLogin.jsp"></c:import>
	<div class="container">
		<div class="mainContent jumbotron">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 ">
					<div class="jumbotron mainContentPart1 octoTalk">
						<div class="row" id="row_padding">
						<div class="col-xs-12 col-md-12 heartImage" align="center">
							<div id="b">
								<img id="Heart" class="img-thumbnail" alt="Heart"
									src="<c:url value="/resources/images/heart.png" />" />
							</div>
							</div>
							<div class=" col-md-6 col-xs-6 " align="left">
							<a id="moveright">
									<img id="Lori" class="img-thumbnail" alt="Lorie"
									src="<c:url value="/resources/images/FemaleQulo.gif" />" />
								</a>
							</div>
							
							<div class="col-xs-6 col-md-6" align="right">
							<a id="moveleft">
								<img id="Quin" class="img-thumbnail" alt="Quin"
									src="<c:url value="/resources/images/MaleQulo.gif" />" />
									</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 ">
					<div class="jumbotron mainContentPart2 octoTalk">
						<h2>Thank you for registering with us
						</h2>
						<h3>
							Your user name is :
							<c:out value="${user.displayName}" />
							<br/>
							<br/>
							
							<a href="${pageContext.request.contextPath}/login">Click here
								to Login</a>
						</h3>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/resources/includeFiles/bottomMenuLogin.jsp"></c:import>
</body>
</html>