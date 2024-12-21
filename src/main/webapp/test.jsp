<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<s:debug/>
<h1>登录</h1>
    <s:form action="userAction-userLogin" namespace="/" method="post">
        <s:textfield name="username" label="账号"/>
        <s:password name="password" label="密码"/>
        <s:submit value="登录"/>
    </s:form>
<h1>注册</h1>
    <s:form action="userAction-userRegister" namespace="/" method="post">
        <s:textfield name="username" label="账号"/>
        <s:password name="password" label="密码"/>
        <s:password name="confirm" label="确认密码"/>
        <s:textfield name="email" label="邮箱"/>
        <s:textfield name="phoneNumber" label="电话"/>
        <s:submit value="注册"/>
    </s:form>
<h1><a href="userInfo.jsp">用户信息</a></h1>
<h1>图片上传</h1>
<s:form action="uploadImage" namespace="/" method="post" enctype="multipart/form-data">
    <label for="file">选择图片：</label>
    <s:file name="file" id="file"/>
    <s:submit value="上传"/>
</s:form>
<s:actionerror/>
<h1>成为卖家</h1>
<s:form action="sellerAction-registerSeller" namespace="/" method="post">
    <s:textfield name="realName" label="真实姓名"/>
    <s:textfield name="idCardNo" label="身份证号码"/>
    <s:textfield name="sellerPhone" label="电话"/>
    <s:textfield name="address" label="详细地址"/>
    <s:submit value="注册"/>
</s:form>
</body>
</html>
