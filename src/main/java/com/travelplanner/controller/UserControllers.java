package com.travelplanner.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.travelplanner.entity.User;
import com.travelplanner.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserControllers {

    @Autowired
    private UserRepository userRepository;

	@GetMapping("/login")
	public String showLoginForm() {
		return "login"; // The custom login form view
	}
	
    @GetMapping("/user/userDashboard")
    public String userProfile(Model model, Principal principal, HttpSession session) {
        String userName = principal.getName();
        System.out.println(userName);

        // get the user using username (Email)
        User user = userRepository.findByUser_email(userName);

        System.out.println(user);

        model.addAttribute("user", user);
        session.setAttribute("user", user);

        return "userDashboard";
    }
    


}
