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
  <title>User Registration Form</title>
  <!-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css "> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    .registrationForm {
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      border-radius: 20px;
    }

    .nav-link::after{
    content: "";
    width: 0;
    height: 2px;
    background-color: rgb(73, 244, 164);
    margin: auto;
    display: block;
}

.nav-link:hover::after{
    width: 100%;
    transition: width 0.2s linear;
}
  </style>
</head>

<body style="background-color: aliceblue;">
  <!-- Navbar starting -->
  <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <div style="width: 30px; height: 30px;">
          <Strong class="">Let's Go</Strong>
          <svg style="fill: white;" version="1.1" xmlns="http://www.w3.org/2000/svg" width="32" height="32"
            viewBox="0 0 16 16" enable-background="new 0 0 16 16">
            <path
              d="M0,9l4,1.5L6,16l2.861-3.82L14,14l2-14L0,9z M7.169,11.44l-0.916,2.485l-1.086-3.118l8.402-7.631L7.169,11.44z" />
          </svg>

        </div>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav m-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Pricing</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Activity</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About Us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact Us</a>
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

  <!-- Navbar end -->
  <div class="container my-4">
    <div class="row justify-content-center">
      <div class="col-md-8 p-5 registrationForm">
        <div class="form-container">

          <div class="d-flex justify-content-center">
            <svg width="100px" height="100px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 110.74 122.88"
              style="enable-background:new 0 0 110.74 122.88" xml:space="preserve">
              <g>
                <path
                  d="M48.47,116.35c1.8,0,3.27,1.46,3.27,3.26c0,1.8-1.46,3.26-3.27,3.26H7.6c-2.09,0-3.99-0.85-5.37-2.23 C0.85,119.27,0,117.38,0,115.28V7.6C0,5.5,0.85,3.61,2.23,2.23C3.61,0.85,5.5,0,7.6,0h93.3c2.09,0,3.99,0.86,5.37,2.23 c1.38,1.38,2.23,3.27,2.23,5.37v53.95c0,1.8-1.46,3.26-3.26,3.26c-1.8,0-3.26-1.46-3.26-3.26V7.6c0-0.29-0.12-0.56-0.32-0.75 c-0.2-0.2-0.47-0.32-0.75-0.32H7.6c-0.29,0-0.56,0.12-0.76,0.31C6.65,7.05,6.53,7.31,6.53,7.6v107.68c0,0.29,0.12,0.56,0.32,0.75 c0.2,0.2,0.47,0.32,0.76,0.32L48.47,116.35L48.47,116.35L48.47,116.35z M33.94,57.92c-0.62-1.07-0.17-4.13,1.16-5.21 c3.8-2.22,9.04-1.53,12.7-4.09c0.21-0.32,0.44-0.78,0.67-1.29c0.33-0.76,0.64-1.59,0.83-2.16c-0.81-0.96-1.51-2.04-2.17-3.1 l-2.2-3.5c-0.8-1.2-1.22-2.3-1.25-3.2c-0.01-0.42,0.06-0.81,0.22-1.15c0.16-0.36,0.41-0.65,0.76-0.88c0.16-0.11,0.34-0.2,0.53-0.27 c-0.15-1.9-0.2-4.29-0.1-6.3c0.05-0.47,0.14-0.95,0.27-1.43c0.56-2.01,1.97-3.63,3.72-4.74c0.96-0.61,2.02-1.08,3.12-1.39 c0.7-0.2-0.6-2.43,0.13-2.51c3.5-0.36,9.15,2.83,11.59,5.47c1.22,1.32,1.99,3.08,2.16,5.4l-0.14,5.71l0,0 c0.61,0.19,1,0.57,1.16,1.2c0.18,0.7-0.01,1.67-0.61,3.01l0,0c-0.01,0.02-0.02,0.05-0.04,0.07l-2.51,4.13 c-0.92,1.52-1.86,3.04-3.08,4.24c0.11,0.16,0.23,0.32,0.34,0.48c0.5,0.73,1,1.46,1.64,2.11c0.02,0.02,0.04,0.05,0.05,0.07 c2.89,2.04,9.92,2.54,12.62,4.04l0.11,0.06c1.39,1.07,1.82,4.13,1.18,5.2H33.94L33.94,57.92z M102.29,79.04 c-0.53-0.51-1.14-0.75-1.84-0.74c-0.71,0.01-1.31,0.29-1.8,0.81l-4.05,4.22l11.37,10.98l4.09-4.26c0.49-0.5,0.69-1.14,0.68-1.84 c-0.01-0.69-0.26-1.33-0.76-1.8L102.29,79.04L102.29,79.04L102.29,79.04z M84.54,116.17c-1.5,0.48-3,0.97-4.49,1.46 c-1.5,0.5-3,1-4.49,1.5c-3.53,1.16-5.51,1.8-5.93,1.92c-0.4,0.12-0.17-1.53,0.73-4.99l2.81-10.83l0,0l17.82-18.18l11.36,10.93 L84.54,116.17L84.54,116.17L84.54,116.17z M31.74,95.36c-1.8,0-3.27-1.48-3.27-3.31s1.46-3.31,3.27-3.31h22.21 c1.8,0,3.27,1.48,3.27,3.31s-1.46,3.31-3.27,3.31H31.74L31.74,95.36L31.74,95.36z M31.74,74.67c-1.8,0-3.26-1.46-3.26-3.27 c0-1.8,1.46-3.26,3.26-3.26h44.05c1.8,0,3.26,1.46,3.26,3.26c0,1.8-1.46,3.27-3.26,3.27H31.74L31.74,74.67L31.74,74.67z" />
              </g>
            </svg>
          </div>

          <% if(msg !=null){ %>
            <div class="alert alert-<%= msg.getType() %>" role="alert">
              <%= msg.getDiscription() %>
            </div>
            <% session.removeAttribute("msg"); } %>


              <h2 class="text-center my-4">User Registration</h2>
              <!-- <p class="text-center">Home for the traveller</p> -->
              <form action="/do_register" method="post">
                <div class="form-group my-2">
                  <label for="user_name">User Name</label>
                  <input type="text" class="form-control" id="user_name" name="user_name" required>
                </div>
                <div class="form-group my-3">
                  <label for="user_address">User Address</label>
                  <input type="text" class="form-control" id="user_address" name="user_address" required>
                </div>
                <div class="form-group my-3">
                  <label for="user_city">User City</label>
                  <input type="text" class="form-control" id="user_city" name="user_city" required>
                </div>
                <div class="form-group my-3">
                  <label for="user_city_pincode">City Pincode</label>
                  <input type="text" class="form-control" id="user_city_pincode" name="user_city_pincode" required>
                </div>
                <div class="form-group my-3">
                  <label for="user_phone">Phone Number</label>
                  <input type="text" class="form-control" id="user_phone" name="user_phone" required>
                </div>
                <div class="form-group my-3">
                  <label for="user_email">Email</label>
                  <input type="email" class="form-control" id="user_email" name="user_email" required>
                </div>
                <!-- <div class="form-group my-3">
                                        <label for="user_photo">User Photo</label>
                                        <input type="file" class="form-control" id="user_photo" name="user_photo">
                                    </div> -->
                <div class="form-group my-3">
                  <label for="user_password">Password</label>
                  <input type="password" class="form-control" id="user_password" name="user_password" required>
                </div>
                <div class="form-group my-3">
                  <label for="confirm_password">Confirm Password</label>
                  <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                </div>
                <button type="submit" class="btn btn-outline-dark btn-block">Sign Up</button>
                <Button type="reset" class="btn btn-outline-dark ms-1">Reset</Button>
              </form>
        </div>
      </div>
    </div>
  </div>







  <!-- Footer start -->
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Activity</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About Us</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Contact Us</a></li>
    </ul>
    <p class="text-center text-body-secondary">© 2024 Travel-Planner</p>
  </footer>
  <!-- Footer end -->


  <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>