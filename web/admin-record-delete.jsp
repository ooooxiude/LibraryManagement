<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.sjsq.po.User" %>
<%@ page import="com.sjsq.service.UserService" %>
<%@ page import="com.sjsq.service.impl.UserServiceImpl" %>
<%@ page import="com.sjsq.service.RecordService" %>
<%@ page import="com.sjsq.service.impl.RecordServiceImpl" %>
<html>
<head>
    <title>删除记录</title>
    <style type="text/css">
        #before {
            text-align: center;
        }

        body {
            background-color: white;
        }


    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    //获取admin-user-manager.jsp页面的userid
    Integer borrowid = Integer.parseInt(request.getParameter("borrowid"));


    //引入数据交互层
    RecordService recordService = new RecordServiceImpl();
    boolean flag = recordService.deleteRecord(borrowid);

    if (flag) {
        response.sendRedirect("admin-record.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
