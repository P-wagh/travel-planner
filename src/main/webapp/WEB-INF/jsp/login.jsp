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

            /* body {
            background-color: aliceblue;
        } */
            /* .form-container {
            margin-top: 100px;
            padding: 30px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #8BC34A;
            border-color: #8BC34A;
        }
        .btn-primary:hover {
            background-color: #7CB342;
            border-color: #7CB342;
        } */
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
                <div class="justify-content-center rounded-4 p-5 mt-5 logincontainer">
                    <div class="">
                        <div class="form-container my-3">
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
                            
                            <form action="">
                                <div class="form-group">
                                    <label for="user_email">Email</label>
                                    <input type="email" class="form-control" id="user_email" name="user_email" required placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label for="user_password">Password</label>
                                    <input type="password" class="form-control" id="user_password" name="user_password" required placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-outline-dark btn-block">Login</button>
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