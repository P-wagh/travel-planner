<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.travelplanner.entity.User, jakarta.servlet.http.HttpSession" %>
<%
	
	User user = (User) session.getAttribute("user");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">


<style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 1rem;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
        }
        .sidebar a:hover {
            color: #ffc107;
        }
        .content {
            padding: 2rem;
        }
        .user-info {
            background-color: #fff;
            padding: 1rem;
            border-radius: .25rem;
            box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075);
        }
        .card {
            margin-bottom: 1.5rem;
        }
    </style>


</head>
<body>


	<div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                Travel Plans
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                Suggestions
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                Settings
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
                    <a class="btn btn-outline-dark mb-2" href="/logout">Logout</a>
                </div>
                
                <div class="row">
                    <div class="col-md-4">
                        <div class="user-info">
                            <h4>User Information</h4>
                            <p><strong>Name:</strong> <%= user.getUser_name() %></p>
                            <p><strong>Email:</strong> <%= user.getUser_email() %></p>
                            <p><strong>City:</strong> <%= user.getUser_city() %></p>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Welcome to your Travel Planner!</h5>
                                <p class="card-text">Here you can manage your travel plans and get suggestions based on your preferences.</p>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Recent Travel Plans</h5>
                                <p class="card-text">You have no recent travel plans.</p>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Suggestions for You</h5>
                                <p class="card-text">Check out these amazing travel destinations and hotels that suit your interests.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>


	
	
	
	<script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>