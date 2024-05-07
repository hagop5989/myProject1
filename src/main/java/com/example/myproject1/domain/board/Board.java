package com.example.myproject1.domain.board;

import lombok.*;

import java.time.LocalDate;

@Data
public class Board {

    private Long boardId;
    private String title;
    private String content;
    private String writer;
    private LocalDate inserted;


}
