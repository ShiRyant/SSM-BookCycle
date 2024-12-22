<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册-BookCycle</title>
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
        .register-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* 设置容器宽度 */
        }
        .register-container h2 {
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
        .login-link {
            margin-top: 15px; /* 增加上边距 */
            text-align: center;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>注册</h2>
    <s:form action="userAction-userRegister" namespace="/" method="post" cssClass="form-style">
        <s:textfield name="username" placeholder="用户名（6-12个字符，字母数字）" required="true" cssClass="input-style"/>
        <s:password name="password" placeholder="密码（6-16个字符）" required="true" cssClass="input-style"/>
        <s:password name="confirm" placeholder="确认密码" required="true" cssClass="input-style"/>
        <s:textfield name="email" placeholder="邮箱" cssClass="input-style"/>
        <s:textfield name="phoneNumber" placeholder="电话" cssClass="input-style"/>
        <s:fielderror cssStyle="padding-left: 20px"/>
        <s:submit value="注册" cssClass="button-style"/>
    </s:form>
    <div class="login-link">
        <a href="login.jsp">已有账号？去登录</a>
    </div>
</div>
</body>
</html>