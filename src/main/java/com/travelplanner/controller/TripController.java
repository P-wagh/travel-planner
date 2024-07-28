package com.travelplanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.travelplanner.entity.Trip;
import com.travelplanner.helper.Massege;
import com.travelplanner.service.TripService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TripController {

    @Autowired
    private TripService tripService;

    @GetMapping("/admin/addTripForm")
    public String addTripForm(){
        return "addTripForm";
    }

    @PostMapping("/admin/addTrip")
    public String addTrip(@ModelAttribute("Trip") Trip trip, HttpSession session){

        try {
            Trip t = tripService.saveTrip(trip);
            session.setAttribute("msg", new Massege("Trip added successfully.", "success"));
            session.setAttribute("trip", t);
            return "redirect:/admin/postRedirect";
        } catch (Exception e) {
            e.printStackTrace();

            session.setAttribute("msg", new Massege("Create new trip faild.!!", "danger"));

            return "redirect:/admin/addTripForm";
        }

    }
}
