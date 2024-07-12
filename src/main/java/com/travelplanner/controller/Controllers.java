package com.travelplanner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travelplanner.entity.User;
import com.travelplanner.helper.Massege;
import com.travelplanner.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/users")
public class Controllers {

	@Autowired
	UserService userService;

	@GetMapping
	public List<User> getallusers(){
		return userService.getAllUsers();
	}

	@GetMapping("/{id}")
    public String getUserById(@PathVariable int id, Model model) {
        User user = userService.getUserById(id).orElse(null);
        model.addAttribute("user", user);
        return "userDetail";
    }    

	@RequestMapping(method = RequestMethod.POST)
    public String createUser(@ModelAttribute("User") User user, Model model, HttpSession session) {
        try {
            User u = userService.createUser(user);

            model.addAttribute("user", user);
            
            Massege msg = new Massege("Registrstion Succesfull.", "success");
            session.setAttribute("msg", msg);
            System.out.println(u);
        } catch (Exception e) {
            e.printStackTrace();
            Massege msg = new Massege("Error: Registration faild", "danger");
            session.setAttribute("msg", msg);
            return "userRegistration";
        }
        return "login";
    }
    
    @GetMapping("/{user_email},{user_password}")
    public String getUserByuser_email(@PathVariable String user_email,@PathVariable String user_password, Model model){
        User u = userService.getUserByuser_emailAndUser_password(user_email, user_password);
        System.out.println(u);
        return "/userDashboard";
    }

	@PutMapping("/{id}")
    public User updateUser(@PathVariable int id, @RequestBody User userDetails) {
        User user = userService.updateUser(id, userDetails);
        return user;
    }

    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable int id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }

}
