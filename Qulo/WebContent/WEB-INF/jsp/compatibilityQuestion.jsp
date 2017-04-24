<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page session="true"%>
<html>
<head>
<c:import url="/resources/includeFiles/includeAll.jsp"></c:import>
<link href="<c:url value="/resources/css/compatibilityPage.css" />"
	rel="stylesheet">


<title>Compatibility Questions</title>
</head>
<body>
	<c:import url="/resources/includeFiles/topMenu.jsp"></c:import>
	<div class="container">
		<div class="jumbotron headerContent">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headerText">
					<span style="text-transform: capitalize;">Compatibility
						Questions</span>
				</div>
			</div>
		</div>
		<div class="mainContent jumbotron">
			<form:form modelAttribute="compQueList"
				action="userCompatibilitySave" method="post">
				<div class="row questionArea">
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 imageContent ">
						<img id="compatibilityImage"
							src="<c:url value="/resources/images/MaleQulo.gif" />"
							alt="Image for guy/girl" >
					</div>

					<div
						class="col-lg-9 col-md-9 col-sm-12 col-xs-12 question">
						<div class='opening'>
							<div class="jumbotron questionBox octoTalk">
								<h1>Pffft! I know forms are difficult and tedious, but I'm
									here to help you through the process.</h1>

								<h1>Let us help you in getting your heart get Octupied!</h1>
								
							</div>
						</div>
						<c:forEach var="compatibilityQuestion"
									items="${compQueList.compatibilityQuestion}" varStatus="status">

									<div class="qset" style="display: none;"
										id='question${status.index+1}'>
										<div class="jumbotron questionBox octoTalk">
										<h1>
											<input type="hidden"
												name="compatibilityQuestion[${status.index}].questionID"
												value="${compatibilityQuestion.questionID}" /> <input
												type="hidden"
												name="compatibilityQuestion[${status.index}].question"
												value="${compatibilityQuestion.question}" /> <label
												class="filler2" for="q${status.index}">${compatibilityQuestion.question}</label>
										</h1>
										</div>
									</div>
								</c:forEach>
					</div>
				</div>
				<div class="row answerArea">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="jumbotron answer">
							<div class="row">
								<div
									class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainContentAnswerSelect">
									<div class='opening'>
										<p class="quloText" >Click
											Next to get started!</p>
									</div>
									<c:forEach var="compatibilityQuestion"
										items="${compQueList.compatibilityQuestion}"
										varStatus="status">

										<div class="qset" style="display: none;"
											id='answer${status.index+1}'>
											<div class="dropdown" id="dMenu1">
												<form:select
													path="compatibilityQuestion[${status.index}].selection"
													name="options" id="options${status.index+2}"
													class="form-control selectpicker show-tick">
													<form:option value=""> Select one of the following </form:option>
													<c:forTokens items="${compatibilityQuestion.options}"
														delims="|" var="optionSplit">
														<form:option value="${optionSplit}">
															<c:out value="${optionSplit}" />
														</form:option>
													</c:forTokens>
												</form:select>
												<div class="errorMsg" style="display: none padding-top:10%;">Oops,
													please select a valid response!</div>
											</div>

										</div>
									</c:forEach>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 previousButton">
									<button class="btn btn-primary1 octoTalk" type="button" id='previous'
										style="display: none" align="center">Previous</button>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 nextButton buttonFont">
									<button class="btn btn-primary1 col-sm-5 " type="button"
										id='next'>Next</button>
									<input class="btn btn-primary1 col-sm-7" type="submit"
										id='submit' style="display: none" />
								</div>
							</div>
						</div>
					</div>

				</div>
			</form:form>
		</div>
	</div>


	<c:import url="/resources/includeFiles/bottomMenu.jsp"></c:import>
	<script src="<c:url value="/resources/js/compatibility.js" />"></script>
</body>
</html>
