/**
* 
*/
package com.travelplanner.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
* @author DELL
*
*/
@Configuration
@EnableWebSecurity
public class SecurityConfig {


   @Bean
   public UserDetailsService getUserDetailsService() {
       return new UserDetailsServiceImpl();
   }

   @Bean
   public BCryptPasswordEncoder passwordEncoder() {
       return new BCryptPasswordEncoder();
   }

   @Bean
   public DaoAuthenticationProvider authenticationProvider(){
       DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
       daoAuthenticationProvider.setUserDetailsService(this.getUserDetailsService());
       daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());

       return daoAuthenticationProvider;
   }


   @Bean
   public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{

    return http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/home", "/do_register").permitAll()
                .requestMatchers("/user/**").hasRole("USER").anyRequest()
                .permitAll()
            )

            .formLogin(form -> form
            .loginPage("/login")
            .defaultSuccessUrl("/user/userDashboard", true)
            .permitAll())

                .build();
    
   }

}
