<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "com.travelplanner.entity.TripImages, jakarta.servlet.http.HttpSession, java.util.List" %>
<%
  List<TripImages> allTripImagesList = (List<TripImages>) session.getAttribute("tripImageList");
%>
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
              <a class="nav-link" aria-current="page" href="/home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="#">Gallary</a>
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
  </header>



  <div class="slider">
    


    <div class="list">




      <div class="item">
        <img src="<%= request.getContextPath() %>/images/tripImages/img1.jpg" alt="">

        <div class="content">
            <div class="title">Travel-Planner</div>
            <div class="type">FLOWER</div>
            <div class="description">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
            </div>
            
        </div>
    </div>

    <div class="item">
        <img src="<%= request.getContextPath() %>/images/tripImages/img2.jpg" alt="">

        <div class="content">
            <div class="title">Travel Planner</div>
            <div class="type">NATURE</div>
            <div class="description">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
            </div>
            
        </div>
    </div>

    <div class="item">
        <img src="<%= request.getContextPath() %>/images/tripImages/img4.jpg" alt="">

        <div class="content">
            <div class="title">travel Planner</div>
            <div class="type">PLANT</div>
            <div class="description">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
            </div>
            
        </div>
    </div>

    <div class="item">
        <img src="<%= request.getContextPath() %>/images/tripImages/img3.jpg" alt="">

        <div class="content">
            <div class="title">travel planner</div>
            <div class="type">NATURE</div>
            <div class="description">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti temporibus quis eum consequuntur voluptate quae doloribus distinctio. Possimus, sed recusandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, aut.
            </div>
            
        </div>
    </div>




      <% for(TripImages tripImages : allTripImagesList){ %>

        <div class="item">
          <img src="<%= request.getContextPath() %>/images/tripImages/<%= tripImages.getOriginalName() %>" alt="">

          <div class="content">
            <div class="title">
              <%= tripImages.getImageName() %>
            </div>
            <div class="type">
              <%= tripImages.getType() %>
            </div>
            <div class="description">
              <%= tripImages.getDiscription() %>
            </div>
            <!-- <div class="button">
                    <button>SEE MORE</button>
                </div> -->
          </div>
        </div>

        <% } %>

    </div>

    <!-- thumbnail section -->
    <div class="thumbnail">



      <div class="item">
          <img src="<%= request.getContextPath() %>/images/tripImages/img1.jpg" alt="">
      </div>
      <div class="item">
          <img src="<%= request.getContextPath() %>/images/tripImages/img2.jpg" alt="">
      </div>
      <div class="item">
          <img src="<%= request.getContextPath() %>/images/tripImages/img4.jpg" alt="">
      </div>
      <div class="item">
          <img src="<%= request.getContextPath() %>/images/tripImages/img3.jpg" alt="">
      </div>



      <% for(TripImages tripImages : allTripImagesList){ %>
        <div class="item">
          <img src="<%= request.getContextPath() %>/images/tripImages/<%= tripImages.getOriginalName() %>" alt="">
        </div>

        <% } %>

    </div>


    <div class="nextPrevArrows">
      <button class="prev">
        < </button>
          <button class="next"> > </button>
    </div>


  </div>





  <script>
    let nextBtn = document.querySelector('.next')
    let prevBtn = document.querySelector('.prev')

    let slider = document.querySelector('.slider')
    let sliderList = slider.querySelector('.slider .list')
    let thumbnail = document.querySelector('.slider .thumbnail')
    let thumbnailItems = thumbnail.querySelectorAll('.item')

    thumbnail.appendChild(thumbnailItems[0])

    // Function for next button 
    nextBtn.onclick = function () {
      moveSlider('next')
    }


    // Function for prev button 
    prevBtn.onclick = function () {
      moveSlider('prev')
    }


    function moveSlider(direction) {
      let sliderItems = sliderList.querySelectorAll('.item')
      let thumbnailItems = document.querySelectorAll('.thumbnail .item')

      if (direction === 'next') {
        sliderList.appendChild(sliderItems[0])
        thumbnail.appendChild(thumbnailItems[0])
        slider.classList.add('next')
      } else {
        sliderList.prepend(sliderItems[sliderItems.length - 1])
        thumbnail.prepend(thumbnailItems[thumbnailItems.length - 1])
        slider.classList.add('prev')
      }


      slider.addEventListener('animationend', function () {
        if (direction === 'next') {
          slider.classList.remove('next')
        } else {
          slider.classList.remove('prev')
        }
      }, { once: true }) // Remove the event listener after it's triggered once
    }
  </script>
</body>

</html>