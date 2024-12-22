<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索结果</title>
    <link rel="icon" href="favicon.ico">
    <style>
        .quick-help-container {
            width: 230px;
            background-color: #e0e0e0;
            padding: 10px;
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
        .category-list ul {
            list-style: none; /* 确保没有默认的列表项标记 */
            padding: 0;
            margin: 0; /* 移除外边距 */
            font-family: Arial, sans-serif;
        }
        .category-list li {
            padding: 10px;
            background-color: #e0e0e0;
            color: #333;
            border-bottom: 1px solid #ccc;
        }
        .category-list li:last-child {
            border-bottom: none;
        }
        .container {
            width: 1200px;
            margin-left: 20px;
            margin-top: 100px;
        }
        .search-bar {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-bar input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 50px;
        }
        .search-bar button {
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
        }
        .result {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            font-weight: bold;
        }
        .book {
            display: flex;
            align-items: flex-end;
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: relative;
        }
        .book img {
            width: 150px;
            height: 150px;
            margin-right: 20px;
            border-radius: 8px;
        }
        .book-info {
            flex-grow: 1;
            margin-right: 20px;
        }
        .book-info h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .book-info p {
            margin: 10px 0;
            color: #666;
        }
        .book-price {
            color: #e74c3c;
            font-weight: bold;
            display: inline-block;
        }
        .book-price .bookcycle-price {
            color: red; /* 将BookCycle价格标红 */
        }
        .price-and-button {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }
        .book button {
            background-color: #2ecc71;
            border: none;
            padding: 10px 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .main_container{
            display: flex;
            width: 1200px;
            margin: auto;
        }
    </style>
    <title>搜索结果</title>
</head>

<body style="margin: 0">
<div class="main_container">
    <div class="container" style="margin-top: 30px">
        <div class="result">
            检索到以下结果
        </div>
        <s:iterator value="books" var="book">
            <div class="book" onclick="(function(){window.location.href = 'bookAction-bookDetail?bookId=<s:property value="#book.bookId"/>';})()">
                <img src="http://1.117.59.169:8080/images/<s:property value="#book.title"/>.jpg" alt="封面">
                <div class="book-info">
                    <h2><s:property value="#book.title" /></h2>
                    <p><s:property value="#book.author"/>/<s:property value="#book.publisher" /></p>
                    <p><s:property value="#book.description" /></p>
                    <p class="book-price">
                        <del><s:property value="#book.price*1.1" /></del> /
                        <span class="bookcycle-price">BookCycle价: ¥<s:property value="#book.price*0.4" /></span>
                    </p>
                </div>
            </div>
        </s:iterator>
    </div>
</div>
<script src="loadNavbar.js"></script>
<script src="footer.js"></script>
</body>
</html>