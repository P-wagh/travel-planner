package com.travelplanner.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int adminId;
    private String adminName;
    @Column(length = 11)
    private String adminPhone;
    private String adminEmail;
    private String adminPhoto;
    private String role;
    private String adminPassword;


    public Admin() {
    }


    public Admin(String adminName, String adminPhone, String adminEmail, String adminPhoto, String role,
            String adminPassword) {
        this.adminName = adminName;
        this.adminPhone = adminPhone;
        this.adminEmail = adminEmail;
        this.adminPhoto = adminPhoto;
        this.role = role;
        this.adminPassword = adminPassword;
    }


    public String getAdminName() {
        return adminName;
    }


    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }


    public String getAdminPhone() {
        return adminPhone;
    }


    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }


    public String getAdminEmail() {
        return adminEmail;
    }


    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }


    public String getAdminPhoto() {
        return adminPhoto;
    }


    public void setAdminPhoto(String adminPhoto) {
        this.adminPhoto = adminPhoto;
    }


    public String getRole() {
        return role;
    }


    public void setRole(String role) {
        this.role = role;
    }


    public String getAdminPassword() {
        return adminPassword;
    }


    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    


    public int getAdminId() {
        return adminId;
    }


    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }


    @Override
    public String toString() {
        return "Admin [adminName=" + adminName + ", adminPhone=" + adminPhone + ", adminEmail=" + adminEmail
                + ", adminPhoto=" + adminPhoto + ", role=" + role + ", adminPassword=" + adminPassword + "]";
    }
    

}
