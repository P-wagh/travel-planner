<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ include file="/view/include/navbarc.jsp" %>
        <%@page isELIgnored="false" %>



            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Registration Form</title>
            </head>

            <body>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="form-container">
                                <h2 class="text-center">User Registration</h2>
                                <p class="text-center">Home for the traveller</p>
                                <form action="/users" method="post">
                                    <div class="form-group my-2">
                                        <label for="user_name">User Name</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name"
                                            required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_address">User Address</label>
                                        <input type="text" class="form-control" id="user_address" name="user_address"
                                            required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_city">User City</label>
                                        <input type="text" class="form-control" id="user_city" name="user_city"
                                            required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_city_pincode">City Pincode</label>
                                        <input type="text" class="form-control" id="user_city_pincode"
                                            name="user_city_pincode" required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_phone">Phone Number</label>
                                        <input type="text" class="form-control" id="user_phone" name="user_phone"
                                            required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_email">Email</label>
                                        <input type="email" class="form-control" id="user_email" name="user_email"
                                            required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_photo">User Photo</label>
                                        <input type="file" class="form-control" id="user_photo" name="user_photo">
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="user_password">Password</label>
                                        <input type="password" class="form-control" id="user_password"
                                            name="user_password" required>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="confirm_password">Confirm Password</label>
                                        <input type="password" class="form-control" id="confirm_password"
                                            name="confirm_password" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>






                <%@ include file="/view/include/footerc.jsp" %>
            </body>

            </html>