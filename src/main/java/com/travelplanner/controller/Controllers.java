package com.travelplanner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travelplanner.entity.User;
import com.travelplanner.service.UserService;
import org.springframework.web.bind.annotation.RestController;




@RestController
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

	@PostMapping
    public String createUser(@RequestBody User user) {
        userService.createUser(user);
        return "redirect:/users";
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
