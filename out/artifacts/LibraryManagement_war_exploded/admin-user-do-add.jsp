<%@page import="com.sjsq.dao.BookDao" %>
<%@page import="com.sjsq.dao.impl.BookDaoImpl" %>
<%@page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理新增用户</title>
    <style type="text/css">

    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    User user = new User();
    //获取admin-user-add.jsp页面提交的账号和密码
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String isadmin = request.getParameter("isadmin");

    //获取admin-user-add.jsp页面提交的账号和密码设置到实体类User中
    user.setUsername(username);
    user.setPassword(password);
    user.setEmail(email);
    user.setPhone(phone);
    user.setIsadmin(Integer.parseInt(isadmin));

    System.out.println("添加的用户信息:"+user);


    //引入数据交互层
    UserService userService = new UserServiceImpl();
    boolean flag = userService.addUser(user);


    if (flag) {
        response.sendRedirect("admin-user-manager.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
