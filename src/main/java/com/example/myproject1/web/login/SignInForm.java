package com.example.myproject1.web.login;

import com.example.myproject1.domain.member.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class SignInForm {

    public Member memberCreate(String userId, String password) {
        return new Member(userId, password);
    }
}
