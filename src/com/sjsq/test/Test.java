package com.sjsq.test;

import com.sjsq.dao.BookDao;
import com.sjsq.dao.impl.BookDaoImpl;
import com.sjsq.po.Book;
import com.sjsq.po.User;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2020/5/31 12:29
 */
public class Test {

    public static void main(String[] args){

       // testAddCard();
       // testGetCard();
       // testAddBook();
        testDeleteBook();
    }



    /**
     * 添加图书
     * @return
     */
    public static boolean testAddBook(){
        Book book=new Book();
        book.setBookname("1");
        Double price= Double.parseDouble("1");
        book.setPrice(price);
        book.setAuthor("1");
        book.setPublish("1");
        //引入数据交互层
        BookDao dao=new BookDaoImpl();
        boolean flag=dao.addBook(book);
        return flag;
    }

    /**
     * 删除图书
     * @return
     */
    public static boolean testDeleteBook(){

        Integer bookid=Integer.parseInt("7");
        //引入数据交互层
        BookDao dao=new BookDaoImpl();
        boolean flag=dao.deleteBook(bookid);
        return flag;
    }
}
