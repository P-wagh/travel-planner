<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.travelplanner.entity.User, com.travelplanner.helper.Massege, jakarta.servlet.http.HttpSession" %>
<%
	
	User user = (User) session.getAttribute("user");
    Massege msg = (Massege) session.getAttribute("msg");

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
        .profilepicture{
            object-fit: cover;
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
                <div class="d-flex flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
                    <a href="/logout" class="btn btn-outline-dark mx-3 ms-auto mb-2">Logout</a>

                    <div class="d-flex ">
                        <div class="flex-shrink-0 dropdown mb-2">
                            <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                              <img src="<%= request.getContextPath() %>/images/profiles/<%= user.getUser_photo() %>" alt="mdo" width="35px" height="35px" class="rounded-circle profilepicture">
                            </a>
                            <ul class="dropdown-menu text-small shadow">
                              <li><a class="dropdown-item" href="#">New project...</a></li>
                              <li><a class="dropdown-item" href="#">Settings</a></li>
                              <!-- link trigger modal -->
                              <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#profile">Profile</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="/logout">Sign out</a></li>
                            </ul>
                          </div> 
                    </div>
                </div>

                <!-- Model Starting  -->             
                <!-- Modal -->
                <div class="modal fade" id="profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Exploration</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        <div class="profilePhoto d-flex justify-content-center">
                            <img src="<%= request.getContextPath() %>/images/profiles/<%= user.getUser_photo() %>" alt="" width="125px" height="125px" class="rounded-circle profilepicture">
                        </div>
                        <div class="d-flex justify-content-center">
                            <strong class="fs-4"><%= user.getUser_name() %></strong>
                        </div>
                        <hr>

                        <div id="showProfile">
                            <table class="table">
                                <tbody>
                                  <tr>
                                    <th scope="row">User Id </th>
                                    <td>:</td>
                                    <td><%= user.getUser_id() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Address </th>
                                    <td>:</td>
                                    <td><%= user.getUser_address() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">City </th>
                                    <td>:</td>
                                    <td><%= user.getUser_city() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">City Pincode </th>
                                    <td>:</td>
                                    <td><%= user.getUser_city_pincode() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Phone no</th>
                                    <td>:</td>
                                    <td><%= user.getUser_phone() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Email </th>
                                    <td>:</td>
                                    <td><%= user.getUser_email() %></td>
                                  </tr>
                                  
                                </tbody>
                              </table>
                        </div>

                        <div id="editProfile" style="display: none;">
                            <form action="/user/updateprofile" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tbody>
                                        <tr>
											<td>Profile picture:</td>
											<td><input type="file" class="form-control" name="profileimage"></td>
										</tr>      
                                      <tr>
                                        <th scope="row">User Id: </th>
                                        <td><%= user.getUser_id() %> <input type="hidden" name="user_id" value="<%= user.getUser_id() %>" id=""></td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Name: </th>
                                        <td><input type="text" class="form-control" name="user_name" id="" value="<%= user.getUser_name() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Address: </th>
                                        <td><input type="text" class="form-control" name="user_address" value="<%= user.getUser_address() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">City: </th>
                                        <td><input type="text" class="form-control" name="user_city" value=" <%= user.getUser_city() %> " > </td>
                                      </tr>
                                      <tr>
                                        <th scope="row">City Pincode: </th>
                                        <td><input type="text" class="form-control" name="user_city_pincode" id="" value="<%= user.getUser_city_pincode() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Phone no:</th>
                                        <td><input type="text" class="form-control" name="user_phone" id="" value="<%= user.getUser_phone() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Email: </th>
                                        <td><input type="text" name="user_email" class="form-control" id="" value="<%= user.getUser_email() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">role: </th>
                                        <td><%= user.getUserRole() %><input type="hidden" name="userRole" class="form-control" id="" value="<%= user.getUserRole() %>"></td>
                                      </tr>
                                      <!-- <tr>
                                        <th scope="row">Password: </th>
                                        <td><input type="text" name="user_password" class="form-control" id="" value="<%= user.getUser_password() %>"></td>
                                      </tr> -->
                                      
                                    </tbody>
                                  </table>
                                  <button type="submit" class="btn btn-outline-dark">Save Changes</button>
                            </form>
                        </div>

                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-outline-dark" id="edit-profile">Update Profile</button>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- Model end -->
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

    <!-- jQuery (User to define = '$' if not add jQuery they it give error) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

    <!-- Script for edit profile -->
    <script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$("#edit-profile").click(function() {

				if (editStatus == false) {
					$("#showProfile").hide();
					$("#editProfile").show();

					editStatus = true;

					$(this).text("Back");
				} else {
					$("#showProfile").show();
					$("#editProfile").hide();

					editStatus = false;

					$(this).text("Edit");
				}
			})
		});
	</script>
    
</body>
</html>