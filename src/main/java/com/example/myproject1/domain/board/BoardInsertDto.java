package com.example.myproject1.domain.board;

import lombok.Data;

@Data
public class BoardInsertDto {

    private String title;
    private String content;
    private String writer;
}
