<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import= "com.travelplanner.helper.Massege, jakarta.servlet.http.HttpSession" %>
<%
    Massege msg = (Massege) session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter OTP</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">
<style>
    .mt-5 {
        margin-top: 10% !important;
    }
    
    body {
        height: 100vh;
        position: relative;
        background: url('<%= request.getContextPath() %>/images/Baground1.jpg') no-repeat center center;
        background-size: cover;
    }
    body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Change the opacity here */
        z-index: -1;
    }
    .content {
        position: relative;
        z-index: 2;
        color: white;
        text-align: center;
    }
</style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <div style="width: 30px; height: 30px;">
                    <strong class="">Let's Go</strong>
                    <svg style="fill: white;" version="1.1" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 16 16" enable-background="new 0 0 16 16">
                        <path d="M0,9l4,1.5L6,16l2.861-3.82L14,14l2-14L0,9z M7.169,11.44l-0.916,2.485l-1.086-3.118l8.402-7.631L7.169,11.44z"/>
                    </svg>
                </div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav m-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/home">Home</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/gallary">Gallary</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/activity">Activity</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/about">About Us</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/contact">Contact Us</a>
                      </li>
                </ul>
                <form action="/login" class="d-flex">
                    <button class="btn btn-outline-light mx-2" type="submit">Login</button>
                </form>
                <form action="/userRegistration" class="d-flex">
                    <button class="btn btn-outline-light mx-2" type="submit">Register</button>
                </form>
            </div>
        </div>
    </nav>
    <!-- Navbar end -->

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-dark text-white">Enter OTP</div>
                    <div class="card-body">

                            <%
                            	if(msg != null){
                            %>
                            <div class="alert alert-<%= msg.getType() %>" role="alert">
			                    <%= msg.getDiscription() %>
			                </div>
                            <%
                            		session.removeAttribute("msg");
                            	}
                            %>

                        <form action="/varify-otp" method="post">
                            <div class="form-group">
                                <label for="otp">OTP</label>
                                <input type="text" class="form-control" id="otp" name="otp" required>
                            </div>
                            <button type="submit" class="btn btn-outline-success my-3">Varity OTP</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
