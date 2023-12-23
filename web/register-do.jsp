<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@page import="com.sjsq.dao.impl.UserDaoImpl"%>
<%@page import="com.sjsq.dao.UserDao"%>
<%@page import="com.sjsq.po.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理注册</title>
</head>
<body>
    <%
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");
        User user=new User();
        //获取register.jsp页面提交的账号和密码
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");

        //获取register.jsp页面提交的账号和密码设置到实体类User中
        user.setUsername(name);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);

        //引入数据交互层
        UserDao dao=new UserDaoImpl();
        boolean flag=dao.register(user);

        if(flag){
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("register.jsp");
        }
    %>
</body>
</html>
