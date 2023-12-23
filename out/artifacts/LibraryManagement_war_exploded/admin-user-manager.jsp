<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看用户</title>
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
        div {
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
    String username = request.getParameter("username");

    System.out.println("用户名:" + username);
    // 传入的空字符串处理,null不能使用equals
    if (username != null && username.equals("")) {
        username = null;
    }

    UserService userService = new UserServiceImpl();
    List<User> list = userService.selectUser(username);

%>
<h1>用户列表</h1>
<hr>
<div id="before">
    <form action="admin-user-manager.jsp" method="post">
        请输入用户名：<input type="text" name="username" placeholder="输入用户名搜索">
        <input type="submit" value="查询"/>
    </form>
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<br>
<table align="center" cellspacing="0" >
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <th style="width: 120px">编号</th>
        <th style="width: 120px">用户名</th>
        <th style="width: 120px">密码</th>
        <th style="width: 120px">邮箱</th>
        <th style="width: 120px">电话</th>
        <th style="width: 120px">是否管理员</th>
        <th style="width: 120px">操作用户</th>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            User u = list.get(i);
            if (i % 2 == 0) {
                bg = "azure";
            } else {
                bg = "white";
            }

    %>
    <tr bgcolor="<%=bg%>" style="width: 120px;height: 40px;text-align: center">
        <td><%=u.getUserid()%>
        </td>
        <td><%=u.getUsername()%>
        </td>
        <td><%=u.getPassword()%>
        </td>
        <td><%=u.getEmail()%>
        </td>
        <td><%=u.getPhone() %>
        </td>
        <td><%=u.getIsadmin() %>
        </td>
        <td>
            <a href="admin-user-update.jsp?userid=<%=u.getUserid()%>">修改</a>
            <a href="admin-user-delete.jsp?userid=<%=u.getUserid()%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
<table align="center">
    <tr>
        <td><a href="admin-user-add.jsp">新增用户</a></td>
    </tr>
</table>

</body>
</html>
