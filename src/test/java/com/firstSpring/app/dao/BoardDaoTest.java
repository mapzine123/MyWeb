package com.firstSpring.app.dao;

import com.firstSpring.app.domain.BoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class BoardDaoTest {

    @Autowired
    public BoardDao dao;

    @Test
    public void test() {
        int cnt = 0;
        for(int i = 0; i < 50; i++) {
            BoardDto dto = new BoardDto("hi" + i, "hello world" + i, "its me" + i);
            dao.insert(dto);
            cnt++;
        }
        assertTrue(cnt == 50);
    }
}

