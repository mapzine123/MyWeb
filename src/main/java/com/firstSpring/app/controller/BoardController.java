package com.firstSpring.app.controller;

import com.firstSpring.app.domain.BoardDto;
import com.firstSpring.app.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/boardList")
    public String openBoard(Model m) {


        try {
            List<BoardDto> list = boardService.viewBoardList();
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "boardList";
    }
}
