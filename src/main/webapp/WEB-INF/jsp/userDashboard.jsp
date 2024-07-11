<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/view/include/navbarc.jsp" %>
<%@page isELIgnored="false" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <h1>User Name: <%= user.user_name %> </h1>
    <strong>Current Time is</strong>: <%=new Date() %>

<%@ include file="/WEB-INF/view/include/footerc.jsp" %>
</body>
</html>