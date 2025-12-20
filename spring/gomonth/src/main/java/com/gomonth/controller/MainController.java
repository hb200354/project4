package com.gomonth.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

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
    public String summer() {
        return "summer";
    }

    @GetMapping("/fall")
    public String fall() {
        return "fall";
    }

    @GetMapping("/winter")
    public String winter() {
        return "winter";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") String id) {
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
