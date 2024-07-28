
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import= "com.travelplanner.helper.Massege, jakarta.servlet.http.HttpSession" %>
<%@ page import= "com.travelplanner.entity.Admin" %>
<%
	
	Admin admin = (Admin) session.getAttribute("admin");
    Massege msg = (Massege) session.getAttribute("msg");
    session.setAttribute("admin", admin);
    session.setAttribute("msg", msg);

%>

<!-- postRedirect.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
    <script>
        function submitForm() {
            document.getElementById('redirectForm').submit();
        }
    </script>
</head>
<body onload="submitForm()">
    <form id="redirectForm" action="/admin/adminDashboard" method="post">
        <div class="form-group">
            <label for="username">Email</label>
            <input type="hidden" name="username" value="<%= admin.getAdminEmail() %>" id="">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="hidden" name="password" value="<%= admin.getAdminPassword() %>" id="">
        </div>

    </form>
</body>
</html>
