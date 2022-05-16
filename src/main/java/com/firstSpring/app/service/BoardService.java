package com.firstSpring.app.service;

import com.firstSpring.app.dao.BoardDao;
import com.firstSpring.app.domain.BoardDto;
import com.firstSpring.app.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardDao dao;

    @Transactional
    public BoardDto viewBoard(int bno) throws Exception {
        dao.increaseViewCount(bno);
        return dao.select(bno);
    }

    public List<BoardDto> viewBoardList() throws Exception {
        return dao.selectAll();
    }

    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return dao.searchSelectPage(sc);
    }

    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return dao.searchResultCnt(sc);
    }

    public int clearBoard() throws Exception {
        return dao.deleteAll();
    }

    public int getCount() throws Exception {
        return dao.getCount();
    }

    public int deleteBoard(Map map) throws Exception {
        return dao.delete(map);
    }
}
