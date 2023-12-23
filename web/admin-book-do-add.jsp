<%@page import="com.sjsq.dao.BookDao" %>
<%@page import="com.sjsq.dao.impl.BookDaoImpl" %>
<%@page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.BookService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理新增图书</title>
    <style type="text/css">

    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    Book book = new Book();
    //获取admin_addbook.jsp页面提交的账号和密码
    String bookname = request.getParameter("bookname");
    Double price = Double.parseDouble(request.getParameter("price"));
    String author = request.getParameter("author");
    String publish = request.getParameter("publish");
    Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
    String booklink = request.getParameter("booklink");

    //获取admin-add-book.jsp页面提交的账号和密码设置到实体类User中
    book.setBookname(bookname);
    book.setPrice(price);
    book.setAuthor(author);
    book.setPublish(publish);
    book.setCategoryid(categoryid);
    book.setBooklink(booklink);

    System.out.println("添加的图书信息");
    System.out.println(book);

    //引入数据交互层
    BookService bookService = new BookServiceImpl();
    boolean flag = bookService.addBook(book);


    if (flag) {
        response.sendRedirect("admin-book-manager.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
