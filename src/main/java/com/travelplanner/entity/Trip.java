package com.travelplanner.entity;

import java.sql.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Trip {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String tripName;
    private String destination;
    private String sartingPlace;
    private Date startDate;
    private Date endDate;
    @Column(length = 1000)
    private String description;
    private Double budget;

    @OneToMany(mappedBy = "trip")
    private List<Payment> payment;

    
    public Trip() {
    }


    public Trip(int id, String tripName, String destination, String sartingPlace, Date starDate, Date endDate,
            String description, Double budget) {
        this.id = id;
        this.tripName = tripName;
        this.destination = destination;
        this.sartingPlace = sartingPlace;
        this.startDate = starDate;
        this.endDate = endDate;
        this.description = description;
        this.budget = budget;
    }


    public Trip(int id, String tripName, String destination, String sartingPlace, Date startDate, Date endDate,
            String description, Double budget, List<Payment> payment) {
        this.id = id;
        this.tripName = tripName;
        this.destination = destination;
        this.sartingPlace = sartingPlace;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.budget = budget;
        this.payment = payment;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getTripName() {
        return tripName;
    }


    public void setTripName(String tripName) {
        this.tripName = tripName;
    }


    public String getDestination() {
        return destination;
    }


    public void setDestination(String destination) {
        this.destination = destination;
    }


    public String getSartingPlace() {
        return sartingPlace;
    }


    public void setSartingPlace(String sartingPlace) {
        this.sartingPlace = sartingPlace;
    }


    public Date getStartDate() {
        return startDate;
    }


    public void setStartDate(Date starDate) {
        this.startDate = starDate;
    }


    public Date getEndDate() {
        return endDate;
    }


    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public Double getBudget() {
        return budget;
    }


    public void setBudget(Double budget) {
        this.budget = budget;
    }


    public List<Payment> getPayment() {
        return payment;
    }


    public void setPayment(List<Payment> payment) {
        this.payment = payment;
    }

    

}
