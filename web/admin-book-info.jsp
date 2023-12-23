<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.po.Comment" %>
<%@ page import="com.sjsq.service.impl.CommentServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sjsq.service.CommentService" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="com.sjsq.service.BookService" %>

<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书详情</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        body {
            background-color: white;
        }

        a {
            text-align: center;
            text-decoration: none;
            font-size: 20px;
        }

        a:hover {
            text-decoration: underline;
            font-size: 20px;
        }

        #before {
            text-align: center;
        }

    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>


<h1>图书详情</h1>
<hr>
<div id="before">
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<%
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));
    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);

    // 获取留言
    CommentService commentService = new CommentServiceImpl();
    List<Comment> list = commentService.selectComment(bookid);


%>
<table align="center" cellpadding="20" cellspacing="0" >
    <tr style="font-size: 20px;bgcolor:#FFE4B5">
        <td>图书编号</td>
        <td>图书名称</td>
        <td>图书价格</td>
        <td>图书作者</td>
        <td>图书出版社</td>
    </tr>
    <tr bgcolor="#adff2f">
        <td><%=book.getBookid()%>
        </td>
        <td><%=book.getBookname()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td><%=book.getAuthor()%>
        </td>
        <td><%=book.getPublish()%>
        </td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
    </tr>
</table>
<div style="text-align:center;">
    <a href="admin-book-manager.jsp">图书列表</a>
    <%
        for(int i = 0;i<list.size();i++){
            Comment comment = list.get(i);
    %>

    <fieldset style="width:650px;margin: 0 auto;">
        <legend>留言<%=comment.getCommentid()%></legend>
        <div>
            用户：<%=comment.getUsername()%>    留言内容:<%=comment.getComment()%>    留言时间：<%=comment.getTime()%>
        </div>
    </fieldset>

    <%
        }
    %>
</div>
</body>
</html>
