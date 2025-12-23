package com.gomonth.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gomonth.dto.PlaceDTO;
import com.gomonth.service.PlaceService; 

@Controller
public class MainController {
    @Autowired
    private PlaceService placeService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/spring")
    public String spring() {
        return "spring";
    }

    @GetMapping("/summer")
    public String summer(Model model) {
        List<PlaceDTO> summerPlaces = placeService.getPlacesBySeason("summer");
        model.addAttribute("summerPlaces", summerPlaces); 
        return "summer";
    }

    @GetMapping("/fall")
    public String fall() {
        return "fall";
    }

    @GetMapping("/winter")
    public String winter(Model model) {
        List<PlaceDTO> winterPlaces = placeService.getPlacesBySeason("winter");
        model.addAttribute("winterPlaces", winterPlaces); 
        return "winter";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") String id, Model model) {
        PlaceDTO place = placeService.getPlaceDetail(id); 
        model.addAttribute("place", place); 
        return "detail";
    }

    @GetMapping("/favorites")
    public String favorites() {
        return "favorites";
    }

    @GetMapping("/inquiry")
    public String inquiry() {
        return "inquiry";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/join")
    public String join() {
        return "join";
    }
}