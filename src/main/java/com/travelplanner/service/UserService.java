package com.travelplanner.service;

// import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.travelplanner.repository.UserRepository;
import com.travelplanner.entity.User;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // public List<User> getAllUsers(){
    //     return (List<User>) userRepository.findAll();
    // }

    public Optional<User> getUserById(int id){
        return userRepository.findById(id);
    }

    public User getUserByuser_emailAndUser_password(String email, String password){

        return userRepository.findByuser_emailAnduser_password(email, password);
    }

    public User createUser(User user){
        user.setUser_password(passwordEncoder.encode(user.getUser_password()));
        user.setUserRole("ROLE_USER");
        user.setUser_photo("default.png");
        return userRepository.save(user);
    }

    public User updateUser1(int id, User userDetaails){

        User user = new User();
        user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
        user.setUser_name(userDetaails.getUser_name());
        user.setUser_address(userDetaails.getUser_address());
        user.setUser_city(userDetaails.getUser_city());
        user.setUser_city_pincode(userDetaails.getUser_city_pincode());
        user.setUser_phone(userDetaails.getUser_phone());
        user.setUser_email(userDetaails.getUser_email());
        user.setUser_photo(userDetaails.getUser_photo());
        user.setUser_password(userDetaails.getUser_password());

        return userRepository.save(user);
    }

    public void deleteUser(int id){
        userRepository.deleteById(id);
    }

    //Upate user profile
    public User getCurrentUser(){
        String email = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userRepository.findByUser_email(email);
    }

    public void updateUser(User user, String newPassword){
        if (newPassword != null && !newPassword.isEmpty()) {
            user.setUser_password(passwordEncoder.encode(newPassword));
        }

        userRepository.save(user);
    }
    // Updaye user profile end
}
