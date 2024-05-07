package com.example.myproject1.domain.member;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class Member {
    private Long dbId;
    @NotBlank(message = "id : 빈칸일 수 없습니다!")
    private String userId;
    @NotBlank(message = "password : 빈칸일 수 없습니다!")
    private String password;

    public Member(String userId, String password) {
        this.userId = userId;
        this.password = password;
    }
}
