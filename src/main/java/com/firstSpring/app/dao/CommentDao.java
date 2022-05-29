package com.firstSpring.app.dao;

import com.firstSpring.app.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CommentDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.firstSpring.dao.boardMapper.";

    public int deleteAll(Integer bno) throws Exception {
        return session.delete(namespace + "deleteAll", bno);
    }

    public int count(int bno) throws Exception {
        return session.selectOne(namespace + "count", bno);
    }

    public int delete(Map map) throws Exception {
        return session.delete(namespace + "delete", map);
    }

    public int insert(CommentDto commentDto) throws Exception {
        return session.insert(namespace + "insert", commentDto);
    }

    public List<CommentDto> selectAll(int bno) throws Exception {
        return session.selectList(namespace + "selectAll", bno);
    }

    public CommentDto select(int cno) throws Exception {
        return session.selectOne(namespace + "select", cno);
    }

    public int update(CommentDto commentDto) throws Exception {
        return session.update(namespace + "update", commentDto);
    }
}
