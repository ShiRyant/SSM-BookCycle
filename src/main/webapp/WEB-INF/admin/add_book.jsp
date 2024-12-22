<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px; /* 设置容器宽度 */
        }
        .login-container h2 {
            text-align: center;
        }
        .form-style {
            display: flex;
            flex-direction: column;
            gap: 10px; /* 设置元素之间的间距 */
        }
        input[type="text"] {
            padding: 15px; /* 增加内边距 */
            margin: 0; /* 移除外边距 */
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }
        button {
            padding: 15px; /* 增加内边距 */
            border: none;
            border-radius: 5px;background-image:linear-gradient(0deg,#accbee 0%, #e7f0fd 100%);
            color: white;
            cursor: pointer;
            width: 100%; /* 设置提交按钮宽度为100% */
        }
    </style>
</head>
<body style="margin: 0">

    <div class="login-container">
        <h2>添加书籍</h2>
        <s:form id="book-form" action="adminAction-addBook" namespace="/" method="post" enctype="multipart/form-data" cssClass="form-style">
            <input type="text" name="book.title" placeholder="书籍名称" required>
            <input type="text" name="book.author" placeholder="作者" required>
            <input type="text" name="book.publisher" placeholder="出版社" required>
            <input type="text" name="book.category" placeholder="分类" required>
            <input type="text" name="book.description" placeholder="书籍描述" required>
            <input type="text" name="book.isbn" placeholder="ISBN" required>
            <input type="text" name="book.price" placeholder="定价" required>
            书籍封面(请上传jpg格式)：<input type="file" name="img">
            <s:actionerror cssStyle="padding-left: 20px"/>
            <button type="submit">添加书籍</button>
        </s:form>
    </div>
<script>
    // 监听表单提交事件
    function confirmSubmission(event) {
        // 弹出确认对话框
        const userConfirmed = confirm("您确定要添加这本书籍吗？");
        // 如果点击“取消”，阻止表单提交
        if (!userConfirmed) {
            event.preventDefault(); // 阻止默认的提交行为
        }
    }

    // 添加事件监听器
    window.onload = function () {
        const form = document.getElementById("book-form");
        form.addEventListener("submit", confirmSubmission);
    };
</script>
</body>
</html>
