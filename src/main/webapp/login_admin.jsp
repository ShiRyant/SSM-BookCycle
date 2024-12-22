<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookCycle-管理员登录</title>
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
            background-image:linear-gradient(120deg,#a1c4fd 0%, #c2e9fb 100%);
            color: white;
            cursor: pointer;
            width: 100%; /* 设置提交按钮宽度为100% */
        }
        .register-link {
            margin-top: 15px; /* 增加上边距 */
            text-align: center;
        }
    </style>
    <link rel="icon" href="favicon.ico">
</head>
</head>
<body>
<div class="login-container">
    <h2 onclick="window.location.href = 'login.jsp'">管理员登录</h2>
    <s:form action="adminAction-adminLogin" method="post" namespace="/" cssClass="form-style">
        <s:textfield name="adminName" cssClass="input-style" placeholder="管理员账号" required="true"/>
        <s:password name="password" cssClass="input-style" placeholder="密码" required="true"/>
        <s:actionerror cssStyle="padding-left: 20px"/>
        <s:submit value="Login" cssClass="button-style" cssStyle="font-weight: bold"/>
    </s:form>
</div>
</body>
</html>
