package com.travelplanner.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.travelplanner.entity.Admin;
import com.travelplanner.entity.Trip;
import com.travelplanner.entity.TripImages;
import com.travelplanner.entity.User;
import com.travelplanner.helper.Massege;
import com.travelplanner.repository.AdminRepository;
import com.travelplanner.repository.TripImagesRepository;
import com.travelplanner.repository.TripRepository;
import com.travelplanner.repository.UserRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class AdminController {

    @Autowired
    private TripRepository tripRepository;

    @Autowired
    private TripImagesRepository tripImagesRepository;

    @Autowired
    private UserRepository userRepository;


    @Autowired
    private AdminRepository adminRepository;

    @GetMapping("/adminlogin")
    public String adminlogin() {
        return "adminlogin";
    }
    

    @PostMapping("/admin/adminDashboard")
    public String adminl( @RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {

        int userCount = (int) userRepository.count();
        session.setAttribute("userCount", userCount);

        int tripCount = (int) this.tripRepository.count();
        session.setAttribute("tripCount", tripCount);

        String adminEmail = this.adminRepository.getAdminEmail();
        System.out.println(adminEmail);
        System.out.println(username);

        int countOfImages = (int) tripImagesRepository.count();
        session.setAttribute("countOfImages", countOfImages);

        if (username.equals(adminEmail)) {
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

    @PostMapping("/admin/updateprofile")
    public String upadateProfile(@ModelAttribute("Admin") Admin admin, @RequestParam(value = "profileimage", required = false) MultipartFile file, HttpSession session, Principal principal){

        int id = admin.getAdminId();
        Optional<Admin> currentAdminoOptional = adminRepository.findById(id);
        Admin currentAdmin = currentAdminoOptional.get();

        try {

            if (!file.isEmpty()) {

                if (!currentAdmin.getAdminPhoto().equals("default.png")) {
                    File deleteFile = new ClassPathResource("static/images/profiles").getFile();
                    File file2 = new File(deleteFile, currentAdmin.getAdminPhoto());
                    file2.delete();
                    
                }

                File savFile = new ClassPathResource("static/images/profiles").getFile();
                Path path = Paths.get(savFile.getAbsolutePath() + File.separator + file.getOriginalFilename());
                Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

                admin.setAdminPhoto(file.getOriginalFilename());
            }else{
                admin.setAdminPhoto(currentAdmin.getAdminPhoto());
            }

            admin.setAdminPassword(currentAdmin.getAdminPassword());
            adminRepository.save(admin);

            session.setAttribute("msg", new Massege("Profile Updated Successfully.", "success"));

            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", new Massege("Profile Updated Faild.!!.", "danger"));

        }


        return "redirect:/admin/postRedirect";
    }

    // this is for intermidiet for update profile
    @GetMapping("/admin/postRedirect")
    public String postRedirect() {
    return "postRedirect"; 
    }
    

    @PostMapping("/admin/addImage")
    public String addTripImages(@ModelAttribute("TripImages") TripImages tripImages, @RequestParam("imageFile") MultipartFile file, HttpSession session) {
        
        try {
            
            File savFile = new ClassPathResource("/static/images/tripImages").getFile();
            Path path = Paths.get(savFile.getAbsolutePath() + File.separator + file.getOriginalFilename());
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

            tripImages.setOriginalName(file.getOriginalFilename());

            tripImagesRepository.save(tripImages);

            session.setAttribute("msg", new Massege("Trip image uploaded Successfully.", "success"));

            return "redirect:/admin/postRedirect";

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", new Massege("error image is not uploaded.!!", "danger"));

            return "redirect:/admin/postRedirect";
        }
    }

    @GetMapping("/admin/adminShowUsers")
    public String showUsers(HttpSession session) {

        List<User> userList = (List<User>) this.userRepository.findAll();
        session.setAttribute("userList", userList);

        return "adminUserInfo";
    }

    @GetMapping("/admin/adminTravelPlans")
    public String showTravelPlans(HttpSession session) {

        List<Trip> tripList = (List<Trip>) this.tripRepository.findAll();
        session.setAttribute("tripList", tripList);

        return "adminTravelPlans";
    }
    
    
}
