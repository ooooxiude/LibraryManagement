package com.sjsq.service.impl;

import com.sjsq.dao.BookShelfDao;
import com.sjsq.dao.impl.BookShelfDaoImpl;
import com.sjsq.po.BookShelf;
import com.sjsq.service.BookShelfService;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 12:36
 */
public class BookShelfServiceImpl implements BookShelfService {

    private BookShelfDao bookShelfDao = new BookShelfDaoImpl();

    @Override
    public List<BookShelf> selectBookShelf(Integer userid) {
        return bookShelfDao.selectBookShelf(userid);
    }

    @Override
    public boolean addBookShelf(BookShelf bookShelf) {
        return bookShelfDao.addBookShelf(bookShelf);
    }

    @Override
    public boolean removeBookShelf(Integer userid, Integer bookid) {
        return bookShelfDao.removeBookShelf(userid,bookid);
    }
}
