package com.travelplanner.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int user_id;
    
    private String user_name;

    @Column(length = 250)
    private String user_address;
    private String user_city;
    private int user_city_pincode;

    @Column(length = 11)
    private String user_phone;
    private String user_email;
    private String user_photo;
    private String userRole;
    private String user_password;

    // for payment of user
    @OneToMany(mappedBy = "user")
    private List<Payment> payment;


    // Default Constructor
    public User() {
    }


    // Parameterise Constructor
    public User(int user_id, String user_name, String user_address, String user_city, int user_city_pincode,
            String user_phone, String user_email, String user_photo, String userRole, String user_password) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_address = user_address;
        this.user_city = user_city;
        this.user_city_pincode = user_city_pincode;
        this.user_phone = user_phone;
        this.user_email = user_email;
        this.user_photo = user_photo;
        this.userRole = userRole;
        this.user_password = user_password;
    }


    // Contructor for add payment details also
    public User(int user_id, String user_name, String user_address, String user_city, int user_city_pincode,
            String user_phone, String user_email, String user_photo, String userRole, String user_password,
            List<Payment> payment) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_address = user_address;
        this.user_city = user_city;
        this.user_city_pincode = user_city_pincode;
        this.user_phone = user_phone;
        this.user_email = user_email;
        this.user_photo = user_photo;
        this.userRole = userRole;
        this.user_password = user_password;
        this.payment = payment;
    }


    // Geters and Seters
    public String getUserRole() {
        return userRole;
    }


    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }


    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }


    public String getUser_password() {
        return user_password;
    }


    public int getUser_id() {
        return user_id;
    }



    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }



    public String getUser_name() {
        return user_name;
    }



    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }



    public String getUser_address() {
        return user_address;
    }



    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }



    public String getUser_city() {
        return user_city;
    }



    public void setUser_city(String user_city) {
        this.user_city = user_city;
    }



    public int getUser_city_pincode() {
        return user_city_pincode;
    }



    public void setUser_city_pincode(int user_city_pincode) {
        this.user_city_pincode = user_city_pincode;
    }



    public String getUser_phone() {
        return user_phone;
    }



    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }



    public String getUser_email() {
        return user_email;
    }



    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }



    public String getUser_photo() {
        return user_photo;
    }



    public void setUser_photo(String user_photo) {
        this.user_photo = user_photo;
    }
    

    public List<Payment> getPayment() {
        return payment;
    }


    public void setPayment(List<Payment> payment) {
        this.payment = payment;
    } 


    // ToString Method
    @Override
    public String toString() {
        return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_address=" + user_address
                + ", user_city=" + user_city + ", user_city_pincode=" + user_city_pincode + ", user_phone=" + user_phone
                + ", user_email=" + user_email + ", user_photo=" + user_photo + "user_password" + user_password+ "]";
    }


    
    

}
