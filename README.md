
# Travel Planner

Travel Planner is a web application designed to simplify and enhance the travel planning experience. With this application, users can manage their travel plans, get personalized suggestions for activities, and explore various destinations. The platform is built with Spring Boot, MySQL, and JSP, providing a robust and scalable solution for travel enthusiasts.


## Features

- User Dashboard: Manage your travel plans and view personalized suggestions.
- Admin Dashboard: Add and manage trips, view total users, and oversee the entire platform.
- Activities: Explore a variety of activities available at different destinations.
- Contact Us: Reach out to us with your inquiries and feedback.
- About Us: Learn more about our mission, vision, and the team behind Travel Planner.
- Gallery: Browse through a collection of images showcasing beautiful destinations and exciting activities.

## Technologies Used

- Spring Boot: Backend framework for building Java applications.
- MySQL: Database for storing user and trip information.
- JSP: JavaServer Pages for building dynamic web pages.
- Bootstrap: Frontend framework for responsive and attractive UI design.


## Deployment
1. Clone the repository: 

```bash
  git clone https://github.com/yourusername/travel-planner.git
```
2. Set up the MySQL database and update the application.properties file with your database credentials.
3. Change the username and password in SendEmailService.java file.

![sendEmailSS](https://github.com/user-attachments/assets/349f505a-eb97-49ea-a44b-93d3964800f0)

4. Change the Razorpay keyId and keySecret with your keyId and keySecret in the UserController.java file. 

![rzp_user](https://github.com/user-attachments/assets/0316eba4-0354-4f7d-94c7-c93878ab968d)
Also in the app.js file.
![rzp_script](https://github.com/user-attachments/assets/e6520164-7672-44e0-8d13-5776957efd94)

3. Build and run the application
```bash
  mvn spring-boot:run
```

## Screenshots

1. Home Page
![home_page](https://github.com/user-attachments/assets/8a9d0259-a6ec-4260-b695-9be67ffd3804)

2. Gallary
![gallary](https://github.com/user-attachments/assets/ef7d1ba5-b769-4a1e-a0e2-ab89293b2a92)

3. Activity
![activitySS](https://github.com/user-attachments/assets/1bd05763-d297-48f5-84af-9ef6d1a56318)

4. Login page
![loginSS](https://github.com/user-attachments/assets/1581689e-2620-4809-839a-c5e8e0f2cb65)

5. User Dashboard
![userDashboard](https://github.com/user-attachments/assets/b4c1ba7f-0377-4b3b-be1b-d27f0fcfe1a7)

6. Admin Dashboard
![adminDahsboard](https://github.com/user-attachments/assets/2cfb1837-2f55-48ce-af12-095d3e876b66)

7. Payment Gateway Integration
![PaymentGatway integration](https://github.com/user-attachments/assets/e9667b6b-679d-46c1-9f44-a51bd975bf6d)