package com.example.myproject1.web.controller;

import com.example.myproject1.domain.member.Member;
import com.example.myproject1.mapper.LoginMapper;
import com.example.myproject1.web.login.session.SessionConst;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {
    private final LoginMapper mapper;

    @GetMapping("/")
    public String index() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginForm(Member member, Model model) {
        model.addAttribute("member", member);
        return "login/loginForm";
    }

    @PostMapping("/login/login")
    public String login(String userId, String password,
                        HttpServletRequest request, RedirectAttributes rttr){
        Member findedMember = mapper.loginCheckDb(userId, password);

        if(findedMember.getUserId().equals(userId) &&
                findedMember.getPassword().equals(password)){
            request.getSession().setAttribute(SessionConst.LOGIN_MEMBER,findedMember);
            rttr.addFlashAttribute(findedMember);
        return "redirect:/login/getCookie";
        }

        log.info("시스템정보 불일치 id={},pw={}", userId, password);
        return null;
    }

    @GetMapping("/login/getCookie")
    public String createCookie(Member member, HttpServletResponse response) {
//        System.out.println("createCookie Part member = " + member);
        Cookie idCookie = new Cookie("memberId", member.getUserId());
//        System.out.println("idCookie = " + idCookie);
        response.addCookie(idCookie);
        return "login/loginHome";
    }

    @GetMapping("/login/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(SessionConst.LOGIN_MEMBER);
        session.invalidate();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if(cookie != null && cookie.getName().equals(SessionConst.LOGIN_MEMBER)){
                cookie.setMaxAge(0);
            }
            response.addCookie(cookie);
        }
        return "redirect:/";
    }

    }

