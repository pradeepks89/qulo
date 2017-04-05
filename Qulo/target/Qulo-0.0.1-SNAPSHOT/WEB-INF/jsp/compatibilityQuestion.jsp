<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
 
<html>
<head>
<title>User Info</title>
</head>
<body>
    <table border="1">
                <th>ID</th>
                <th>Question</th>
                
                 
                <c:forEach var="compQueList" items="${listQuestion}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${compQueList.questionID}</td>
                    <td>${compQueList.question}</td>
                    <td>
                       
                    </td>
                             
                </tr>
                </c:forEach>             
            </table>
</body>
</html>