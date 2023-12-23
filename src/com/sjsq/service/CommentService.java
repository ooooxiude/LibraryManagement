package com.sjsq.service;

import com.sjsq.po.Comment;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 17:21
 */
public interface CommentService {
    /**
     * �������
     * @param comment
     * @return
     */
    public boolean addComment(Comment comment);

    /**
     * չʾ����
     * @param bookid
     * @return
     */
    public List<Comment> selectComment(Integer bookid);

}
