<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.travelplanner.entity.User, com.travelplanner.entity.Payment, com.travelplanner.helper.Massege,com.travelplanner.entity.Trip, jakarta.servlet.http.HttpSession, java.util.List" %>
<% 
    User user=(User) session.getAttribute("user");
    Massege msg=(Massege) session.getAttribute("msg");
    int tripCount=(int) session.getAttribute("tripCount");
    List<Payment> useralltrip = (List<Payment>) session.getAttribute("paymentList");
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Travel planner User Dashboard</title>
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

        .active {
            color: #ffc107 !important;
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

        /* For profile ficture to cover all space in div */
        .profilepicture {
            object-fit: cover;
        }

        /* For drop down */
        .dropdown-submenu {
            position: relative;
        }

        .dropdown-submenu .dropdown-menu {
            top: 0;
            left: -100%;
            margin-top: 0;
            margin-left: 0;
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
                        <svg style="fill: white;" version="1.1" xmlns="http://www.w3.org/2000/svg" width="28"
                            height="28" viewBox="0 0 16 16" enable-background="new 0 0 16 16">
                            <path
                                d="M0,9l4,1.5L6,16l2.861-3.82L14,14l2-14L0,9z M7.169,11.44l-0.916,2.485l-1.086-3.118l8.402-7.631L7.169,11.44z">
                            </path>
                        </svg>
                    </div>
                    <hr style="color: #fff;">

                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link " href="/user/userDashboard">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                Travel Plans
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/userDashboard/suggestions">
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
                            <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="<%= request.getContextPath() %>/images/profiles/<%= user.getUser_photo() %>"
                                    alt="mdo" width="35px" height="35px" class="rounded-circle profilepicture">
                            </a>
                            <ul class="dropdown-menu text-small shadow">
                                <li><a class="dropdown-item" href="#">New project...</a></li>

                                <!-- Dropdown submenu -->
                                <div class="dropdown-submenu dropstart">
                                    <a class="dropdown-item dropdown-toggle" href="#">Settings</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"
                                            data-bs-target="#changePassword">Change Password</a>
                                        <a class="dropdown-item text-danger" href="#"
                                            onclick="deleteUser( '<%= user.getUser_id() %>' )">Delete
                                            Account</a>
                                    </div>
                                </div>


                                <!-- link trigger modal -->
                                <li><a class="dropdown-item" href="#" data-bs-toggle="modal"
                                        data-bs-target="#profile">Profile</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="/logout">Sign out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Model Starting  -->
                <!-- Modal profile-->
                <div class="modal fade" id="profile" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Exploration</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="profilePhoto d-flex justify-content-center">
                                    <img src="<%= request.getContextPath() %>/images/profiles/<%= user.getUser_photo() %>"
                                        alt="" width="125px" height="125px" class="rounded-circle profilepicture">
                                </div>
                                <div class="d-flex justify-content-center">
                                    <strong class="fs-4">
                                        <%= user.getUser_name() %>
                                    </strong>
                                </div>
                                <hr>

                                <div id="showProfile">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">User Id </th>
                                                <td>:</td>
                                                <td>
                                                    <%= user.getUser_id() %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Address </th>
                                                <td>:</td>
                                                <td>
                                                    <%= user.getUser_address() %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">City </th>
                                                <td>:</td>
                                                <td>
                                                    <%= user.getUser_city() %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">City Pincode </th>
                                                <td>:</td>
                                                <td>
                                                    <%= user.getUser_city_pincode() %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Phone no</th>
                                                <td>:</td>
                                                <td>
                                                    <%= user.getUser_phone() %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email </th>
                                                <td>:</td>
                                                <td>
                                                    <%= user.getUser_email() %>
                                                </td>
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
                                                    <td><input type="file" class="form-control" name="profileimage">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">User Id: </th>
                                                    <td>
                                                        <%= user.getUser_id() %> <input type="hidden" name="user_id"
                                                                value="<%= user.getUser_id() %>" id="">
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Name: </th>
                                                    <td><input type="text" class="form-control" name="user_name" id=""
                                                            value="<%= user.getUser_name() %>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Address: </th>
                                                    <td><input type="text" class="form-control" name="user_address"
                                                            value="<%= user.getUser_address() %>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">City: </th>
                                                    <td><input type="text" class="form-control" name="user_city"
                                                            value=" <%= user.getUser_city() %> "> </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">City Pincode: </th>
                                                    <td><input type="text" class="form-control" name="user_city_pincode"
                                                            id="" value="<%= user.getUser_city_pincode() %>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Phone no:</th>
                                                    <td><input type="text" class="form-control" name="user_phone" id=""
                                                            value="<%= user.getUser_phone() %>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email: </th>
                                                    <td><input type="text" name="user_email" class="form-control" id=""
                                                            value="<%= user.getUser_email() %>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">role: </th>
                                                    <td>
                                                        <%= user.getUserRole() %><input type="hidden" name="userRole"
                                                                class="form-control" id=""
                                                                value="<%= user.getUserRole() %>">
                                                    </td>
                                                </tr>
                                                <!-- <tr>
                                        <th scope="row">Password: </th>
                                        <td><input type="text" name="user_password" class="form-control" id="" value="<%= user.getUser_password() %>"></td>
                                      </tr> -->

                                            </tbody>
                                        </table>
                                        <button type="submit" class="btn btn-outline-dark">Save
                                            Changes</button>
                                    </form>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline-dark" id="edit-profile">Update
                                    Profile</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Model profile end -->



                <!-- Change Password Model Start-->
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal fade" id="changePassword" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Change Password
                                    </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <form action="/user/changepassword" method="post">
                                            <div class="mb-3">
                                                <label for="oldpassword" class="form-label">Old
                                                    Password</label>
                                                <input type="password" name="oldpassword" class="form-control"
                                                    id="oldpassword" placeholder="Enter old password here" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="newpassword" class="form-label">New
                                                    Password</label>
                                                <input type="password" name="newpassword" class="form-control"
                                                    id="newpassword" placeholder="Enter new password here" required>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-outline-dark">Save
                                                    new password</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- End Change Password Model -->







                <% if(msg !=null){ %>
                    <div class="alert alert-<%= msg.getType() %>" role="alert">
                        <%= msg.getDiscription() %>
                    </div>
                    <% session.removeAttribute("msg"); } %>

                        <div class="card p-5">
                            <div class="card-body">
                                <h5 class="card-title">Your Travel Plans</h5>
                                <p class="card-text">You have no recent travel plans.</p>

                                <div class="d-flex mt-5">
                                    <% if(useralltrip !=null){ 
                                    	for(Payment usertrip : useralltrip){ 
                                    %>
                                        <div class="col-md-4 mx-2">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">
                                                        <%= usertrip.getTrip().getTripName() %>
                                                    </h5>
                                                    <p class="card-text">
                                                        <%= usertrip.getTrip().getDescription() %>
                                                    </p>
                                                    <p class="card-text"><strong>Destination:</strong>
                                                        <%= usertrip.getTrip().getDestination() %>
                                                    </p>
                                                    <p class="card-text"><strong>Payment status:</strong>
                                                    <div class="amount">
                                                        <%= usertrip.getStatus() %>
                                                    </div>Rs </p>
                                                    <p class="card-text"><strong>Start Date:</strong>
                                                        <%= usertrip.getTrip().getStartDate() %>
                                                    </p>
                                                    <p class="card-text"><strong>End Date:</strong>
                                                        <%= usertrip.getTrip().getEndDate() %>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                        <% 		}
                                    		} 
                                    	%>
                                </div>

                            </div>
                        </div>


            </main>
        </div>
    </div>





    <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery (User to define = '$' if not add jQuery they it give error) -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Sweet alert CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Razorpay Script -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <!-- <script src="<%= request.getContextPath() %>/js/payment.js "></script> -->

    <!-- Script for edit profile -->
    <script type="text/javascript">
        $(document).ready(function () {
            let editStatus = false;
            $("#edit-profile").click(function () {

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
        $('.dropdown-submenu a.dropdown-toggle').on("click", function (e) {
            var $subMenu = $(this).next(".dropdown-menu");
            if (!$subMenu.hasClass('show')) {
                $subMenu.parents('.dropdown-menu').first().find('.show').removeClass("show");
            }
            $subMenu.toggleClass('show');
            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function (e) {
                $('.dropdown-submenu .show').removeClass("show");
            });
            return false;
        });



        function deleteUser(uid) {

            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch('/user/delete/' + uid, {
                        method: 'DELETE',
                    })
                        .then(response => {
                            if (response.ok) {
                                Swal.fire("Deleted!", "Your account has been deleted.", "success").then(() => {
                                    // Redirect to a suitable page after deletion
                                    window.location = '/home';
                                });
                            } else {
                                Swal.fire("Error!", "There was a problem deleting your account.", "error");
                            }
                        })
                        .catch(error => {
                            Swal.fire("Error!", "There was a problem deleting your account.", "error");
                        });
                } else {
                    Swal.fire("Cancelled", "Your profile is safe.", "info");
                }
            });
        }



        // payment integration
        // let amt = document.querySelector(".amount").innerHTML
        // console.log(amt)

        const paymentStart = (amt, tripId) => {
            console.log(amt)

            $.ajax(
                {
                    url: '/user/createOrder',
                    data: JSON.stringify({ amount: amt, tripId: tripId, info: 'order_request' }),
                    contentType: 'application/json',
                    type: 'POST',
                    dataType: 'json',
                    success: function (response) {
                        // this function run when success
                        console.log(response)
                        console.log(response.id)

                        if (response.status == "created") {
                            // open payment form

                            let options = {
                                "key": "rzp_test_gdTKt6nq4H7aFT", // Enter the Key ID generated from the Dashboard
                                "amount": response.amount, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                                "currency": "INR",
                                "name": "Travel-Planner", //your business name
                                "description": "Explore the destination with us",
                                "image": "<%= request.getContextPath() %>/images/logo.svg",
                                "order_id": response.id, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                                "callback_url": "https://eneqd3r9zrjok.x.pipedream.net/",
                                "handler": function (response) {
                                    console.log(response.razorpay_payment_id);
                                    console.log(response.razorpay_order_id);
                                    console.log(response.razorpay_signature);
                                    console.log("payment succsessful")

                                    // to update the status value in the payment table
                                    updatePaymentOnServer(response.razorpay_payment_id, response.razorpay_order_id,'paid');

                                    // alert("payment successfull")
                                    // Swal.fire({
                                    //     title: "Payment Successfull!",
                                    //     text: "Your seat is booked!",
                                    //     icon: "success"
                                    // });
                                },
                                "prefill": { //We recommend using the prefill parameter to auto-fill customer's contact information especially their phone number
                                    "name": "<%= user.getUser_name() %>", //your customer's name
                                    "email": "<%= user.getUser_email() %>",
                                    "contact": "<%= user.getUser_phone() %>" //Provide the customer's phone number for better conversion rates 
                                },
                                "notes": {
                                    "address": "Plan your trip with travel planner"
                                },
                                "theme": {
                                    "color": "#3399cc"
                                }
                            };

                            var rzp1 = new Razorpay(options);
                            rzp1.on('payment.failed', function (response) {
                                console.log(response.error.code);
                                console.log(response.error.description);
                                console.log(response.error.source);
                                console.log(response.error.step);
                                console.log(response.error.reason);
                                console.log(response.error.metadata.order_id);
                                console.log(response.error.metadata.payment_id);
                                // alert("Payment faild..!!")
                                Swal.fire({
                                    icon: "error",
                                    title: "Oops...",
                                    text: "Something went wrong! Payment faild..!!",
                                    // footer: '<a href="#">Why do I have this issue?</a>'
                                });
                            });

                            rzp1.open();
                        }
                    },
                    error: function (error) {
                        // this function run when error
                        console.log(error)
                        alert("Something went wrong.!!")
                    }
                }
            )

        }

        function updatePaymentOnServer(payment_id, order_id, status)
        {
            $.ajax({
                url:"/user/updatePayment",
                data: JSON.stringify({payment_id:payment_id, order_id:order_id,status:status}),
                contentType:"application/json",
                type:"POST",
                dataType:"json",
                success:function(response){
                    Swal.fire({
                        title: "Payment Successfull!",
                        text: "Your seat is booked!",
                        icon: "success"
                    });
                },
                error:function(error){
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",                            
                        text: "Your payment is successfull, but we did not get on server we will contact you as soon as possible",
                        // footer: '<a href="#">Why do I have this issue?</a>'
                    });
                },
            })
        }


    </script>

</body>

</html>