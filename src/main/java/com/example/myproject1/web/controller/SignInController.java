package com.example.myproject1.web.controller;

import com.example.myproject1.domain.member.Member;
import com.example.myproject1.mapper.SignInMapper;
import com.example.myproject1.web.login.SignInForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SignInController {
    private final SignInForm signInForm;
    private final SignInMapper mapper;

    @PostMapping("/login/signIn")
    public String signIn(@Validated @ModelAttribute("member") Member newMember,
                         BindingResult bindingResult, Model model) {
            model.addAttribute("member", newMember);
        if(bindingResult.hasErrors()) {
            System.out.println("가입 오류 발생");
//            rttr.addFlashAttribute(bindingResult);
//            return "redirect:/login";
            return "login/loginForm";
        }
        System.out.println("newMember = " + newMember);
        int rowCount = mapper.insertMemberToDb(newMember);
//        signInForm.memberCreate(user_id,password);
        System.out.println("생성된 Id 개수 = " + rowCount);
        return "redirect:/login";
    }
}
