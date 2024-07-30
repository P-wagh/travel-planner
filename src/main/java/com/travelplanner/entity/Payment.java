package com.travelplanner.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Payment {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long PymentId;

    private String orderId;
    private String amount;
    private String receipt;
    private String status;

    @ManyToOne
    private User user;

    @ManyToOne
    private Trip trip;

    private String paymentId;


    
    // Defaul Contructor
    public Payment() {
    }

    

    public Payment(Long pymentId, String orderId, String amount, String receipt, String status, User user,Trip trip,
            String paymentId) {
        PymentId = pymentId;
        this.orderId = orderId;
        this.amount = amount;
        this.receipt = receipt;
        this.status = status;
        this.user = user;
        this.trip = trip;
        this.paymentId = paymentId;
    }



    // Getters and Setters
    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }
    
    public Long getPymentId() {
        return PymentId;
    }

    public void setPymentId(Long pymentId) {
        PymentId = pymentId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }



    @Override
    public String toString() {
        return "Payment [PymentId=" + PymentId + ", orderId=" + orderId + ", amount=" + amount + ", receipt=" + receipt
                + ", status=" + status + ", user=" + user + ", paymentId=" + paymentId + "]";
    }
    
    
    


}
