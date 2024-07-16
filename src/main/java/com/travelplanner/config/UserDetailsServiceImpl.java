package com.travelplanner.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;


import com.travelplanner.entity.User;
import com.travelplanner.repository.UserRepository;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {

   @Autowired
   private UserRepository userRepository;

   @Override
   public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
       User user = userRepository.findByUser_email(email);
       if (user == null) {
           throw new UsernameNotFoundException("User not found");
       }
       
       CustomUserDetails cUserDetails = new CustomUserDetails(user);

       return cUserDetails;
   }
}
