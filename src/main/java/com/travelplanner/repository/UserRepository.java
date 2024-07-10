package com.travelplanner.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.travelplanner.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    // public User findByUser_email(String user_email);
}
