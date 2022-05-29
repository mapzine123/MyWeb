package com.firstSpring.app.service;

import com.firstSpring.app.dao.BoardDao;
import com.firstSpring.app.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentService {
    @Autowired
    private BoardDao boardDao;
    @Autowired
    private CommentDao commentDao;

    public int getCount(Integer bno) throws Exception {
        return commentDao.count(bno);
    }

    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String comment) throws Exception
        return null;
    }
}
