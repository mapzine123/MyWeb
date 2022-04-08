package com.firstSpring.app.dao;

import com.firstSpring.app.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class UserDaoTest {

    @Autowired
    private UserDao dao;

    @Test
    public void select() throws Exception {
        UserDto selectDto = new UserDto("name1", "1asdf", "mapzine1@naver.com");
        UserDto dto = dao.select(selectDto);
        System.out.println("dto = " + dto);
        assertTrue(dto != null);
    }

    @Test
    public void selectCount() throws Exception {
        int cnt = dao.selectCount();
        assertTrue(cnt == 50);
    }

    @Test
    public void insert() throws Exception {
        int rowCnt = 0;
        for(int i = 0; i < 50; i++) {
            UserDto dto = new UserDto("name" + i, i + "asdf", "mapzine" + i + "@naver.com", "name" + i);
            dao.insert(dto);
            rowCnt++;
        }
        assertTrue(rowCnt == 50);
    }
}