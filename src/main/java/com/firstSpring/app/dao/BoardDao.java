package com.firstSpring.app.dao;

import com.firstSpring.app.domain.BoardDto;
import com.firstSpring.app.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardDao {
    @Autowired
    private SqlSession session;
    private String namespace = "com.firstSpring.dao.boardMapper.";

    public int insert(BoardDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    public BoardDto select(int bno) throws Exception {
        return session.selectOne(namespace + "select", bno);
    }

    public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchResultCnt", sc);
    }

    public List<BoardDto> selectAll() throws Exception {
        return session.selectList(namespace + "viewList");
    }

    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    public int getCount() throws Exception {
        return session.selectOne(namespace + "count");
    }

    public int delete(Map map) throws Exception {
        return session.delete(namespace + "delete", map);
    }
}
