package com.travelplanner.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Trip {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String tripName;
    private String destination;
    private String sartingPlace;
    private Date starDate;
    private Date endDate;
    @Column(length = 1000)
    private Date description;
    private Double budget;

    
    public Trip() {
    }


    public Trip(int id, String tripName, String destination, String sartingPlace, Date starDate, Date endDate,
            Date description, Double budget) {
        this.id = id;
        this.tripName = tripName;
        this.destination = destination;
        this.sartingPlace = sartingPlace;
        this.starDate = starDate;
        this.endDate = endDate;
        this.description = description;
        this.budget = budget;
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


    public Date getStarDate() {
        return starDate;
    }


    public void setStarDate(Date starDate) {
        this.starDate = starDate;
    }


    public Date getEndDate() {
        return endDate;
    }


    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }


    public Date getDescription() {
        return description;
    }


    public void setDescription(Date description) {
        this.description = description;
    }


    public Double getBudget() {
        return budget;
    }


    public void setBudget(Double budget) {
        this.budget = budget;
    }

    

}
