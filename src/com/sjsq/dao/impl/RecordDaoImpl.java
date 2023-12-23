package com.sjsq.dao.impl;

import com.sjsq.dao.RecordDao;
import com.sjsq.po.Record;
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
 * @date 2021/5/22 22:18
 */
public class RecordDaoImpl implements RecordDao {


    @Override
    public List<Record> selectRecords() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Record> list = new ArrayList<>();
        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            String sql = "select * from record";
            ps = con.prepareStatement(sql);
            // 3.执行sql
            rs = ps.executeQuery();
            while (rs.next()){
                Record record = new Record();
                record.setBorrowid(rs.getInt("borrowid"));
                record.setUserid(rs.getInt("userid"));
                record.setBookid(rs.getInt("bookid"));
                record.setBookname(rs.getString("bookname"));
                record.setBooklink(rs.getString("booklink"));
                record.setBorrowtime(rs.getDate("borrowtime"));

                list.add(record);
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

    @Override
    public List<Record> selectRecord(Integer userid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Record> list = new ArrayList<>();
        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            String sql = "select * from record where userid=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,userid);
            // 3.执行sql
            rs = ps.executeQuery();
            while (rs.next()){
                Record record = new Record();
                record.setBorrowid(rs.getInt("borrowid"));
                record.setUserid(rs.getInt("userid"));
                record.setBookid(rs.getInt("bookid"));
                record.setBookname(rs.getString("bookname"));
                record.setBooklink(rs.getString("booklink"));
                record.setBorrowtime(rs.getDate("borrowtime"));

                list.add(record);
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

    @Override
    public boolean addRecord(Record record) {
        String sql = "insert into record values (0,?,?,?,?,now())";
        List<Object> list = new ArrayList<Object>();
        list.add(record.getUserid());
        list.add(record.getBookid());
        list.add(record.getBookname());
        list.add(record.getBooklink());


        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean deleteRecord(Integer borrowid) {
        String sql = "delete from record where borrowid=?";
        List<Object> list = new ArrayList<Object>();
        list.add(borrowid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }
}
