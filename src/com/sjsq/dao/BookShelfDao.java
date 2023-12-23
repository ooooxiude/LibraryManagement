package com.sjsq.dao;

import com.sjsq.po.BookShelf;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 12:23
 */
public interface BookShelfDao {


    /**
     * 按照用户名检索书架
     * @param userid
     * @return
     */
    public List<BookShelf> selectBookShelf(Integer userid);


    /**
     * 加入书架
     * @param bookShelf
     * @return
     */
    public boolean addBookShelf(BookShelf bookShelf);


    /**
     * 移出书架
     * @param userid
     * @param bookid
     * @return
     */
    public boolean removeBookShelf(Integer userid,Integer bookid);
}
