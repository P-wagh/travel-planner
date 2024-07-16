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
            .logincontainer {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 20px;
            }

            .mt-5 {
                margin-top: 10% !important;
            }

            .transparent-input {
                background-color: rgba(255, 255, 255, 0); /* Adjust the alpha value for transparency */
                border: 1px solid #000000;
                border-radius: 5px;
                padding: 10px;
                color: #333;
            }

            .transparent-input::placeholder {
                color: #3d3b3b; /* Placeholder color */
            }
            .mt-4{
                margin-top: 70px !important;
            }
        </style>
    </head>

    <body>

        <!-- nav bar start  -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <div style="width: 30px; height: 30px;">
                        <svg style="color: black;" class="mb-1" xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 256 256">
                            <rect width="256" height="256" fill="none" />
                            <polygon points="72 56 8 200 136 200 72 56" fill="none" stroke="currentColor"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="16" />
                            <polyline points="136 200 248 200 184 56 72 56 72 200" fill="none" stroke="currentColor"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="16" />
                        </svg>
                        <Strong style="color: black;">EXPLORATION</Strong>
                    </div>
                </a>

            </div>
        </nav>
        <!-- nav bar end -->
        <div class="container d-flex justify-content-end">
                <div class="justify-content-center rounded-4 p-5 mt-4 logincontainer">
                    <div class="">
                        <div class="form-container my-3">
                            <div class="d-flex justify-content-center mb-2">
                                <svg width="70px" height="70px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                            </div>
                            <h2 class="text-center">User Login</h2>
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
                            
                            <form action="/login" method="post">
			                    <div class="form-group">
			                        <label for="username">Email</label>
			                        <input type="email" class="form-control transparent-input" id="username" name="username" placeholder="Enter your email" required>
			                    </div>
			                    <div class="form-group">
			                        <label for="password">Password</label>
			                        <input type="password" class="form-control transparent-input" id="password" name="password" placeholder="Enter your password" required>
			                    </div>
			                    <button type="submit" class="btn btn-outline-dark btn-block">Login</button>

                                <div class="d-flex justify-content-center mt-3">
                                    <a class="" href="/home"><u>Go to Home</u> </a>
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