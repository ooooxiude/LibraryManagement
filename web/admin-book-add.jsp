<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增图书</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        h4 {
            text-align: center;
            color: red;
        }

        body {
            background-color: white;
        }

        div {
            text-align: center;
        }

        #before {
            text-align: center;
        }

    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<h1>新增图书</h1>
<hr>

<div id="before">
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
</br>

<form action="admin-book-do-add.jsp" method="post" name="registerForm">
    <div>
        <tr>
            <label>图书名称：</label>
            <input type="text" name="bookname" id="bookname" placeholder="图书名称" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书价格：</label></td>
            <input type="text" name="price" id="price" placeholder="图书价格(数字)">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书作者：</label>
            <input type="text" name="author" id="author" placeholder="图书作者">
        </tr>
    </div>
    <div>
        <tr>
            <label>出版公司：</label>
            <input type="text" name="publish" id="publish" placeholder="出版公司">
        </tr>
    </div>
    <div>
        <tr>
            <label>类型编号：</label>
            <input type="text" name="categoryid" id="categoryid" placeholder="类型编号">
        </tr>
    </div>
    <div>
        <tr>
            <label>书籍链接：</label>
            <input type="text" name="booklink" id="booklink" placeholder="书籍链接">
        </tr>
    </div>

    <div id="submitbtn">
        <tr>
            <button type="submit" onclick="return checkForm()">添加</button>
            <button type="reset">重置</button>

        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {
        var bookname = registerForm.bookname.value;
        var price = registerForm.price.value;
        if (bookname == "" || bookname == null) {
            alert("请输入图书名称");
            registerForm.bookname.focus();
            return false;
        } else if (price == "" || price == null) {
            alert("请输入图书价格");
            registerForm.price.focus();
            return false;
        }
        alert('添加成功！');
        return true;
    }
</script>
</body>
</html>