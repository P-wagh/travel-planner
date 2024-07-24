package com.travelplanner.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.travelplanner.entity.Admin;
import com.travelplanner.helper.Massege;
import com.travelplanner.repository.AdminRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class AdminController {


    @Autowired
    private AdminRepository adminRepository;

    @GetMapping("/adminlogin")
    public String adminlogin() {
        return "adminlogin";
    }
    

    @PostMapping("/admin/adminDashboard")
    public String adminl(Principal principal, @RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
        if (username.equals(adminRepository.getAdminEmail())) {
            if (password.equals(adminRepository.getAdminPassword())) {

                Admin admin = adminRepository.findByAdminEmail(username);

                session.setAttribute("admin", admin);
                return "adminDashboard";
            }else{
                session.setAttribute("msg", new Massege("Invalid Password.!!", "danger"));
                return "redirect:/adminlogin";

            }
        }else{
            session.setAttribute("msg", new Massege("Invalid username.!!", "danger"));
            return "redirect:/adminlogin";
        }
    }
    
}
