package com.example.myproject1.web.controller;

import com.example.myproject1.domain.board.Board;
import com.example.myproject1.domain.board.BoardInsertDto;
import com.example.myproject1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardMapper mapper;

    @GetMapping("/insert")
    public String insert(Board board) {
        return "board/boardInsert";
    }

    @PostMapping("/insert")
    public String insertBoard(Board board, BoardInsertDto dto, Model model) {
        mapper.insertBoard(dto);
        return "redirect:/board/boards";
    }



    @GetMapping("/boardDetail")
    public String boardDetail(@RequestParam("boardId") String boardId, Model model) {
        Board findedBoard = mapper.findById(boardId);
        model.addAttribute("board", findedBoard);
        return "board/boardDetail";
    }

    @PostMapping("/update")
    public String boardUpdate(Board updateBoard,Model model) {
        Long updateId = updateBoard.getBoardId();
        mapper.update(updateBoard,updateId);

        return "redirect:/board/boardDetail?boardId=" + updateBoard.getBoardId();
    }

    @PostMapping("/delete")
    public String boardDelete(@RequestParam("boardId") String boardId, Model model) {
        mapper.delete(boardId);
        return "redirect:/board/boards";
    }

    @GetMapping("/boards")
    public String boards(@RequestParam(defaultValue = "1") Integer page, Board board,Model model) {


        // 페이징 시작.
        int sizeNum = mapper.count();

        // 페이지 보여주기
        int offset = page * 10;


        // 기본값 설정
        int firstPg = 1;
        int lastPg = 1;
        int nxtPg = 1;
        int prvPg = 1;

        // page 로직
        if (page - 4 > 0) {
            firstPg = page - 4;
            lastPg = page + 5;
        } else {
            firstPg = 1;
            lastPg = page + 5;
        }
        if (lastPg > sizeNum) {
            lastPg = sizeNum;
            firstPg = lastPg - 10;
        } else if (firstPg == 1) {
            lastPg = 10;
        }

        // prvPg 로직
        if (firstPg > 10) {
            prvPg = firstPg - 6;
        } else {
            prvPg = 1;
        }

        // nxtPg 로직
        if (firstPg >= sizeNum - 10) {
            nxtPg = sizeNum - 5;
        } else if (sizeNum > nxtPg) {
            nxtPg = page + 10;
        }

//        System.out.println("firstPg = " + firstPg);
//        System.out.println("lastPg = " + lastPg);
//        System.out.println("prvPg = " + prvPg);
//        System.out.println("nxtPg = " + nxtPg);
//        System.out.println("offset = " + offset);
//        System.out.println("nowPage = " + page);
//        System.out.println("sizeNum = " + sizeNum);

        model.addAttribute("prvPg", prvPg);
        model.addAttribute("nxtPg", nxtPg);
        model.addAttribute("nowPage", page);
        model.addAttribute("sizeNum", sizeNum);

        model.addAttribute("firstPg", firstPg);
        model.addAttribute("lastPg", lastPg);
        model.addAttribute("offset", offset);

        // 리스트 보여주기
//        List<Board> boardList = mapper.findAll();
        List<Board> pagedBoards = mapper.pagingSelect(offset);
        model.addAttribute("boards", pagedBoards);
        model.addAttribute("board", board);
        return "board/boards";
    }


}
