package com.sjsq.dao;

import com.sjsq.po.Book;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2020/5/20 23:13
 * 图书信息接口
 */

public interface BookDao {

    /**
     * 查询图书信息
     * @param sql
     * @param arr
     * @return
     */
    public List<Book> select(String sql, Object[] arr);

    /**
     * 根据图书编号进行查询
     * @param bookid
     * @return
     */
    public Book getBook(Integer bookid);


    /**
     * 图书新增
     * @param book
     * @return
     */
    public boolean addBook(Book book);

    /**
     * 图书修改
     * @param book
     * @return
     */
    public boolean updateBook(Book book);

    /**
     * 删除图书
     * @param bookid
     * @return
     */
    public boolean deleteBook(Integer bookid);
}
