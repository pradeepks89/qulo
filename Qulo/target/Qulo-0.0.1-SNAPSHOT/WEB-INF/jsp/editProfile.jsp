<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Contact</title>
</head>
<body>
    <div align="center">
        <h1>New/Edit Contact</h1>
        <form:form action="userProfileEdit" method="post" modelAttribute="user">
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Display Name:</td>
                <td><form:input path="displayName" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:input path="password" /></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><input /></td>
            </tr>
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
                <td>Gender:</td>
                <td><form:input path="gender" /></td>
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
                <td>Date Of Birth:</td>
                <td><form:input path="dob" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>