package com.firstSpring.app.dao;

import com.firstSpring.app.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
    @Autowired
    private SqlSession session;
    private String namespace = "com.firstSpring.dao.userMapper.";


    public UserDto login(UserDto dto) throws Exception {
        return session.selectOne(namespace + "login", dto);
    }

    public UserDto select(UserDto dto) throws Exception {
        return session.selectOne(namespace + "select", dto);
    }

    public Integer selectCount() throws Exception {
        return session.selectOne(namespace + "count");
    }

    public int insert(UserDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    public int delete(UserDto dto) throws Exception {
        return session.delete(namespace + "delete", dto);
    }
}
