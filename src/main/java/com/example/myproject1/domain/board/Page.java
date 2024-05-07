package com.example.myproject1.domain.board;

import lombok.Data;

@Data
public class Page {
    private int pageNo;
    private int firstPage;
    private int lastPage;
    private int totalPage;
    private int offset;
}
