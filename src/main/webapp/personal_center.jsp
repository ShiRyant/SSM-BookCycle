<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-<s:property value="#session.user.username"/></title>
    <style>
        .info-container {
            width: 700px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .welcome {
            color: #d9534f;
            font-size: 18px;
            margin-bottom: 20px;
        }
        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile img {
            border-radius: 50%;
            margin-right: 10px;
        }
        .profile-info {
            flex-grow: 1;
        }
        .profile-info div {
            margin-bottom: 5px;
        }
        .profile-info span {
            font-weight: bold;
        }
        .password-container {
            position: relative;
        }
        .password-input {
            width: calc(100% - 70px);
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .toggle-password {
            width: 30px;
            height: 30px;
            position: absolute;
            right: 10px;
            top: 5px;
            cursor: pointer;
        }
        .signature, .address {
            margin-bottom: 20px;
        }
        .signature input, .address input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .quick-help-container {
            width: 230px;
            background-color: #f0f0f0;
            padding: 0;
            border-radius: 5px;
            font-family: Arial, sans-serif;
            position: relative;
            margin-top: 30px;
        }
        .quick-help-title {
            background-color: #333;
            color: #fff;
            padding: 10px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            font-size: 18px;
            position: relative;
        }
        .quick-help-title img {
            width: 24px;
            height: 24px;
            position: absolute;
            left: 10px;
            top: 10px;
        }
        .quick-help-title h3 {
            margin: 0;
            padding-left: 40px;
        }
        .quick-help-list {
            background-color: #f0f0f0;
            color: #333;
            padding: 10px;
            list-style-type: disc;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
        .quick-help-list li {
            margin: 5px 0;
        }
        .quick-help-list a {
            text-decoration: none;
            color: #333;
        }
        .quick-help-list a:hover {
            text-decoration: none;
            color: #1E90FF;
        }
        .quick_container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;

        }
        .quick-access {
            width: 30px;
            height: 216px;
            background-color: #fff7d6;
            border-radius: 2px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .quick-access .arrow {
            width: 20px;
            height: 20px;
            background-image: url('images/quick_access.png');
            background-size: cover;
            background-repeat: no-repeat;
            margin-bottom: 20px; /* 与文字的间距 */
            margin-left: 5px;
        }
        .quick-access .text {
            display: flex;
            margin-left: 3px;
            font-size: 24px;
        }
        .quick-access_b {
            width: 200px;
            background-color: #FFFCE6;
            border-radius: 2px;
            overflow: hidden;
        }
        .quick-access_b a {
            display: flex;
            justify-content: space-between; /* 两端对齐 */
            align-items: center;
            padding: 15px;
            text-decoration: none;
            color: #333;
            border-bottom: 1px solid #f0f0f0;
        }
        .quick-access_b a:hover {
            background-color: #f9f9f9;
        }
        .quick-access_b a:active {
            background-color: #f0f0f0;
        }
        .quick-access_b .arrow {
            width: 20px;
            height: 20px;
            background-image: url('images/main_points.png');
            background-size: cover;
            background-repeat: no-repeat;
        }
        .quick-access_b .header {
            position: absolute; /* 绝对定位 */
            top: 0;
            left: 0;
            background-color: #ffe082;
            color: #ff5722;
            font-weight: bold;
            padding: 20px;
            transform: rotate(-90deg); /* 旋转90度 */
            transform-origin: 0 0; /* 旋转基点 */
        }
        .container{
            margin: 10px auto;
            display: flex;
            padding: 10px;
            width: 1100px;
        }
        .left_side{
            display: flex;
            flex-direction: column;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 10px;
            color: #737373;
        }
        .line {
            border-top: 1px solid #000;
            margin: 10px 0;
            width: 700px;
        }
        .cart-info {
            display: flex;
            align-items: center;
            padding: 20px;
            margin: 20px auto;
            width: 700px;
        }
        .cart-icon {
            width: 150px;
            height: 150px;
            background-image: url('images/cart-search-fill.png');
            background-size: cover;
            background-position: center;
            margin-right: 10px; /* 保持右边距 */
        }
        .cart-details {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .cart-details p {
            margin: 20px 0;
            font-size: 20px;
            color: #333;
        }
        .cart-details p span {
            color: #ff5722;
            font-weight: bold;
        }
        .content section {
            display: none;
        }
        .content .active {
            display: block;
        }
        .list {
            padding: 0;
        }
        .list-item {
            margin-bottom: 5px;
        }
        .line-container{
            margin-left: 60px;
        }
        .dialog {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 半透明背景 */
            z-index: 1000; /* 确保对话框在最上层 */
        }

        .dialog-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            width: 80%;
            max-width: 300px;
            border-radius: 5px;
            text-align: center;
        }

        .close-button {
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        #clickMe {
            cursor: pointer; /* 鼠标悬停时变成手形图案 */
            transition: color 0.3s; /* 平滑颜色变化 */
        }

        #clickMe:hover {
            color: #007bff; /* 鼠标悬停时文字变色 */
        }
        .clickable-text {
            cursor: pointer;
            transition: color 0.3s;
        }

        .clickable-text:hover {
            color: #007bff;
        }
        .list {
            padding: 0;
        }
        .list-item {
            margin-bottom: 5px;
        }
        .line-container{
            margin-left: 60px;
        }
    </style>
</head>
<body style="margin: 0">
<div class="container">
    <div class="left_side">
        <div class="quick-help-container">
            <div class="quick-help-title">
                <img src="images/circle.png" alt="帮助图标">
                <h3>快捷帮助</h3>
            </div>
            <div class="quick-help-list">
                <section id="buy">
                    <ul class="list" style="list-style-type: none;">
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">购书如何支付</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="全校可配送 省内校外则会根据地址选择最佳物流">如何成为卖家</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">如何申请退款</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">配送费说明</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">配送范围说明</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">购物车如何操作</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">在网站怎么购买图书</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">需要的书缺货怎么办</p></li>
                        <li class="list-item"><p class="clickable-text" data-content="内容1...">有问题怎么反馈</p></li>
                    </ul>
                </section>
            </div>
        </div>
    </div>


    <div class="info-container">
        <div class="welcome"><h2>欢迎您！</h2></div>
        <div class="welcome">BookCycle将竭诚为您服务！</div>
        <div class="profile">
            <img src="images/default.png" style="width: 100px;height: 100px" alt="Profile Picture">
            <div class="profile-info">
                <div>用户编号：<span><s:property value="#session.user.userId" /></span></div>
                <div>用户名：<s:property value="#session.user.username" /></div>
                <div>邮箱：<s:property value="#session.user.email" /></div>
                <div>电话：<s:property value="#session.user.phoneNumber" /></div>
            </div>
        </div>
        <button type="button" onclick="(function(){window.location.href = 'userAction-userLogout';})()" style="padding: 8px 15px;border: none;border-radius: 4px;
            background-color: #007bff;color: white;cursor: pointer;margin-left: 10px">用户登出</button>

    </div>

</div>
<div id="dialog" class="dialog">
    <div class="dialog-content">
        <!-- 对话框内容将通过JavaScript动态插入 -->
    </div>
</div>
<script src="loadNavbar.js"></script>
<script src="footer.js"></script>
<script>
    const togglePassword = document.querySelector('.toggle-password');
    const passwordInput = document.querySelector('.password-input');

    togglePassword.addEventListener('click', () => {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            togglePassword.src = 'images/close_eye.png';
        } else {
            passwordInput.type = 'password';
            togglePassword.src = 'images/open_eye.png';
        }
    });
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.sidebar a').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const targetId = this.getAttribute('href').substring(1);
                document.querySelectorAll('.content section').forEach(sect => sect.classList.remove('active'));
                document.getElementById(targetId).classList.add('active');
            });
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        var dialog = document.getElementById('dialog');
        var dialogContent = document.querySelector('.dialog-content');
        var clickableTexts = document.querySelectorAll('.clickable-text');

        clickableTexts.forEach(function(text) {
            text.addEventListener('click', function() {
                // 设置对话框内容
                dialogContent.innerHTML = text.getAttribute('data-content');
                dialog.style.display = 'block';
            });
        });

        // 点击对话框外部区域关闭对话框
        dialog.addEventListener('click', function(event) {
            if (event.target == dialog) {
                dialog.style.display = 'none';
            }
        });

        // 点击关闭按钮隐藏对话框
        var closeButton = document.querySelector('.close-button');
        closeButton.addEventListener('click', function() {
            dialog.style.display = 'none';
        });
    });
</script>

</body>
</html>