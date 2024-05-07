package com.example.myproject1.web.controller;

import com.example.myproject1.domain.board.Page;
import com.example.myproject1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class PagingController {
    private final BoardMapper mapper;

    void paging(@RequestParam(defaultValue = "1") Integer page,Model model) {
        int count = mapper.count();
        int selectedPage = 1;
        int offset = (int)(count / 10) + 1 ;
        int first = selectedPage - 4;
        int last = selectedPage + 5;
        model.addAttribute("count", count);
        model.addAttribute("selectedPage", selectedPage);
        model.addAttribute("first", first);
        model.addAttribute("last", last);
        model.addAttribute("offset", offset);


//        // 페이지 보여주기
//        int offset = (page - 1) * 10;
//        String sql = """
//                SELECT *
//                FROM Employees
//                ORDER BY EmployeeID
//                LIMIT ?, 10
//                """;
//
//        var list = new ArrayList<MyBean258Employee>();
//
//        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.setInt(1, offset);
//        ResultSet rs = ps.executeQuery();
//
//        try (rs; ps; conn) {
//            while (rs.next()) {
//                MyBean258Employee employee = new MyBean258Employee();
//
//                employee.setId(rs.getInt(1));
//                employee.setLastName(rs.getString(2));
//                employee.setFirstName(rs.getString(3));
//                employee.setNotes(rs.getString(4));
//                employee.setPhoto(rs.getString(5));
//                employee.setBirthDate(rs.getString(6));
//
//                list.add(employee);
//            }
//            model.addAttribute("employees", list);
//        }
//        // 기본값 설정
//        int firstPg = 1;
//        int lastPg = 1;
//        int nxtPg = 1;
//        int prvPg = 1;
//
//        // page 로직
//        if (page - 4 > 0) {
//            firstPg = page - 4;
//            lastPg = page + 5;
//        } else {
//            firstPg = 1;
//            lastPg = page + 5;
//        }
//        if (lastPg > sizeNum) {
//            lastPg = sizeNum;
//            firstPg = lastPg - 10;
//        } else if (firstPg == 1) {
//            lastPg = 10;
//        }
//
//        // prvPg 로직
//        if (firstPg > 10) {
//            prvPg = firstPg - 6;
//        } else {
//            prvPg = 1;
//        }
//
//        // nxtPg 로직
//        if (firstPg >= sizeNum - 10) {
//            nxtPg = sizeNum - 5;
//        } else if (sizeNum > nxtPg) {
//            nxtPg = page + 10;
//        }
//
//        model.addAttribute("firstPg", firstPg);
//        model.addAttribute("lastPg", lastPg);
//        model.addAttribute("prvPg", prvPg);
//        model.addAttribute("nxtPg", nxtPg);
//        model.addAttribute("nowPage", page);
//
//



    }

}
