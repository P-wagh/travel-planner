<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">
</head>
<body>
	<div>
        <%@ include file="/WEB-INF/jsp/include/navbarc.jsp" %> 
    </div>

    <!-- Hero section -->
    <div class="px-4 py-5 my-5 text-center">
        <img class="d-block mx-auto mb-4" src="<%= request.getContextPath() %>/images/tent.svg " alt="" width="72" height="57">
        <h1 class="display-5 fw-bold text-body-emphasis"><div class="fw-bold">JOIN US WE EXPLORE</div> <div class="fw-bold">THE DESTINATION</div></h1>
        <div class="col-lg-6 mx-auto">
          <p class="lead mb-4 fw-bold">You can trust us with your vacation</p>
          <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <button type="button" class="btn btn-dark btn-lg px-4 gap-3"><a href="/userRegistration" class="text-white">Register here</a></button>
          </div>
        </div>
      </div>
    <!-- Hero section -->

    

	<%@ include file="/WEB-INF/jsp/include/footerc.jsp" %>  
</body>
</html>