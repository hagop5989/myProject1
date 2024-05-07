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
        System.out.println("board = " + board);
        System.out.println("dto = " + dto);

        mapper.insertBoard(dto);
        return "redirect:/board/boards";
    }

    @GetMapping("/boards")
    public String boards(Board board,Model model) {
        List<Board> boardList = mapper.findAll();
        model.addAttribute("boards", boardList);
        model.addAttribute("board", board);
        return "board/boards";
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

}
