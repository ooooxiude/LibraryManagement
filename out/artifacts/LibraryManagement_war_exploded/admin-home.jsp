<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员主页</title>
    <style type="text/css">

        body {
            background-color: white;
            text-align: center;
        }

    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>
<h1>欢迎来到图书管理系统</h1>

<hr>
<h4>管理员操作</h4>

    <a href="admin-user-manager.jsp">管理用户</a>
    <a href="admin-book-manager.jsp">管理图书</a>
</body>
</html>
