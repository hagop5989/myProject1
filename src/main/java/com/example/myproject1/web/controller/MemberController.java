package com.example.myproject1.web.controller;

import com.example.myproject1.domain.member.Member;
import com.example.myproject1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberMapper mapper;

    @PostMapping("/insert")
    public String insert(Member member, BindingResult bindingResult, RedirectAttributes rttr) {
        int rowCount = mapper.insert(member);
        if (bindingResult.hasErrors()){
            return "/member/members";
        }
        rttr.addFlashAttribute("message", rowCount + " 명 입력됨!");
        return "redirect:/member/members";
    }

    @GetMapping("/select")
    public String select(String search,Model model, RedirectAttributes rttr) {
        Member selectedMember = mapper.select(search);
        model.addAttribute("selected", selectedMember);
        model.addAttribute("prevName", selectedMember.getUserId());
        rttr.addFlashAttribute("selected", selectedMember);
        rttr.addFlashAttribute("message", selectedMember.getUserId() + "님 선택됨!");
        return "redirect:/member/members";
    }

    @PostMapping("/update")
    public String memberUpdate(@Validated @ModelAttribute Member member, BindingResult bindingResult, String prevName, RedirectAttributes rttr) {
        if (bindingResult.hasErrors()){
            return "/member/members";
        }
        int rowCount = mapper.update(member,prevName);
        rttr.addFlashAttribute("message", rowCount + " 명 수정됨!");
        return "redirect:/member/members";
    }

    @PostMapping("/delete")
    public String delete12(Member member, RedirectAttributes rttr) {
        int rowCount = mapper.delete(member);
        rttr.addFlashAttribute("message", rowCount + " 명 삭제됨! 이름: " + member.getUserId());
        return "redirect:/member/members";
    }


    @GetMapping("/members")
    public String Members (Model model, Member selected) {
        List<Member> memberList = mapper.findAllMembers();
        model.addAttribute("members", memberList);
        model.addAttribute("member",selected);
        System.out.println("memberList = " + memberList);
        System.out.println("selected = " + selected);
//        memberList.stream().forEach(System.out::println);
        return "member/members";
    }
}
