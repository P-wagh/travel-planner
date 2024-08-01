<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us - Travel Planner</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
    .team-member img {
        border-radius: 50%;
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
                <a class="nav-link" href="/activity">Activity</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="/about">About Us</a>
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
        <h1 class="text-center">About Us</h1>
        <p class="text-center">Welcome to the Travel Planner! Our mission is to help you plan your travels efficiently and enjoyably.</p>

        <div class="card">
            <h3>Our Mission</h3>
            <p>Our mission is to provide a seamless and user-friendly platform for planning your travels. Whether you're looking for a relaxing beach vacation, a thrilling jungle adventure, or a cultural city tour, we have got you covered. We aim to make travel planning easy and enjoyable so that you can focus on making memories.</p>
        </div>

        <div class="card">
            <h3>Our Vision</h3>
            <p>We envision a world where travel is accessible to everyone, and planning a trip is as enjoyable as the trip itself. We strive to be the go-to platform for all your travel planning needs, offering personalized suggestions, detailed itineraries, and an extensive database of destinations and activities.</p>
        </div>

        <!-- <div class="card">
            <h3>Our Team</h3>
            <div class="row">
                <div class="col-md-4 text-center team-member">
                    <img src="path/to/image1.jpg" alt="Team Member 1" class="img-fluid" width="150" height="150">
                    <h4>John Doe</h4>
                    <p>Founder & CEO</p>
                </div>
                <div class="col-md-4 text-center team-member">
                    <img src="path/to/image2.jpg" alt="Team Member 2" class="img-fluid" width="150" height="150">
                    <h4>Jane Smith</h4>
                    <p>Chief Technical Officer</p>
                </div>
                <div class="col-md-4 text-center team-member">
                    <img src="path/to/image3.jpg" alt="Team Member 3" class="img-fluid" width="150" height="150">
                    <h4>Mary Johnson</h4>
                    <p>Head of Marketing</p>
                </div>
            </div>
        </div> -->

        <div class="card">
            <h3>Contact Us</h3>
            <p>If you have any questions or suggestions, feel free to <a href="/contact">contact us</a>. We would love to hear from you!</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>