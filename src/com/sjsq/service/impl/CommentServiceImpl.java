package com.sjsq.service.impl;

import com.sjsq.dao.CommentDao;
import com.sjsq.dao.impl.CommentDaoImpl;
import com.sjsq.po.Comment;
import com.sjsq.service.CommentService;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 17:22
 */
public class CommentServiceImpl implements CommentService {

    private CommentDao commentDao = new CommentDaoImpl();


    @Override
    public boolean addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public List<Comment> selectComment(Integer bookid) {
        return commentDao.selectComment(bookid);
    }
}
