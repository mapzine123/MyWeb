package com.firstSpring.app.dao;

import com.firstSpring.app.domain.BoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
    @Autowired
    private SqlSession session;
    private String namespace = "com.firstSpring.dao.boardMapper.";

    public int insert(BoardDto dto) {
        return session.insert(namespace + "write", dto);
    }

    public BoardDto select(int bno) {
        return session.selectOne(namespace + "view", bno);
    }
}
