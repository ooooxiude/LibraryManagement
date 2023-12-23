<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="com.sjsq.dao.BookDao" %>
<%@page import="com.sjsq.dao.impl.BookDaoImpl" %>
<%@page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理修改图书</title>
    <style type="text/css">

    </style>
</head>
<body>


<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    //获取admin-add-book.jsp页面提交的账号和密码
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));

    String bookname = request.getParameter("bookname");
    Double price = Double.parseDouble(request.getParameter("price"));
    String author = request.getParameter("author");
    String publish = request.getParameter("publish");
    Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
    String booklink = request.getParameter("booklink");

    //引入数据交互层
    BookService bookService = new BookServiceImpl();
    Book book = new Book();
    book = bookService.getBook(bookid);

    book.setBookname(bookname);
    book.setPrice(price);
    book.setAuthor(author);
    book.setPublish(publish);
    book.setCategoryid(categoryid);
    book.setBooklink(booklink);

    System.out.println("修改的图书信息");
    System.out.println(book);

    boolean flag = bookService.updateBook(book);


    if (flag) {
        response.sendRedirect("admin-book-manager.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
