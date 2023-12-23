package com.sjsq.dao.impl;

import com.sjsq.dao.CommentDao;
import com.sjsq.po.Comment;
import com.sjsq.po.User;
import com.sjsq.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 17:21
 */
public class CommentDaoImpl implements CommentDao {
    @Override
    public boolean addComment(Comment comment) {
        String sql = "insert into comment values (0,?,?,?,?,?,now())";
        List<Object> list = new ArrayList<Object>();
        list.add(comment.getUserid());
        list.add(comment.getUsername());
        list.add(comment.getBookid());
        list.add(comment.getBookname());
        list.add(comment.getComment());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<Comment> selectComment(Integer bookid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            String sql = "select * from comment where bookid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,bookid);
            // 3.执行sql
            rs = ps.executeQuery();
            List<Comment> list = new ArrayList<>();
            while (rs.next()){
                Comment comment = new Comment();
                comment.setCommentid(rs.getInt("commentid"));
                comment.setUserid(rs.getInt("userid"));
                comment.setUsername(rs.getString("username"));
                comment.setBookid(rs.getInt("bookid"));
                comment.setBookname(rs.getString("bookname"));
                comment.setComment(rs.getString("comment"));
                comment.setTime(rs.getDate("time"));

                list.add(comment);
            }

            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // 关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }
}
