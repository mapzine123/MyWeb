package com.firstSpring.app.service;

import com.firstSpring.app.dao.BoardDao;
import com.firstSpring.app.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardDao dao;

    public BoardDto viewBoard(int bno) throws Exception {
        return dao.select(bno);
    }

    public List<BoardDto> viewBoardList() throws Exception {
        return dao.selectAll();
    }
}
