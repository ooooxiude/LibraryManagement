<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%
        // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort() + path + "/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>

    <style type="text/css">
        h1{
            text-align: center;
        }
        h4{
            text-align: center;color: blue;
        }
        body{
            background:white;
        }
        a{
            text-decoration: none;font-size: 20px;color: cornflowerblue;
        }
        a:hover{
            text-decoration: underline;font-size: 20px;color: blue;
        }
        .inputText{
            width: 200px;
            height: 30px;
            line-height: 20px;
            font-size: 20px;
            padding-left: 30px;
            border-radius: 50px;
            background-color: gainsboro;
            border: none;
        }
        .inputText:focus{
            outline: none;//设置所有的轮廓属性为none
            ackground-color: lightblue;
        }


    </style>
</head>
<body>
    <form action="login-do-info.jsp" method="post">
        <h1>用户登录</h1>
        <hr/>
        <table align="center">
            <tr>
                <td>账号：</td>
                <td><input type="text" name="username" id="username" placeholder="请输入您的账号" autofocus="autofocus" class="inputText"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password" id="password" placeholder="请输入您的密码" class="inputText"></td>
                <td><a href="search-password.jsp">找回密码</a></td>
            </tr>
            <tr>
                <td colspan="1">
                </td>
                <td>
                    <input type="submit" value="登录"/>
                    <input type="reset" value="重置"/>
                    <a href="register.jsp" target="_blank">注册</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
