package web.com.springweb.z01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

    // ======================
    // 로그인 화면
    // ======================
    @GetMapping("/login")
    public String loginForm() {
        return "login";  // /WEB-INF/views/login.jsp
    }

    // 로그인 처리
    @PostMapping("/loginProc")
    public String loginProc(@RequestParam("id") String id,
                            @RequestParam("pw") String pw) {

        System.out.println("로그인 ID: " + id);
        System.out.println("로그인 PW: " + pw);

        return "redirect:/login";
    }


    // ======================
    // 회원가입 화면
    // ======================
    @GetMapping("/join")
    public String joinForm() {
        return "join";   // /WEB-INF/views/join.jsp
    }

    // 회원가입 처리
    @PostMapping("/joinProc")
    public String joinProc(@RequestParam("id") String id,
                           @RequestParam("pw") String pw,
                           @RequestParam("name") String name,
                           @RequestParam("email") String email) {

        System.out.println("회원가입 ID: " + id);
        System.out.println("회원가입 PW: " + pw);
        System.out.println("회원가입 NAME: " + name);
        System.out.println("회원가입 EMAIL: " + email);

        return "redirect:/login";
    }


    // ======================
    // fall 페이지
    // ======================
    @GetMapping("/fall")
    public String fall() {
        return "fall";   // /WEB-INF/views/fall.jsp
    }

}
//http://localhost:5050/login
//http://localhost:5050/join
//http://localhost:5050/fall
