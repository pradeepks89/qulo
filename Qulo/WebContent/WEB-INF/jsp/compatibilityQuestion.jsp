



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


<title>${title}</title>
</head>
<body>
	<div
		w3-include-html="<c:url value="/resources/includeFiles/topMenu.jsp" />"></div>
	test

	<div class="container-fluid row" id="mainContainer">
		<div class="col-sm-5" id="imageC" align="center">
			<img id="random1"
				src="<c:url value="/resources/images/MaleQulo.gif" />"
				alt="Image for guy/girl" align="left">
		</div>

		<div class="col-sm-7" id="formC"
			style="border-left: 1px solid grey border-right:1px solid grey">

			<div id='filler'>
				<h1 class="filler1">Pffft! I know forms are difficult and
					tedious, but I'm here to help you through the process.</h1>
				<h1 class="filler2">
					Let us help you in getting your heart get Octupied!<a><i
						class="icomoon icon-smiley">
				</h1>
				</i></a> <br />
				<p class="fillerp">Click Next to get started!</p>
				</h1>
			</div>
			<form:form modelAttribute="compQueList"
				action="userCompatibilitySave" method="post">
				<c:forEach var="compatibilityQuestion"
					items="${compQueList.compatibilityQuestion}" varStatus="status">
					
					<div class="qset" style="display: none;" id='question${status.index+1}'>
						<h1 class="questionh">
							<input type="hidden" name="compatibilityQuestion[${status.index}].questionID"
									value="${compatibilityQuestion.questionID}" />
							<input type = "hidden" name="compatibilityQuestion[${status.index}].question"
							value="${compatibilityQuestion.question}" />
							<label for="q${status.index}">${compatibilityQuestion.question}</label>
						</h1>
						<br />
						
						
						<div class="dropdown" id="dMenu1">
							<form:select
							path="compatibilityQuestion[${status.index}].selection"
							name="options" id="options" class="form-control">
							<c:forTokens items="${compatibilityQuestion.options}" delims="|"
								var="optionSplit">
								<form:option value="${optionSplit}">
									<c:out value="${optionSplit}" />
								</form:option>
							</c:forTokens>
						</form:select>
							<p class="errorMsg" style="display: none padding-top:10%;">Oops,
								looks like you decided to skip this question.. Remember, every
								question counts!</p>
						</div>
					</div>
					
				</c:forEach>
				<div id="buttoncontainer" align="center" v>
						<button class="btn btn-primary1 col-sm-5" type="button"
							id='previous' style="display: none" align="center">Previous</button>
						<center>
							<button class="btn btn-primary1 col-sm-5" type="button" id='next'>Next</button>
							<br /> <br />
							<input class="btn btn-primary1 col-sm-7" type="submit"
								id='submit' style="display: none">Submit</button>
								
					</div>
			</form:form>
			
		</div>

	</div>

	<div
		w3-include-html="<c:url value="/resources/includeFiles/bottomMenu.jsp" />"></div>
	<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>
