package com.travelplanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(){
        return "home";
    }

    @RequestMapping("/userRegistration")
    public String userRegistration(){
        return "userRegistration";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    
}
