<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.travelplanner.entity.Admin, com.travelplanner.helper.Massege, jakarta.servlet.http.HttpSession, com.travelplanner.service.UserService" %>
<%
	
	UserService userService = new UserService();
	Admin admin = (Admin) session.getAttribute("admin");
    Massege msg = (Massege) session.getAttribute("msg");
    int userCount = (int) session.getAttribute("userCount");
    int countOfImages = (int) session.getAttribute("countOfImages");

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
                            <a class="nav-link active" href="#">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                Users
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
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                Add New Trip
                            </a>
                        </li>
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
                              <img style="object-fit: cover;" src="<%= request.getContextPath() %>/images/profiles/<%= admin.getAdminPhoto() %>" alt="mdo" width="35px" height="35px" class="rounded-circle profilepicture">
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

                
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Total Users &nbsp; <i class="fa-solid fa-user"></i></h5>
                                <div class="d-flex justify-content-between">
                                    <p class="card-text">Number of registered users: <%= userCount %></p>
                                    <a href="/admin/postRedirect" class="btn btn-outline-dark">Refresh</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Total Travel Plans</h5>
                                <div class="d-flex justify-content-between">
                                    <p class="card-text">Number of travel plans created: 75</p>
                                    <a href="/admin/addTripForm" class="btn btn-outline-dark">Add New Trip Plan</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- model for addImage -->                    
                    <!-- Modal -->
                    <div class="modal fade" id="addImages" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Travel Planner</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div class="container">
                                    <h2>Add Image</h2>
                                    <form action="/admin/addImage" method="post" enctype="multipart/form-data">
                                        <div class="form-group mb-2">
                                            <label for="imageName" class="mb-2">Image Name</label>
                                            <input type="text" class="form-control" id="imageName" name="imageName" placeholder="Enter image name" required>
                                        </div>
                                        <div class="form-group mb-2">
                                            <label for="imageType" class="mb-2">Image Type</label>
                                            <input type="text" class="form-control" id="imageType" name="type" placeholder="Enter image Type" required>
                                        </div>
                                        <div class="form-group mb-2">
                                            <label for="imageDescription" class="mb-2">Image Description</label>
                                            <textarea class="form-control" id="imageDescription" name="discription" rows="3" placeholder="Enter image description" required></textarea>
                                        </div>
                                        <div class="form-group mb-2">
                                            <label for="imageFile" class="mb-2">Upload Image</label>
                                            <input type="file" class="form-control-file" id="imageFile" name="imageFile" required>
                                        </div>
                                        <button type="submit" class="btn btn-outline-dark mb-2 mx-2">Submit</button>
                                        <button type="reset" class="btn btn-outline-dark mb-2 mx-2">Reset</button>

                                    </form>
                                </div>
                            
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                        </div>
                    </div> 
                    <!-- model end -->

                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Total images</h5>
                                <div class="d-flex justify-content-between">
                                    <p class="card-text">Number of travel images: <%= countOfImages %></p>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#addImages">
                                        Add New Trip Image
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Recent Activity</h5>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">User</th>
                                            <th scope="col">Activity</th>
                                            <th scope="col">Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>John Doe</td>
                                            <td>Created a new travel plan</td>
                                            <td>2024-07-15</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Jane Smith</td>
                                            <td>Updated profile</td>
                                            <td>2024-07-14</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Sam Wilson</td>
                                            <td>Deleted a travel plan</td>
                                            <td>2024-07-13</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div> -->

                <!-- <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Settings</h5>
                                <p class="card-text">Manage system settings and configurations.</p>
                                <a href="#" class="btn btn-primary">Go to Settings</a>
                            </div>
                        </div>
                    </div>
                </div> -->

                
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
