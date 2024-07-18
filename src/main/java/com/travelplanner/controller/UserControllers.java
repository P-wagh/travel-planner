package com.travelplanner.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.travelplanner.entity.User;
import com.travelplanner.helper.Massege;
import com.travelplanner.repository.UserRepository;
import com.travelplanner.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserControllers {

    @Autowired
    private UserService userService;

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
    
    // update profile handaler
    @PostMapping("/user/updateprofile")
    public String updateprofile(@ModelAttribute("User") User user, @RequestParam(value = "profileimage", required = false) MultipartFile file, HttpSession session, Principal principal){

        //user in database
        int id = user.getUser_id();
        Optional<User> currentUserOptional = userRepository.findById(id);
        User currentUser = currentUserOptional.get();
        System.out.println("USER Database: "+ currentUser);

        try {
        
            //image....
            if (!file.isEmpty()) {

                //Delete old profile photo
                if (!currentUser.getUser_photo().equals("default.png")) {

                    File deleteFile = new ClassPathResource("static/images/profiles").getFile();
                    File file2 = new File(deleteFile, currentUser.getUser_photo());
                    file2.delete();
                    
                }

                //Update new profile image 
                File savFile = new ClassPathResource("static/images/profiles").getFile();
                Path path = Paths.get(savFile.getAbsolutePath() + File.separator + file.getOriginalFilename());
                Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
               
                user.setUser_photo(file.getOriginalFilename());
                                
            }else{
                user.setUser_photo(currentUser.getUser_photo());
            }
            
            user.setUser_password(currentUser.getUser_password());

            this.userRepository.save(user);

            System.out.println("USER field: "+ user);
            session.setAttribute("msg", new Massege("Profile Updated Successfully.", "success"));

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", new Massege("Profile Updated Faild.!!.", "danger"));

        }

        return "redirect:/user/userDashboard";
    }

    // Delete User
    @DeleteMapping("/user/delete/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable("id") int id) {

        Optional<User> currentUserOptional = userRepository.findById(id);
        User currentUser = currentUserOptional.get();

        //Delete profile photo
        if (!currentUser.getUser_photo().equals("default.png")) {

            
            try {
                File deleteFile =  new ClassPathResource("static/images/profiles").getFile();
                File file2 = new File(deleteFile, currentUser.getUser_photo());
                file2.delete();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            
        }

        try {
            userService.deleteUser(id);
            return ResponseEntity.ok("User deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting user");
        }
    }

 
}
