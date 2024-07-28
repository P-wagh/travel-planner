package com.travelplanner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.travelplanner.entity.Admin;
import com.travelplanner.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AdminRepository adminRepository;

    public Admin saveAdmin(Admin admin){
        admin.setAdminPassword(passwordEncoder.encode(admin.getAdminPassword()));
        admin.setRole("ROLE_ADMIN");
        admin.setAdminPhoto("default.png");
        return adminRepository.save(admin);
    }
}
