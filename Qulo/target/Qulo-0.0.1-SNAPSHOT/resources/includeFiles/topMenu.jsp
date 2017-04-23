<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand logo" href="${pageContext.request.contextPath}/userInfo">
				<img id="logo" alt="Logo" 
				src="<c:url value="/resources/images/logo.gif" />" />
			</a>
			<!-- <a class="navbar-brand" href="#"> <img id="qulo" alt="brand" src="qulobrand.png"/></a> -->
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/userInfo" style="text-transform: capitalize"><i class="glyphicon glyphicon-user" ></i>
						${sessionScope.user.firstName} </a></li>
				<li><a href="${pageContext.request.contextPath}/userCrushList"><i class="glyphicon glyphicon-heart"></i>
						Crushlist</a></li>

				<li><a href="${pageContext.request.contextPath}/logout"><i
						class="glyphicon glyphicon-log-out"></i> Logout</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>