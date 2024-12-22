<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录-BookCycle</title>
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
            width: 300px; /* 设置容器宽度 */
        }
        .login-container h2 {
            text-align: center;
        }
        .form-style {
            display: flex;
            flex-direction: column;
            gap: 10px; /* 设置元素之间的间距 */
        }
        .input-style {
            padding: 15px; /* 增加内边距 */
            margin: 0; /* 移除外边距 */
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 90%;
        }
        .button-style {
            padding: 15px; /* 增加内边距 */
            border: none;
            border-radius: 5px;
            background-color: #5cb85c;
            color: white;
            cursor: pointer;
            width: 100%; /* 设置提交按钮宽度为100% */
        }
        .button-style:hover {
            background-color: #4cae4c;
        }
        .register-link {
            margin-top: 15px; /* 增加上边距 */
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>登录</h2>
    <s:form action="userAction-userLogin" method="post" namespace="/" cssClass="form-style">
        <s:textfield name="username" cssClass="input-style" placeholder="用户名" required="true"/>
        <s:password name="password" cssClass="input-style" placeholder="密码" required="true"/>
        <s:actionerror cssStyle="padding-left: 20px"/>
        <s:submit value="登录" cssClass="button-style"/>
    </s:form>
    <div class="register-link">
        <a href="register.jsp">没有账号？去注册</a>
    </div>
</div>
</body>
</html>
