<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.travelplanner.entity.Admin, com.travelplanner.helper.Massege, jakarta.servlet.http.HttpSession, com.travelplanner.service.UserService" %>
<%
	
	UserService userService = new UserService();
	Admin admin = (Admin) session.getAttribute("admin");
    Massege msg = (Massege) session.getAttribute("msg");
    int userCount = (int) session.getAttribute("userCount");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        .card {
            margin-bottom: 1.5rem;
        }
        .active{
            color: #ffc107 !important;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block sidebar">
                <div class="sidebar-sticky">

                    <div class="text-white d-flex justify-content-center">
                        <strong class="fs-5 me-2">Let's Go</strong>
                         <svg style="fill: white;" version="1.1" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 16 16" enable-background="new 0 0 16 16">
                          <path d="M0,9l4,1.5L6,16l2.861-3.82L14,14l2-14L0,9z M7.169,11.44l-0.916,2.485l-1.086-3.118l8.402-7.631L7.169,11.44z"></path>
                         </svg>
                    </div>
                    <hr style="color: #fff;">

                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/postRedirect">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/adminShowUsers">
                                Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/adminTravelPlans">
                                Travel Plans
                            </a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="#">
                                Suggestions
                            </a>
                        </li> -->
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="#">
                                Settings
                            </a>
                        </li> -->
                        <!-- <li class="nav-item">
                            <a class="nav-link active" href="#">
                                Add New Trip
                            </a>
                        </li> -->
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h1 class="h2">Admin Dashboard</h1>
                    <a href="/logout" class="btn btn-outline-dark mx-3 ms-auto mb-2">Logout</a>

                    <div class="d-flex ">
                        <div class="flex-shrink-0 dropdown mb-2">
                            <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                              <img src="<%= request.getContextPath() %>/images/profiles/<%= admin.getAdminPhoto() %>" alt="mdo" width="35px" height="35px" class="rounded-circle profilepicture">
                            </a>
                            <ul class="dropdown-menu text-small shadow">
                              <li><a class="dropdown-item" href="#">New project...</a></li>
                              
                              <!-- Dropdown submenu -->
                              <div class="dropdown-submenu dropstart">
                                <a class="dropdown-item dropdown-toggle" href="#">Settings</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#changePassword">Change Password</a>
                                </div>
                            </div>
                              
                              
                              <!-- link trigger modal -->
                              <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#profile">Profile</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="/logout">Sign out</a></li>
                            </ul>
                          </div> 
                    </div>

                </div>


                <!-- Model Starting  -->             
                <!-- Modal profile-->
                <div class="modal fade" id="profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Exploration</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        <div class="profilePhoto d-flex justify-content-center">
                            <img src="<%= request.getContextPath() %>/images/profiles/<%= admin.getAdminPhoto() %>" alt="" width="125px" height="125px" class="rounded-circle profilepicture">
                        </div>
                        <div class="d-flex justify-content-center">
                            <strong class="fs-4"><%= admin.getAdminName() %></strong>
                        </div>
                        <hr>

                        <div id="showProfile">
                            <table class="table">
                                <tbody>
                                  <tr>
                                    <th scope="row">Phone no</th>
                                    <td>:</td>
                                    <td><%= admin.getAdminPhone() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Email </th>
                                    <td>:</td>
                                    <td><%= admin.getAdminEmail() %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Role </th>
                                    <td>:</td>
                                    <td><%= admin.getRole() %></td>
                                  </tr>
                                  
                                </tbody>
                              </table>
                        </div>

                        <div id="editProfile" style="display: none;">
                            <form action="/admin/updateprofile" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tbody>
                                        <tr>
											<td>Profile picture:</td>
											<td><input type="file" class="form-control" name="profileimage"></td>
										</tr>      
                                      <tr>
                                        <th scope="row">User Id: </th>
                                        <td><%= admin.getAdminId() %> <input type="hidden" name="adminId" value="<%= admin.getAdminId() %>" id=""></td>
                                      </tr>

                                      
                                      
                                      <tr>
                                        <th scope="row">Name: </th>
                                        <td><input type="text" class="form-control" name="adminName" id="" value="<%= admin.getAdminName() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Phone no:</th>
                                        <td><input type="text" class="form-control" name="adminPhone" id="" value="<%= admin.getAdminPhone() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Email: </th>
                                        <td><input type="text" name="adminEmail" class="form-control" id="" value="<%= admin.getAdminEmail() %>"></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">role: </th>
                                        <td><%= admin.getRole() %><input type="hidden" name="userRole" class="form-control" id="" value="<%= admin.getRole() %>"></td>
                                      </tr>
                                      
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

                <!-- Model profile end -->

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
                    
                    
                 <!-- Add Trip Form Start -->
                 <div class="container">
                    <div class="card mx-5 p-5">
                        <h2 class="card-title">Add New Trip</h2>
                        <form action="/admin/addTrip" method="post">
                            <div class="mb-3">
                                <label for="tripName" class="form-label">Trip Name</label>
                                <input type="text" class="form-control" id="tripName" name="tripName" required>
                            </div>
                            <div class="mb-3">
                                <label for="destination" class="form-label">Destination</label>
                                <input type="text" class="form-control" id="destination" name="destination" required>
                            </div>
                            <div class="mb-3">
                                <label for="sartingPlace" class="form-label">Sarting Place</label>
                                <input type="text" class="form-control" id="sartingPlace" name="sartingPlace" required>
                            </div>
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="budget" class="form-label">Budget</label>
                                <input type="number" class="form-control" id="budget" name="budget" required>
                            </div>
                            <button type="submit" class="btn btn-outline-dark">Add Trip</button>
                            <button type="reset" class="btn btn-outline-dark">Reset</button>
                        </form>
                    </div>
                </div>
            
                <!-- Add Trip Form end -->

                
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery (User to define = '$' if not add jQuery they it give error) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

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


        // Script for the drop down menu
        $('.dropdown-submenu a.dropdown-toggle').on("click", function(e) {
            var $subMenu = $(this).next(".dropdown-menu");
            if (!$subMenu.hasClass('show')) {
                $subMenu.parents('.dropdown-menu').first().find('.show').removeClass("show");
            }
            $subMenu.toggleClass('show');
            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
                $('.dropdown-submenu .show').removeClass("show");
            });
            return false;
        });
	</script>
</body>
</html>
