<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import= "com.travelplanner.helper.Massege, jakarta.servlet.http.HttpSession" %>
<%
	Massege msg = (Massege) session.getAttribute("msg");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">
    <style>
        .mt-5 {
            margin-top: 10% !important;
        }

        .mt-4 {
            margin-top: 50px !important;
        }
    </style>
</head>

<body>

    <!-- Navbar starting -->
    <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <div style="width: 30px; height: 30px;">
                    <Strong class="text-white">Let's Go</Strong>
                    <svg style="fill: white;" version="1.1" xmlns="http://www.w3.org/2000/svg" width="32" height="32"
                        viewBox="0 0 16 16" enable-background="new 0 0 16 16">
                        <path
                            d="M0,9l4,1.5L6,16l2.861-3.82L14,14l2-14L0,9z M7.169,11.44l-0.916,2.485l-1.086-3.118l8.402-7.631L7.169,11.44z" />
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
                        <a class="nav-link text-white" aria-current="page" href="/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Activity</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Contact Us</a>
                    </li>

                </ul>

                <form action="/login" class="d-flex">
                    <button class="btn btn-outline-light mx-2" type="submit">Sign In</button>
                </form>
                <form action="/userRegistration" class="d-flex">
                    <button class="btn btn-outline-light mx-2" type="submit">Sign Up</button>
                </form>

            </div>
        </div>
    </nav>
    <!-- nav bar end -->
    <div class="container d-flex justify-content-end">
        <div class="justify-content-center rounded-4 p-5 mt-4 logincontainer">
            <div class="">
                <div class="form-container mt-3">
                    <div class="d-flex justify-content-center mb-2">
                        <svg width="70px" height="70px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                            <path
                                d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z" />
                        </svg>
                    </div>
                    <h2 class="text-center">Sign In</h2>
                    <% if(msg !=null){ %>
                        <div class="alert alert-<%= msg.getType() %>" role="alert">
                            <%= msg.getDiscription() %>
                        </div>
                        <% session.removeAttribute("msg"); } %>

                            <form action="/login" method="post">
                                <div class="form-group">
                                    <label for="username">Email</label>
                                    <input type="email" class="form-control transparent-input" id="username"
                                        name="username" placeholder="Enter your email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control transparent-input" id="password"
                                        name="password" placeholder="Enter your password" required>
                                </div>
                                <button type="submit" class="btn btn-dark btn-block">Sign In</button>

                                <div class="d-flex justify-content-center mt-3">
                                    <a class="" href="/home"><u>Home</u> </a>
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <a class="" href="/userRegistration"><u>Do not have an account</u> </a>
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <a class="text-danger" href="/forgot-password"><u>forget password?</u> </a>
                                </div>
                            </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>