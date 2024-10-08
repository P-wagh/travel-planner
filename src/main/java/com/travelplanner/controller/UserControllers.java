package com.travelplanner.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.travelplanner.entity.Payment;
import com.travelplanner.entity.Trip;
import com.travelplanner.entity.User;
import com.travelplanner.helper.Massege;
import com.travelplanner.repository.PaymentRepository;
import com.travelplanner.repository.TripRepository;
import com.travelplanner.repository.UserRepository;
import com.travelplanner.service.TripService;
import com.travelplanner.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserControllers {

    @Autowired
    private TripRepository tripRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private TripService tripService;

    @Autowired
    private PasswordEncoder passwordEncoder;

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

        // to get the count of trip
        int tripCount = tripService.getCountOfTrip();
        session.setAttribute("tripCount", tripCount);
        List<Trip> trips = tripService.getAllTrips();
        session.setAttribute("alltrip", trips);

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
        // System.out.println("USER Database: "+ currentUser);

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


    // Password change 
    @PostMapping("/user/changepassword")
    public String changePassword(@RequestParam("oldpassword") String oldpassword, @RequestParam("newpassword") String newpassword, Principal principal, HttpSession session){
        
        // System.out.println("OLD PASSWORD: "+ oldpassword);
        // System.out.println("NEW PASSWORD: "+ newpassword);
        String uname = principal.getName();
        User currenUser = this.userRepository.findByUser_email(uname);
        System.out.println(currenUser);

        if (this.passwordEncoder.matches(oldpassword, currenUser.getUser_password())) {
           
            currenUser.setUser_password(this.passwordEncoder.encode(newpassword));
            this.userRepository.save(currenUser);
            
            session.setAttribute("msg", new Massege("Password change successful", "success"));

            return "redirect:/login";

        } else{
            System.out.println("password do not match");
            session.setAttribute("msg", new Massege("Password change faild.! old password do not match", "danger"));
            return "redirect:/user/userDashboard";
        }
        
    }

    @GetMapping("/user/userDashboard/suggestions")
    public String userSuggestions() {
        return "userDashboardSuggestions";
    }
    

    @GetMapping("/user/userDashboardManage")
    public String userDashboardManage(){
        return "userDashboardManage";
    }

    // For razorpay integration 
    // creating order request

    @PostMapping("/user/createOrder")
    @ResponseBody
    public String createOrder(@RequestBody Map<String, Object> data, Principal principal) throws RazorpayException{
        // System.out.println(data);
        Double amt = Double.parseDouble(data.get("amount").toString());
        // System.out.println(amt);

        int tripId = Integer.parseInt(data.get("tripId").toString());
        Optional<Trip> tripOptional = this.tripRepository.findById(tripId);
        Trip trip = tripOptional.get();


        var client = new RazorpayClient("YOUR RAZORPAY KEY", "YOUR RAZORPAY SECRET");

        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount",amt*100);
        orderRequest.put("currency","INR");
        orderRequest.put("receipt", "receipt#1");
        // JSONObject notes = new JSONObject();
        // notes.put("notes_key_1","Tea, Earl Grey, Hot");
        // notes.put("notes_key_1","Tea, Earl Grey, Hot");
        // orderRequest.put("notes",notes);

        // creating order
        Order order = client.orders.create(orderRequest);
        System.out.println(order);

        // Save information of order in our database
        Payment payment = new Payment();
        payment.setAmount(order.get("amount")+"");
        payment.setOrderId(order.get("id"));
        payment.setPaymentId(null);
        payment.setStatus("created");
        payment.setUser(this.userRepository.findByUser_email(principal.getName()));
        payment.setTrip(trip);
        payment.setReceipt(order.get("receipt"));

        this.paymentRepository.save(payment);

        return order.toString();
    }

    @PostMapping("/user/updatePayment")
    public ResponseEntity<?> updatePayment(@RequestBody Map<String, Object> data){

        System.out.println(data);
        Payment payment = this.paymentRepository.findByOrderId(data.get("order_id").toString());

        payment.setPaymentId(data.get("payment_id").toString());
        payment.setStatus(data.get("status").toString());

        this.paymentRepository.save(payment);

        return ResponseEntity.ok(Map.of("msg", "updated"));
    }


    @GetMapping("/user/userDashboardYourTravelPlans")
    public String userDashboardYourTravelPlans(HttpSession session){

        User user = (User) session.getAttribute("user");

        List<Payment> paymentList = this.paymentRepository.findByUser_user_id(user.getUser_id(), "paid");

        session.setAttribute("paymentList", paymentList);

        // for(Payment p: paymentList){
        //     System.out.println(p.getTrip().getDescription());
        // }
       

        return "userDashboardYourTravelPlans";
    }
 
}
