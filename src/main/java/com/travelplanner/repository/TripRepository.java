package com.travelplanner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.travelplanner.entity.Trip;

public interface TripRepository extends JpaRepository<Trip, Integer> {

}
