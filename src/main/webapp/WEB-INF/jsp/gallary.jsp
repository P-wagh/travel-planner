<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gallary Travel Planner</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/gallaryCss.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

    <header>
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
                <a class="nav-link active" href="#">Gallary</a>
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
    </header>


    
    <div class="slider">


        <div class="list">

            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img1.jpg" alt="">

                <div class="content">
                    <div class="title">MAGIC SLIDER</div>
                    <div class="type">FLOWER</div>
                    <div class="description">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
                    </div>
                    <div class="button">
                        <button>SEE MORE</button>
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img2.jpg" alt="">

                <div class="content">
                    <div class="title">MAGIC SLIDER</div>
                    <div class="type">NATURE</div>
                    <div class="description">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
                    </div>
                    <div class="button">
                        <button>SEE MORE</button>
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img3.jpg" alt="">

                <div class="content">
                    <div class="title">MAGIC SLIDER</div>
                    <div class="type">PLANT</div>
                    <div class="description">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
                    </div>
                    <div class="button">
                        <button>SEE MORE</button>
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img3.jpg" alt="">

                <div class="content">
                    <div class="title">MAGIC SLIDER</div>
                    <div class="type">NATURE</div>
                    <div class="description">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
                    </div>
                    <div class="button">
                        <button>SEE MORE</button>
                    </div>
                </div>
            </div>

        </div>


        <div class="thumbnail">

            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img1.jpg" alt="">
            </div>
            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img2.jpg" alt="">
            </div>
            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img3.jpg" alt="">
            </div>
            <div class="item">
                <img src="<%= request.getContextPath() %>/images/tripImages/img4.jpg" alt="">
            </div>

        </div>


        <div class="nextPrevArrows">
            <button class="prev"> < </button>
            <button class="next"> > </button>
        </div>


    </div>





    <script src="<%= request.getContextPath() %>/js/gallaryScript.js"></script>
</body>
</html>