<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>书籍详情-<s:property value="book.title" /></title>
    <link rel="stylesheet" href="details.css">
    <link rel="stylesheet" href="navbar.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .submit-button {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            margin-left: 20px;
        }
        .submit-button:hover {
            background-color: #0069d9;
        }
        .comment-input {
            padding: 8px;
            border: 2px solid #ced4da;
            border-radius: 4px;
            margin: -3px 6px 6px;
            width: 1134px;
            height: 120px;
            font-size: 20px;
            font-family: 'Arial', sans-serif;
        }
        .comment-box {
            display: flex;
            align-items: flex-end;
            background-color: white;
            padding-left: 25px;
            padding-right: 25px;
            margin-bottom: 10px;
            margin-top: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: relative;
            font-size: 20px;
            font-weight: 400;
            text-align: justify;
        }
    </style>
</head>
<body>
<script src="loadNavbar.js"></script>
<div class="out-container">
    <div class="product">
        <img src="http://1.117.59.169:8080/images/<s:property value="book.title"/>.jpg" alt="书籍封面" style="margin-left: 100px;margin-top: 50px;width: 300px;height: 300px;margin-right: 20px;">
        <div class="product-info">
            <h3><s:property value="book.title" /></h3>
            <p style="color: #7F7F7F">作者：<s:property value="book.author"/></p>
            <p style="margin-left: 240px;margin-top: -40px;color: #7F7F7F">出版社：<s:property value="book.publisher" /></p>
            <p style="margin-left: 500px;margin-top: -40px;color: #7F7F7F">ISBN：<s:property value="book.isbn" /></p>
            <p style="color: #7F7F7F">分类：<s:property value="book.category" /></p>
            <p style="margin-left: 240px;margin-top: -40px;color: #7F7F7F">定价：¥<s:property value="book.price*1.1" /></p>
            <p style="margin-left: 500px;margin-top: -40px;color: #e74c3c;font-size: 1.2em">
                BookCycle价：¥<span id="bookPrice"><s:property value="book.price*0.4"/></span></p>
            <hr style="margin-right: 200px;color: #7F7F7F">
            <p style="color: #7F7F7F">配送：</p>
            <p style="margin-left: 100px;margin-top: -40px;font-size: 18px;color: #E86666">校内包邮！</p>
            <p style="color: #7F7F7F">库存：</p>
            <p style="margin-left: 100px;margin-top: -40px;font-size: 18px;color: #2ecc71">99+</p>
            <p style="color: #7F7F7F">购买数量：</p>
            <p style="margin-left: 100px;margin-top: -40px;font-size: 18px;color: #2ecc71">
                <input type="number" value="1" min="1" max="99" class="quantity-input" id="quantity" name="quantity" onchange="calculateTotal();syncQuantity()">
            </p>
            <p style="color: #7F7F7F">合计：</p>
            <p style="margin-left: 100px;margin-top: -40px;font-size: 23px;position: absolute;color: #e74c3c">
                <span id="total">¥<s:property value="book.price*0.4" /></span></p>
            <s:form action="addToCart" method="post" onsubmit="return showSuccessMessage();" namespace="/">
                <input type="hidden" name="bookId" value="<s:property value="book.bookId" />">
                <input type="hidden" name="title" value="<s:property value="book.title" />">
                <input type="hidden" name="price" value="<s:property value="book.price*0.4" />">
                <input type="hidden" name="quantity" id="hiddenQuantity" value="3">
                <button type="submit" style="padding: 8px 15px;border: none;border-radius: 4px;
                background-color: #ff6600;color: white;cursor: pointer">加入购物车</button>
            </s:form>
        </div>
    </div>
    <div class="container">
        <div class="left-panel">
            <div class="book-details">
                <h2 style="background-color: black;color: white;padding: 10px">图书详情</h2>
                <div class="content-summary">内容提要</div>
                <hr style="margin-top: -4px">
                <p id="text" class="text">
                    <s:property value="book.description"/>
                </p>
            </div>
            <div class="book-reviews">
                <h2 style="background-color: black;color: white;padding: 10px">图书评价</h2>
                <s:if test="#session.user != null">
                    <s:form action="commentAction-addComment" namespace="/">
                        <laber for="commentBox"><h3>分享你对书籍的看法...<button type="submit" class="submit-button">发送评论</button></h3></laber>
                        <s:textarea id="commentBox" name="content" cssClass="comment-input"/>
                        <input type="hidden" name="bookId" value="<s:property value="book.bookId"/>">
                        <input type="hidden" name="userId" value="<s:property value="#session.user.userId"/>">
                        <input type="hidden" name="username" value="<s:property value="#session.user.username"/>">
                    </s:form>
                </s:if>
                <ul>
                    <s:iterator value="book.comments" var="comment">
                        <li>
                            <div class="parent-container">
                                <div class="head_portrait">
                                    <img src="images/default.png" height="100px" width="100px">
                                </div>
                                <div class="user_info">
                                    <div class="reviewer"><s:property value="#comment.username"/>        <s:property value="#comment.commentTime"/></div>
                                    <div class="comment-box"><p><s:property value="#comment.content"/></p></div>
                                </div>
                            </div>
                        </li>
                    </s:iterator>
                </ul>
            </div>
        </div>
        <div class="right-panel">
            <div class="recommendation">猜你喜欢</div>
            <s:iterator value="books" var="recommendation">
                <div class="recommended-book">
                    <img src="http://1.117.59.169:8080/images/<s:property value="#recommendation.title"/>.jpg" alt="Book 1" class="book-cover">
                    <div class="book-info">
                        <h3 class="book-title"><s:property value="#recommendation.title" /></h3>
                        <p class="author"><s:property value="#recommendation.author" /></p>
                        <p class="price1">
                            <span class="current-price">¥<s:property value="#recommendation.price*0.4" /></span>
                            <span class="original-price">¥<s:property value="#recommendation.price*1.1" /></span></p>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
</div>
<script src="footer.js"></script>
<script src="details.js"></script>
<script>
    function showSuccessMessage() {
        alert("书籍已成功加入购物车！");
        return true;
    }

    function syncQuantity() {
        const quantityInput = document.getElementById('quantity');
        const hiddenQuantityInput = document.getElementById('hiddenQuantity')
        hiddenQuantityInput.value = quantityInput.value;
    }

    document.addEventListener('DOMContentLoaded', () => {
        syncQuantity();
    });
</script>
</body>
</html>