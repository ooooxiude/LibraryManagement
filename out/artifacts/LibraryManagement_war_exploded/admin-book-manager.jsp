<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看图书</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        body {
            background-color: white;
        }

        #before {
            text-align: center;
        }


    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%--图书信息--%>
<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    Book book = new Book();
    // 获取上一个页面传过来的值
    String bookname = request.getParameter("bookname");

    System.out.println("书名:"+bookname);
    // 传入的空字符串处理,null不能使用equals
    if(bookname!=null && bookname.equals("")){
        bookname = null;
    }

    BookServiceImpl service = new BookServiceImpl();
    List<Book> list = service.select(bookname);

%>
<h1>图书列表</h1>
<hr>
<div id="before">
    <form action="admin-book-manager.jsp" method="post">
        请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
        <input type="submit" value="查询"/>
    </form>
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<br>
<table align="center" cellspacing="0" align="center">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <th style="width: 120px">编号</th>
        <th style="width: 120px">书名</th>
        <th style="width: 120px">价格</th>
        <th style="width: 120px">作者</th>
        <th style="width: 120px">出版社</th>
        <th style="width: 120px">类型编号</th>
        <th style="width: 120px">书籍链接</th>
        <th style="width: 120px">到期日期</th>
        <th style="width: 120px">操作图书</th>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            Book b = list.get(i);
            if (i % 2 == 0) {
                bg = "azure";
            } else {
                bg = "white";
            }

    %>
    <tr bgcolor="<%=bg%>" style="width: 120px;height: 40px;text-align: center">
        <td><%=b.getBookid()%>
        </td>
        <td><a href="admin-book-info.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname()%>
        </a></td>
        <td><%=b.getPrice() %>
        </td>
        <td><%=b.getAuthor() %>
        </td>
        <td><%=b.getPublish() %>
        </td>
        <td><%=b.getCategoryid() %>
        </td>
        <td><%=b.getBooklink() %>
        </td>
        <td><%=b.getDeadline() %>
        </td>
        <td>
            <a href="admin-book-update.jsp?bookid=<%=b.getBookid()%>">修改</a>
            <a href="admin-book-delete.jsp?bookid=<%=b.getBookid()%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
<table align="center">
    <tr>
        <td><a href="admin-book-add.jsp">新增图书</a></td>
    </tr>
</table>

</body>
</html>
