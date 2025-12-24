package com.gomonth.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gomonth.dto.PlaceDTO;
import com.gomonth.service.PlaceService;

import com.gomonth.dto.UserDTO;
import com.gomonth.service.UserService;

import jakarta.servlet.http.HttpSession; 

@Controller
public class MainController {
    @Autowired
    private PlaceService placeService;

    @Autowired
    private UserService userService;
    
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/spring")
    public String spring(Model model) {
        List<PlaceDTO> springPlaces = placeService.getPlacesBySeason("spring");
        model.addAttribute("springPlaces", springPlaces); 
        return "spring";
    }

    @GetMapping("/summer")
    public String summer(Model model) {
        List<PlaceDTO> summerPlaces = placeService.getPlacesBySeason("summer");
        model.addAttribute("summerPlaces", summerPlaces); 
        return "summer";
    }

    @GetMapping("/fall")
    public String fall(Model model) {
        List<PlaceDTO> fallPlaces = placeService.getPlacesBySeason("fall");
        model.addAttribute("fallPlaces", fallPlaces); 
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
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginProcess(@RequestParam("userId") String userId, 
                               @RequestParam("userPw") String userPw,
                               HttpSession session, 
                               Model model) {
    
        UserDTO user = userService.login(userId, userPw);

        if (user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:/"; 
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login";
        }
    }

    @GetMapping("/join")
    public String joinPage() {
        return "join";
    }

    @PostMapping("/join")
    public String joinProcess(UserDTO user) {
        if(user.getUserName() == null) user.setUserName(user.getUserId());
        
        userService.register(user);
        return "redirect:/login"; 
    }
}