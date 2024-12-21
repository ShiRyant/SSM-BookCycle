<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookCycle-帮助中心</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;

        }
        .container {
            display: flex;
            width: 1700px;
            margin: 20px auto;

        }
        .sidebar {
            width: 200px;
            background-color: #f0f8ff;
            padding: 10px;
            display: flex;
            flex-direction: column;
        }
        .sidebar a {
            display: flex;
            align-items: center;
            padding: 10px;
            text-decoration: none;
            color: #333;
            margin-bottom: 5px;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }
        .sidebar img {
            width: 24px;
            height: 24px;
            margin-right: 10px;
        }
        .content {
            flex-grow: 1;
            padding: 10px;
        }
        .header {
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            width: 1200px;
            margin: auto;
        }
        .nav-buttons {
            display: flex;
            justify-content: space-around;
            width: 1500px;
            margin: auto;
        }
        .nav-buttons button {
            background-color: #BCE5FF;
            border: 1px solid #b3d9ff;
            padding: 5px 15px;
            cursor: pointer;
            border-radius: 4px;
            display: flex;
            align-items: center;
            width: 200px;
            height: 40px;
            font-size: 22px;
        }
        .nav-buttons button img {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }
        .faq {
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            width: 1300px;
        }
        .faq img {
            width: 800px;
            height: 220px;
            margin-right: 20px;
        }
        .faq-list {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .faq-list li {
            width: 40%;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .faq-list li::before {
            content: '';
            display: inline-block;
            width: 8px;
            height: 8px;
            background-color: #ff4d4f;
            margin-right: 10px;
            border-radius: 50%;
        }
        .content section {
            display: none;
        }
        .content .active {
            display: block;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 10px;
        }
        .line {
            border-top: 1px solid #000;
            margin: 10px 0;
            width: 1340px;
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
<body>
<div id="dialog" class="dialog">
    <div class="dialog-content">
        <!-- 对话框内容将通过JavaScript动态插入 -->
    </div>
</div>
<div class="container">
    <div class="left-container">
        <img src="images/help-center.png" style="width: 220px; height: auto;margin-bottom: 20px">
        <div class="sidebar">
            <a href="#home"><img src="images/serial_number.png" alt="Home Icon">帮助首页</a>
            <a href="#buy"><img src="images/serial_number.png" alt="Buy Icon">如何购书</a>
            <a href="#pay"><img src="images/serial_number.png" alt="Pay Icon">如何支付</a>
            <a href="#refund"><img src="images/serial_number.png" alt="Refund Icon">如何退款</a>
            <a href="#shipping"><img src="images/serial_number.png" alt="Shipping Icon">配送说明</a>
            <a href="#sell"><img src="images/serial_number.png" alt="Sell Icon">成为卖家</a>
            <a href="#post"><img src="images/serial_number.png" alt="Post Icon">用户安全</a>
        </div>
    </div>
    <div class="content">
        <section id="home" class="active">
            <div class="faq">
                <img src="images/hot-question.png" alt="FAQ Icon">
                <div class="faq-list">
                    <li>我怎么样买到图书？</li>
                    <li>配送范围？</li>
                    <li>支付方式？</li>
                    <li>如何修改地址</li>
                    <li>配送时间</li>
                    <li>怎么成为卖家？</li>
                    <li>了解我们。</li>
                    <li>怎么联系客服？</li>
                    <li>配送费说明</li>
                </div>
            </div>
        </section>
        <section id="buy">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.jsp" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="找到你喜欢的书籍，点击书籍">找到你喜欢的书籍，点击书籍</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="进入购买页面，你可以看到书籍的一些基本信息包括作者出版社价格等，选择你想要购买的数量，点击加入购物车">.进入购买页面，你可以看到书籍的一些基本信息包括作者出版社价格等，选择你想要购买的数量，点击加入购物车</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="如果还想买其他书籍，重复上述操作">如果还想买其他书籍，重复上述操作</p></li>
                </ul>
            </div>
        </section>
        <section id="pay">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.jsp" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="点击我的购物车">点击我的购物车</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="添加你要购买的书籍">添加你要购买的书籍</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="点击去结算">点击去结算</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="支付金额">支付金额</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="支付成功">支付成功</p></li>
                </ul>
            </div>
        </section>
        <section id="refund">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.jsp" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="点击退款">点击退款</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="选择退款原因">选择退款原因</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="提交申请">提交申请</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="申请处理成功后退款将在三个工作日内退回您的账户">申请处理成功后退款将在三个工作日内退回您的账户</p></li>
                </ul>
            </div>
        </section>
        <section id="shipping">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.jsp" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="若您满足以下条件之一那么我们会提供免费的服务：
                    你是学生，并且提供学信网验证
                    非新疆西藏地区单张订单满59元
                    新疆西藏地区单张订单满79元
                    若不满足以上免运费服务，新疆西藏地区会收取9元运费，其他地区收取6元运费
                    ">配送费说明</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="配送方式分为两种当日达和次日达
                    当日达要求：
                    一、必须在当日10：00以前下单（以支付订单时间为准）
                    二、在当日13：00以前发货
                    若不满足以上要求则会次日送达（具体到达时间以预计到达时间为准）
                    第三方商家不在我们的配送时间内。
                    ">我们的配送范围</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="我们只在中国国境内进行配送服务">配送范围</p></li>

                </ul>
            </div>

        </section>
        <section id="sell">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.jsp" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="首先回到首页->点击上方导航栏成为卖家后填写姓名、电话、详细地址、身份证号和填写至少十本图书的基本信息后等待三个工作日，待管理员审核通过后就可以成为卖家。">成为卖家</p></li>
                </ul>
            </div>
        </section>
        <section id="post">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.htm" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="近期骗子异常活跃，现提供一点防骗小招，请大家在购物时谨防诈骗。
                    绝招1：拒绝向陌生人转账、汇款，不要在陌生链接中付款，不要接受陌生文件或随意扫描陌生二维码付款。
                    绝招2：收到中奖消息后请仔细辨认，当当没有“周年庆典”、“幸运用户抽奖”等活动，官网活动领奖不需要缴纳手续费、快递费。
                    绝招3：任何一个验证码都有可能和您的款项相关，请勿随意告知他人。
                    绝招4：任何涉及款项、个人信息等相关操作，请第一时间联系官方客服核实确认。
                    ">如何预防诈骗</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="骗子常用伎俩：
                    伎俩1：套用当当客服电话，来电号码显示400-106-6666。
                    伎俩2：通知您订单异常、卡单、失效，需要重新支付。
                    伎俩3：让您点击链接，填写个人及银行卡信息，办理退款。
                    伎俩4：赠送当当打折卡、礼品，需要您提前支付运费。
                    ">如何识别骗子</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="原因1：邮箱自动归为垃圾邮件，请您检查垃圾箱，是否已收到邮件。
                    原因2：将当当设为了黑名单，请您检查黑名单，取消黑名单，将当当邮箱加入通讯录联系人或白名单。
                    原因3：若以上办法均无效，请换时段尝试接收。
                    ">为何我的邮箱收不到网站的邮件</p></li>
                </ul>
            </div>
        </section>
        <section id="customer">
            <div class="line-container">
                <div class="line"></div>
                <div class="title"><a href="become_seller.jsp" style="text-decoration: none">>闲置发布：</a></div>
                <div class="line"></div>
                <ul class="list">
                    <li class="list-item"><p class="clickable-text" data-content="内容1...">如何预防诈骗</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="全校可配送 省内校外则会根据地址选择最佳物流">如何识别骗子</p></li>
                    <li class="list-item"><p class="clickable-text" data-content="内容1...">为何我的邮箱收不到网站的邮件</p></li>
                </ul>
            </div>
        </section>
        <!-- 其他内容区域 -->
    </div>
</div>

<script>
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
<script src="loadNavbar.js"></script>
<script src="footer.js"></script>
</body>
</html>
