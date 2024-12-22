<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookCycle-成为卖家</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Style</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .info-container {
            display: flex;
            width: 1200px;
            margin: auto;
        }

        .left-side {
            display: flex;
            flex-direction: column; /* 垂直排列子元素 */
            flex: 1; /* 占据剩余空间 */
        }

        .right-side {
            flex: 8;
            padding-left: 20px;
        }

        .quick_container, .leaderboard {
            margin-bottom: 20px;
        }

        .form-container {
            width: 800px;
            /*margin: 50px auto;*/
            padding: 20px;
            background-color: #fff;
            border: 1px solid #FFF6B9;
            border-radius: 10px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        label {
            width: 150px;
            margin-right: 10px;
            color: #333;
        }
        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 400px;
            padding: 8px;
            box-sizing: border-box;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
        .note {
            color: #979393;
            font-size: 12px;
        }
        .section-title {
            background-color: #FFF6B9;
            padding: 10px;
            margin-bottom: 20px;
            font-weight: bold;
            width: 120px;
            text-align: center;
            font-size: 22px;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        .instruction {
            color: #E33B3B;
            font-size: 12px;
            margin-left: 10px; /* 与输入框保持一定距离 */
        }
        .must_know {
            color: #666;
            font-size: 14px;
            margin-left: 10px;
        }
        .must_note {

            font-size: 14px;
        }
        .quick_container {
            display: flex;
            align-items: center;
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
            background-image: url('images/quick_access.png'); /* 替换为您的箭头图片URL */
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
            align-items: center; /* 垂直居中 */
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
            background-image: url('images/main_points.png'); /* 替换为您的箭头图片URL */
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
        .leaderboard {
            width: 224px;
            border: 1px solid #f0f0f0;
            border-radius: 10px;
            overflow: hidden;
            background-color: #FFFCE6; /* 外部容器背景颜色 */
        }
        .leaderboard-header {
            display: flex;
            align-items: center; /* 确保子元素垂直居中对齐 */
            background-color: #FFFCE6; /* 头部背景颜色与外部容器相同 */
            padding: 10px;
        }
        .hot-container {
            width: 28px; /* 图片容器的宽度 */
            height: 28px; /* 图片容器的高度 */
            margin-right: 10px; /* 图片和文字之间的间距 */
            background-color: #FFFCE6;
            text-align: center;
            font-weight: bold;
        }
        .hot-container img {
            width: 100%; /* 图片宽度填满容器 */
            height: auto; /* 图片高度自动调整以保持比例 */
        }
        .TOP10-container {
            flex-grow: 1; /* 文字容器占据剩余空间 */
            margin-left: 40px;
            font-size: 25px;
            font-weight: bold;
        }
        .leaderboard-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #f0f0f0; /* 边框颜色 */
        }
        .leaderboard-item:last-child {
            border-bottom: none;
        }
        .leaderboard-item.up:after {
            content: '⬆️';
            color: red;
        }
        .leaderboard-item.down:after {
            content: '⬇️';
            color: blue;
        }
        .leaderboard-item img {
            width: 25px;
            height: 25px;
        }
        .seller_container{
            margin:5px;
            background-color: white;
        }
        .container{
            display: flex;
            flex-direction: column;
            margin: auto;
            width: 1800px;
        }
    </style>
    <link rel="icon" href="favicon.ico">
</head>
<body>
<script src="loadNavbar.js"></script>
<div class="container">
    <img src="images/become_seller.webp" width="1100" height="300" alt="成为卖家"
         style="margin-left:300px;margin-bottom:20px;margin-top:20px;border-radius: 10px">
    <div class="info-container">
        <div class="left-side">
            <div class="leaderboard">
                <div class="leaderboard-header">
                    <div class="hot-container">
                        <img src="images/hot.png" alt="描述图片">
                    </div>
                    <div class="TOP10-container">
                        卖家榜TOP10
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item up">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家1号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item down">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家2号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item up">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家3号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item down">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家4号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item up">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家5号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item down">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家6号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item up">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家7号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item down">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家8号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item down">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家9号
                    </div>
                </div>
                <div class="seller_container">
                    <div class="leaderboard-item up">
                        <img src="images/lable_img.png" alt="Flag Icon">
                        卖家10号
                    </div>
                </div>
            </div>
        </div>
        <div class="right-side">
            <s:form action="sellerAction" namespace="/" method="post" enctype="multipart/form-data">
                <div class="form-container">
                    <div class="note">
                        <p>1. 请您将图书打包严实，填写您的地址信息，用于快递上门取件或送件。</p>
                        <p>2. 我们将在1-3个工作日内通过电话联系您进行审核，请您耐心等待并保持电话通畅。</p>
                    </div>

                    <div class="section-title">个人信息</div>
                    <div class="form-group">
                        <label for="real-name">真实姓名：</label>
                        <input type="text" id="real-name" name="realName">
                    </div>
                    <div class="form-group">
                        <label for="phone">联系电话：</label>
                        <input type="text" id="phone" name="sellerPhone">
                        <div class="instruction">*号码须为11位数</div>
                        <div id="phone-error" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="address">详细地址：</label>
                        <input type="text" id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="id-number">身份证号码：</label>
                        <input type="text" id="id-number" name="idCardNo">
                        <div class="instruction">*身份证号码须为18位</div>
                        <div id="id-error" class="error"></div>
                    </div>

                    <div class="section-title">图书信息</div>
                    <div class="form-group">
                        <label for="book-count">图书数量：</label>
                        <input type="number" id="book-count" name="bookNum" value="1">
                        <div id="book-count-error" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="isbn">书籍信息：</label>
                        <textarea id="isbn" name="bookInfo" rows="4" cols="50"></textarea>
                        <div class="instruction">*填写书籍名，ISBN等信息</div>
                    </div>
                    <div class="form-group">
                        <label for="book-image">图书照片：</label>
                        <input type="file" id="book-image" name="img">
                    </div>
                    <s:actionerror cssStyle="padding-left: 10px"/>
                    <s:fielderror cssStyle="padding-left: 10px"/>
                    <div class="must_note">
                        <p>*实际收入以收书审核后为准，审核通过后，我们会联系您并支付对应款项</p>
                    </div>

                    <p>卖书须知：</p>
                    <div class="must_know">
                        <p>1、回收订单包裹签收后7个工作日内，将完成书籍的审核与打款(审核周期内勿催)，因订单较多，审核稍慢，请您耐心等待，谢谢理解!</p>
                        <p>2、请您核对好订单书籍后，再提交订单，并自行打包好，待取件员验货后再封口。请勿随意放置包裹或将未打包好的图书直接交给取件员，由此导致订单书籍遗失，平台概不负责</p>
                        <p>3、卖书运费(不含包装费)由我们承担,提交订单后,我们将安排京东或德邦上门取件(请勿自寄或到付件)，不需要您垫付运费。</p>
                    </div>
                    <button type="submit" class="submit-btn">提交</button>
                </div>
            </s:form>
        </div>
    </div>
</div>
<script src="footer.js"></script>
</body>
</html>
