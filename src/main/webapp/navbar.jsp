<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website Header</title>
    <link rel="stylesheet" href="navbar.css">
    <style>
        .user-info {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .login-button {
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .user-dropdown {
            position: relative;
            display: inline-block;
        }

        .user-dropdown .dropdown-menu {
            display: none;
            position: absolute;
            right: 0;
            background-color: white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            padding: 10px;
            border-radius: 5px;
            z-index: 1000;
        }

        .user-dropdown:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu a {
            display: block;
            color: black;
            text-decoration: none;
            margin: 5px 0;
        }
    </style>
</head>
<body>
<div class="header-container">
    <div class="logo">
        <img src="images/logo.png" alt="Logo">
        <div>
            <div class="slogan">循环知识，共享智慧</div>
            <div class="slogan_next">让每一本书籍都找到新的旅程</div>
        </div>
    </div>
    <div class="search-box">
        <s:form action="bookAction-searchBooksByName" method="post" namespace="/">
            <input type="text" class="search-input" placeholder="输入书名..." name="searchText">
            <button type="submit" class="search-button">搜索</button>
        </s:form>
    </div>
    <s:if test="#session.user == null">
        <div class="login" onclick="(function(){window.location.href = 'login.jsp';})()">
            登录/注册
            <img src="images/login.png" alt="Login">
        </div>
    </s:if>
    <s:else>
        <div class="user-dropdown" onclick="(function(){window.location.href = 'userAction-userCenter';})()">
            <span class="username" style="font-size: 24px;font-weight: 700;margin-right: 30px">
                欢迎，<s:property value="#session.user.username" /></span>
        </div>
    </s:else>
</div>
<nav class="navbar">
    <ul>
        <li><a href="homeAction" class="active">首页</a></li>
        <li><a href="classification.jsp">二手书分类概况</a></li>
        <li><a href="sellerAction">成为卖家</a></li>
        <li><a href="charity.jsp">公益项目</a></li>
        <li><a href="usage-docs.jsp">帮助中心</a></li>
        <li><a href="cartAction">购物车</a></li>
    </ul>
</nav>
</body>
</html>
