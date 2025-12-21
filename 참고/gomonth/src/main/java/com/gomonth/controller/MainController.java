package com.gomonth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GomonthApplication {
    public static void main(String[] args) {
        SpringApplication.run(GomonthApplication.class, args);
    }
}

@Controller
public class MainController {

    /* =========================
       메인 / 소개
    ========================= */

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    /* =========================
       계절 페이지
    ========================= */

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

    /* =========================
       상세 페이지
    ========================= */

    @GetMapping("/detail")
    public String detail(@RequestParam("id") String id) {
        // id는 JSP에서 request.getParameter("id")로 사용
        return "detail";
    }

    /* =========================
       찜 / 문의
    ========================= */

    @GetMapping("/favorites")
    public String favorites() {
        return "favorites";
    }

    @GetMapping("/inquiry")
    public String inquiry() {
        return "inquiry";
    }

    /* =========================
       로그인 / 회원가입
    ========================= */

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/join")
    public String join() {
        return "join";
    }
}
