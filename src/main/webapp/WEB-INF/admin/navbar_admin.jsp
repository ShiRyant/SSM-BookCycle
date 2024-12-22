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
    <div class="user-dropdown">
        <span class="username" style="font-size: 24px;font-weight: 700;margin-right: 30px">
            欢迎使用管理员后台，<s:property value="#session.admin.username" /></span>
    </div>
</div>
<nav class="navbar">
    <ul>
        <li><a href="adminAction-redirectHome">概览</a></li>
        <li><a href="adminAction-getAllUserList">用户管理</a></li>
        <li><a href="adminAction-getAllBookList">书籍管理</a></li>
        <li><a href="adminAction-getAllCommentList">评论管理</a></li>
    </ul>
</nav>
</body>
</html>
