<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="false"%>
<html>
<head>
	<link href="${pageContext.request.contextPath}/includeAll.html" rel="import"> 
	<title>${title}</title>
</head>
<body>
    <img id="random1" src="<c:url value="/images/MaleQulo.gif" />" alt="Image for guy/girl" align="left">
 	 
 	<jsp:include page="_menu.jsp" />
    <h1>Message : ${message}</h1>
</body>
</html>