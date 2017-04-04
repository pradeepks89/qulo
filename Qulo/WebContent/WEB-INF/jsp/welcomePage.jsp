<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<link href="<c:url value="/resources/includeFiles/includeAll.html" />" rel="import"> 
	<title>${title}</title>
</head>
<body>
	<div w3-include-html="<c:url value="/resources/includeFiles/topMenu.jsp" />"></div> 
	      
	
	<div w3-include-html="<c:url value="/resources/includeFiles/bottomMenu.jsp" />"></div> 
</body>
</html>
