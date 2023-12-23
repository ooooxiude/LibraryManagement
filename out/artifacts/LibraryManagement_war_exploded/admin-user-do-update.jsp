<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="com.sjsq.dao.BookDao" %>
<%@page import="com.sjsq.dao.impl.BookDaoImpl" %>
<%@page import="com.sjsq.po.Book" %>
<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %>
<%@ page import="com.sjsq.service.UserService" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理修改用户</title>
    <style type="text/css">

    </style>
</head>
<body>


<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    //获取admin-add-update.jsp页面提交的账号和密码
    Integer userid = Integer.parseInt(request.getParameter("userid"));
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String isadmin = request.getParameter("isadmin");

    User user = new User();
    user.setUserid(userid);
    user.setPassword(password);
    user.setEmail(email);
    user.setPhone(phone);
    user.setIsadmin(Integer.parseInt(isadmin));

    //引入数据交互层
    UserService userService = new UserServiceImpl();


    System.out.println("修改的用户信息："+user);

    boolean flag = userService.updateUser(user);


    if (flag) {
        response.sendRedirect("admin-user-manager.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
