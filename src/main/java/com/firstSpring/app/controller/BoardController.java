package com.firstSpring.app.controller;

import com.firstSpring.app.domain.BoardDto;
import com.firstSpring.app.domain.PageHandler;
import com.firstSpring.app.domain.SearchCondition;
import com.firstSpring.app.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/boardList")
    public String openBoard(SearchCondition sc, Model m) {
        try {
            int totalCnt = boardService.getSearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<BoardDto> list = boardService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("totalCnt", totalCnt);
            m.addAttribute("ph", pageHandler);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "boardList";
    }

    @GetMapping("/board")
    public String viewBoard(int bno, Model m) {
        try {
            BoardDto boardDto = boardService.viewBoard(bno);
            m.addAttribute("boardDto", boardDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board";
    }
}
