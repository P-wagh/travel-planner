package com.travelplanner.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.travelplanner.entity.User;
import com.travelplanner.helper.Massege;
import com.travelplanner.repository.UserRepository;
import com.travelplanner.service.SendEmailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotPasswordController {

    @Autowired
    private SendEmailService sendEmailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    Random random = new Random(1000);

    @GetMapping("/forgot-password")
    public String forgotPassword(){
        return "forgot-password";
    }

    @PostMapping("/send-otp")
    public String sendOTP(@RequestParam("email") String email, HttpSession session){
        
        System.out.println("Email: "+ email);

        //generating otp of 4 digit
        int otp = random.nextInt(9999);
        System.out.println("OTP: "+otp);


        // write code for send otp to email...
        String subject = "OTP From Travel-Planner";
        String message = "<div style='border:1px solid #e2e2e2; padding:20px'>"
                        +"<h1>"
                        +"OTP is"
                        +"<b>"+otp
                        +"</b>"
                        +"</h1>"
                        +"</div>";
        String to = email;


        boolean flag = this.sendEmailService.sendEmail(message, subject, to);

        if (flag) {
            
            session.setAttribute("msg", new Massege("OTP send on email "+email, "success"));
            session.setAttribute("myotp", otp);
            session.setAttribute("email", email);
            
            return "enterOTP";
            
        }else{

            session.setAttribute("msg", new Massege("Check your email id .. !!", "danger"));
            
            return "/forgot-password";
        }
    }


    @PostMapping("/enterOTP")
    public String enterOTP(){
        return "enterOTP";
    }


    @PostMapping("/varify-otp")
    public String varifyOTP(@RequestParam("otp") int otp, HttpSession session){

        int myotp = (int) session.getAttribute("myotp");

        String email = (String) session.getAttribute("email");

        if (myotp == otp) {

            User user = this.userRepository.findByUser_email(email);
            if (user == null) {
                //send error message

                session.setAttribute("msg", new Massege("User not found plse sign up your self first.!", "danger"));

                return "userRegistration";
                
            }else{
                // send change password form

                // password change form
                return "password-change-form";
            }
            
        } else{
            //if otp is wrong
            session.setAttribute("msg", new Massege("You have entered wrong OTP.!", "danger"));

            return "enterOTP";
        }

    }


    @PostMapping("/change-password")
    public String passwordChange(@RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword, HttpSession session){

        if (newPassword.equals(confirmPassword)) {
            //change password
            String email = (String) session.getAttribute("email");
            User user = this.userRepository.findByUser_email(email);
            user.setUser_password(passwordEncoder.encode(newPassword));
            this.userRepository.save(user);
            
            session.setAttribute("msg", new Massege("your password has been changed successfully.", "success"));
            session.setAttribute("user", user);

            return "redirect:/login";

        } else{

            session.setAttribute("msg", new Massege("Plese confirm your password.!", "danger"));

            return "password-change-form";
        }

    }


}
