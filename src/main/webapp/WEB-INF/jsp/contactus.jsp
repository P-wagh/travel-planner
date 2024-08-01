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
              <!-- <svg class="mb-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256">
                <rect width="256" height="256" fill="none" />
                <polygon points="72 56 8 200 136 200 72 56" fill="none" stroke="currentColor" stroke-linecap="round"
                  stroke-linejoin="round" stroke-width="16" />
                <polyline points="136 200 248 200 184 56 72 56 72 200" fill="none" stroke="currentColor"
                  stroke-linecap="round" stroke-linejoin="round" stroke-width="16" />
              </svg> -->
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
                <a class="nav-link" href="#">Activity</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/about">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="/contact">Contact Us</a>
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
        <h1 class="text-center">Contact Us</h1>
        <p class="text-center">We'd love to hear from you! Please fill out the form below to get in touch with us.</p>
        
        <div class="card">
            <form action="https://api.web3forms.com/submit" method="post">

                <input type="hidden" name="access_key" value="59381d4b-2c8e-48c1-9a02-2f85bf85cbda">

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="subject" class="form-label">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-outline-dark">Submit</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>