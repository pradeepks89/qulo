
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>User Info</title>
</head>
<body>

	<form:form modelAttribute="compQueList" action="userCompatibilitySave"
		method="post">
		<table border="1">
			<th>ID</th>
			<th>Question</th>


			<c:forEach var="compatibilityQuestion"
				items="${compQueList.compatibilityQuestion}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td><input
						name="compatibilityQuestion[${status.index}].questionID"
						value="${compatibilityQuestion.questionID}" />
						</div></td>
					<td><input
						name="compatibilityQuestion[${status.index}].question"
						value="${compatibilityQuestion.question}" />
						</div></td>
					</td>
					<td><form:select
							path="compatibilityQuestion[${status.index}].selection"
							name="options" id="options" class="form-control">
							<c:forTokens items="${compatibilityQuestion.options}" delims="|"
								var="optionSplit">
								<form:option value="${optionSplit}">
									<c:out value="${optionSplit}" />
								</form:option>
							</c:forTokens>
						</form:select></td>

				</tr>
			</c:forEach>
		</table>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" name="register-submit" id="register-submit"
						tabindex="11" class="form-control btn btn-register"
						value="Register Now">
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>

