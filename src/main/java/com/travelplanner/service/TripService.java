package com.travelplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelplanner.entity.Trip;
import com.travelplanner.repository.TripRepository;

@Service
public class TripService {

    @Autowired
    private TripRepository tripRepository;

    public Trip saveTrip(Trip trip){
        return tripRepository.save(trip);
    }

    public int getCountOfTrip(){
        return (int) tripRepository.count();
    }

    public List<Trip> getAllTrips() {
        return tripRepository.findAll();
    }
}
