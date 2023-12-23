package com.sjsq.dao;

import com.sjsq.po.BookShelf;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 12:23
 */
public interface BookShelfDao {


    /**
     * �����û����������
     * @param userid
     * @return
     */
    public List<BookShelf> selectBookShelf(Integer userid);


    /**
     * �������
     * @param bookShelf
     * @return
     */
    public boolean addBookShelf(BookShelf bookShelf);


    /**
     * �Ƴ����
     * @param userid
     * @param bookid
     * @return
     */
    public boolean removeBookShelf(Integer userid,Integer bookid);
}
