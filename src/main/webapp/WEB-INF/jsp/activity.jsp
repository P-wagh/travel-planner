<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Activities - Travel Planner</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">

        <style>
            body {
                background-color: #f8f9fa;
                background-image: none;
            }
            .container {
                margin-top: 50px;
            }
            .card {
                margin-bottom: 20px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .card-img-top {
                border-radius: 10px;
            }
        </style>
    </head>
    <body>

        <!-- navbar start -->
    <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">  
        <div class="container-fluid">
          <a class="navbar-brand" href="#">
            <div style="width: 30px; height: 30px;">
              <Strong class="">Let's Go</Strong>
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
                <a class="nav-link active" href="/activity">Activity</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/about">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/contact">Contact Us</a>
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

        <div class="container">
            <h1 class="text-center">Explore Activities</h1>
            <p class="text-center">Discover exciting activities at various destinations!</p>
    
            <div class="row">
                <!--  Example activity card  -->
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/images/activityImages/BeachVolleyball.jpg" class="card-img-top" alt="Activity Image">
                        <div class="card-body">
                            <h5 class="card-title">Beach Volleyball</h5>
                            <p class="card-text">Enjoy a fun game of beach volleyball with friends and family at our beautiful beach destination.</p>
                            <a href="#" class="btn btn-outline-dark">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/images/activityImages/MountainHiking.jpg" class="card-img-top" alt="Activity Image">
                        <div class="card-body">
                            <h5 class="card-title">Mountain Hiking</h5>
                            <p class="card-text">Explore the scenic mountain trails with our guided hiking tours. Perfect for adventure enthusiasts!</p>
                            <a href="#" class="btn btn-outline-dark">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/images/activityImages/CityTours.jpg" class="card-img-top" alt="Activity Image">
                        <div class="card-body">
                            <h5 class="card-title">City Tours</h5>
                            <p class="card-text">Experience the culture and history of our city destinations with our expert-guided city tours.</p>
                            <a href="#" class="btn btn-outline-dark">Learn More</a>
                        </div>
                    </div>
                </div>
                <!-- Add more activity cards as needed  -->
            </div>
        </div>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    
</html>