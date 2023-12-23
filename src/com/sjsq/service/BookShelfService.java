package com.sjsq.service;

import com.sjsq.po.BookShelf;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 12:36
 */
public interface BookShelfService {

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
