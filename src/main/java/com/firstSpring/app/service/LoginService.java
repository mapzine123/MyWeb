package com.firstSpring.app.service;

import com.firstSpring.app.dao.UserDao;
import com.firstSpring.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private UserDao dao;

    public int register(UserDto dto) throws Exception {
        int rowCnt = dao.insert(dto);
        return rowCnt;
    }

    public int secession(UserDto dto) throws Exception {
        int rowCnt = dao.delete(dto);
        return rowCnt;
    }

    public int userCount() throws Exception {
        return dao.selectCount();
    }

    public UserDto searchUser(UserDto dto) throws Exception {
        return dao.select(dto);
    }

    public UserDto loginUser(UserDto dto) throws Exception {
        return dao.login(dto);
    }
}
