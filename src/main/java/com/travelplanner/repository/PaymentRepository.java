package com.travelplanner.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.travelplanner.entity.Payment;

import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

    public Payment findByOrderId(String orderId);

    @Query(value = "SELECT * FROM payment WHERE user_user_id = :user_id AND status = :status", nativeQuery = true)
    public List<Payment> findByUser_user_id(@Param("user_id") int user_id, @Param("status") String status);
}
