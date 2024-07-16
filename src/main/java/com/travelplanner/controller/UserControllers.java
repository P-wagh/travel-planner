package com.travelplanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserControllers {

	@GetMapping("/login")
	public String showLoginForm() {
		return "login"; // The custom login form view
	}
	
    @GetMapping("/user/userDashboard")
    public String userProfile() {
        return "userDashboard";
    }
    


}
