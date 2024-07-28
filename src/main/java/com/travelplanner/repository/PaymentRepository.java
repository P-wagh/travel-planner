package com.travelplanner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.travelplanner.entity.Payment;


public interface PaymentRepository extends JpaRepository<Payment, Long> {

    public Payment findByOrderId(String orderId);
}
