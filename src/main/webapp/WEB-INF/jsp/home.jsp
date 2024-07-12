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
        <!-- Navbar file -->
        <%@ include file="/WEB-INF/jsp/include/navbarc.jsp" %> 
    </div>

    <!-- Hero section -->
    <div class="px-4 py-5 my-5 d-flex justify-content-end">
        <div class="mx-3">
          <!-- <img class="d-block mx-auto mb-4" src="<%= request.getContextPath() %>/images/tent.svg " alt="" width="72" height="57"> -->
        <div class="d-flex justify-content-sm-center">
          <div style="width: 80px; height: 80px;">
            <svg class="mb-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><rect width="256" height="256" fill="none"/><polygon points="72 56 8 200 136 200 72 56" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><polyline points="136 200 248 200 184 56 72 56 72 200" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/></svg>
          </div>
        </div>
        <h1 class="display-5 fw-bold text-body-emphasis"><div class="fw-bold ">JOIN US WE EXPLORE</div> <div class="fw-bold d-flex justify-content-sm-center">THE DESTINATION</div></h1>
        <div class="d-flex justify-content-sm-center flex-column ">
          <p class="lead fw-bold mx-auto">You can trust us with your vacation</p>
          <div class="d-sm-flex justify-content-sm-center">
            <button type="button" class="btn btn-dark btn-lg px-4 gap-3"><a href="/userRegistration" class="text-white">Register here</a></button>
          </div>
        </div>
        </div>
      </div>
    <!-- Hero section end -->

    
      <!-- incerting footer file -->
	<!-- <%@ include file="/WEB-INF/jsp/include/footerc.jsp" %>   -->
</body>
</html>