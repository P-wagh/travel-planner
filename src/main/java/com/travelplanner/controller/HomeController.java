package com.travelplanner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travelplanner.entity.TripImages;
import com.travelplanner.entity.User;
import com.travelplanner.helper.Massege;
import com.travelplanner.repository.TripImagesRepository;
import com.travelplanner.service.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private TripImagesRepository tripImagesRepository;

    @Autowired
    private UserService userService;

    @RequestMapping("/home")
    public String home(){
        return "index";
    }

    @RequestMapping("/userRegistration")
    public String userRegistration(){
        return "userRegistration";
    }

    @RequestMapping(value = "/do_register", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("User") User user, Model model, HttpSession session) {
        try {
            User u = userService.createUser(user);

            model.addAttribute("user", u);
            
            Massege msg = new Massege("Registrstion Succesfull.", "success");
            session.setAttribute("msg", msg);
            System.out.println(u);

            return "redirect:/user/userDashboard";

        } catch (Exception e) {
            e.printStackTrace();
            Massege msg = new Massege("Error: Registration faild", "danger");
            session.setAttribute("msg", msg);
            return "userRegistration";
        }

    }

    @GetMapping("/gallary")
    public String showGallary(HttpSession session) {
        List<TripImages> tripImagesList = tripImagesRepository.findAll();
        session.setAttribute("tripImageList", tripImagesList);
    
        return "gallary";
    }
    
    @GetMapping("/about")
    public String showAboutPage() {
        return "about";
    }

    @GetMapping("/contact")
    public String showContactPage() {
        return "contactus";
    }

    @GetMapping("/activity")
    public String showActivityPage() {
        return "activity";
    }
    
  
}
