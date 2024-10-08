<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="ISO-8859-1">
    <title>Travel planner</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  </head>

  <body>
    <div>
      <!-- Navbar file -->
      <!-- <nav class="navbar navbar-expand-lg"> -->
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
                <a class="nav-link active" aria-current="page" href="/home">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/gallary">Gallary</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/activity">Activity</a>
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
    </div>

    <!-- Hero section -->
    <div class="px-4 py-5 my-5 d-flex justify-content-end">
      <div class="mx-3">
        <!-- <img class="d-block mx-auto mb-4" src="<%= request.getContextPath() %>/images/tent.svg " alt="" width="72" height="57"> -->
        <div class="d-flex justify-content-sm-center">
          <div style="width: 80px; height: 80px;">
            <!-- <svg class="mb-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256">
              <rect width="256" height="256" fill="none" />
              <polygon points="72 56 8 200 136 200 72 56" fill="none" stroke="currentColor" stroke-linecap="round"
                stroke-linejoin="round" stroke-width="16" />
              <polyline points="136 200 248 200 184 56 72 56 72 200" fill="none" stroke="currentColor"
                stroke-linecap="round" stroke-linejoin="round" stroke-width="16" />
            </svg> -->
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 16 16" enable-background="new 0 0 16 16">
              <path d="M0,9l4,1.5L6,16l2.861-3.82L14,14l2-14L0,9z M7.169,11.44l-0.916,2.485l-1.086-3.118l8.402-7.631L7.169,11.44z"/>
             </svg>
          </div>
        </div>
        <h1 class="display-5 fw-bold text-body-emphasis">
          <div class="fw-bold ">JOIN US WE EXPLORE</div>
          <div class="fw-bold d-flex justify-content-sm-center">THE DESTINATION</div>
        </h1>
        <div class="d-flex justify-content-sm-center flex-column ">
          <p class="lead fw-bold mx-auto">You can trust us with your vacation</p>
          <div class="d-sm-flex justify-content-sm-center">
            <form action="/userRegistration" class="d-flex">
              <button class="btn btn-dark mx-2" type="submit">Explore Now</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- Hero section end -->


  
    <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>