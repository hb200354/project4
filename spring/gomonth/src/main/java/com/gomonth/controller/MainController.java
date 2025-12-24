package com.gomonth.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gomonth.dto.FavoriteDTO;
import com.gomonth.dto.InquiriesDTO;
import com.gomonth.dto.PlaceDTO;
import com.gomonth.service.PlaceService;

import com.gomonth.dto.UserDTO;
import com.gomonth.service.UserService;

import com.gomonth.service.FavoriteService;

import com.gomonth.service.InquiriesService;

import jakarta.servlet.http.HttpSession; 

@Controller
public class MainController {
    @Autowired
    private PlaceService placeService;

    @Autowired
    private UserService userService;

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private InquiriesService service;
    
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
    public String detail(@RequestParam("id") String id, HttpSession session, Model model) {
        PlaceDTO place = placeService.getPlaceDetail(id); 
        model.addAttribute("place", place); 

        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        boolean isFavorite = false;

        if (loginUser != null) {
            isFavorite = favoriteService.checkFavoriteStatus(id, loginUser.getUserId());
        }

        model.addAttribute("isFavorite", isFavorite); 
        return "detail";
    }

    @GetMapping("/favorites")
    public String favoritesPage(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("loginUser");
        if (user == null) return "redirect:/login";

        List<FavoriteDTO> list = favoriteService.getMyFavorites(user.getUserId());
        model.addAttribute("favoritePlaces", list);
        return "favorites";
    }

    @PostMapping("/favorites/add")
    @ResponseBody
    public String addFav(@RequestParam("placeId") String placeId, HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("loginUser");
        if (user == null) return "fail";
        
        boolean ok = favoriteService.addFavorite(user.getUserId(), placeId);
        return ok ? "success" : "fail";
    }

    @PostMapping("/favorites/delete")
    @ResponseBody
    public String deleteFav(@RequestParam("placeId") String placeId, HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("loginUser");
        if (user == null) return "fail";

        boolean ok = favoriteService.removeFavorite(user.getUserId(), placeId);
        return ok ? "success" : "fail";
    }

    @GetMapping("/inquiry")
    public String inquiryPage(HttpSession session, Model d) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        if (loginUser == null) return "redirect:/login";

        List<InquiriesDTO> list;
        // [수정] 관리자(ADMIN)면 전체 목록, 일반 유저면 본인 목록만 조회
        if ("ADMIN".equals(loginUser.getRole())) {
            list = service.getAllInquiries(); 
        } else {
            list = service.getMyInquiries(loginUser.getUserId());
        }
        
        d.addAttribute("myInqList", list);
        return "inquiry"; 
    }

    // 사용자: 문의 등록
    @PostMapping("/inquiry/insert")
    public String insertInquiry(InquiriesDTO inq, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        if (loginUser != null) {
            inq.setUserId(loginUser.getUserId());
            service.registerInquiry(inq);
        }
        return "redirect:/inquiry";
    }

    // 사용자: 문의 수정
    @PostMapping("/inquiry/update")
    @ResponseBody
    public String updateInquiry(InquiriesDTO inq, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        if (loginUser == null) return "fail";
        
        inq.setUserId(loginUser.getUserId());
        return service.updateInquiry(inq) ? "success" : "fail";
    }

    // 사용자: 문의 삭제
    @PostMapping("/inquiry/delete")
    @ResponseBody
    public String deleteInquiry(@RequestParam("inqId") int inqId, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        if (loginUser == null) return "fail";
        return service.deleteInquiry(inqId, loginUser.getUserId()) ? "success" : "fail";
    }

    @PostMapping("/inquiry/answer")
    @ResponseBody
    public String answerInquiry(@RequestParam("inqId") int inqId, 
                                @RequestParam("reply") String reply, 
                                HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        // [보안] 관리자만 답변 가능하도록 체크
        if (loginUser != null && "ADMIN".equals(loginUser.getRole())) {
            return service.answer(inqId, reply) ? "success" : "fail";
        }
        return "no_auth";
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

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        
        return "redirect:/";
    }
}