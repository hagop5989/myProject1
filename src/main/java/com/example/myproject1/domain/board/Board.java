package com.example.myproject1.domain.board;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class Board {

    private Long boardId;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime inserted;


}
