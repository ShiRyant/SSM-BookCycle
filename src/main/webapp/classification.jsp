<%--suppress HtmlUnknownTarget --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookCycle-图书分类</title>
    <link rel="icon" href="favicon.ico">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            margin: 20px auto;
            overflow: hidden;
        }

        .category-section {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: inline-block; /* 改为inline-block以控制宽度 */
            width: 316px; /* 设置每个分类项的宽度 */
            margin-right: 20px; /* 设置分类项之间的间距 */
            margin-bottom: 20px; /* 设置分类项下方的间距 */
            text-align: center; /* 文本居中 */
            vertical-align: top; /* 顶部对齐 */
        }

        .category-section h1 {
            color: #C90000;
            margin: 0; /* 移除默认的外边距 */
            font-size: 18px; /* 根据需要调整字体大小 */
        }

        .category-section a {
            text-decoration: none;
            color: #C90000;
        }

        .category-section:last-child {
            margin-right: 0; /* 移除最后一个分类项的右边距 */
        }
    </style>
</head>
<body>
<div class="container" style="margin-left: 9%">
    <img src="images/classification.png" style="width: 1500px;height: auto;margin-bottom: 20px">
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=计算机与网络"><h1>计算机与网络</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=管理"><h1>管理</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=经济"><h1>经济</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=科技工程"><h1>科技工程</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=语言学习"><h1>语言学习</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=少儿"><h1>少儿</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=艺术"><h1>艺术</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=中国文学"><h1>中国文学</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=文化历史"><h1>文化历史</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=建筑"><h1>建筑</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=传记"><h1>传记</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=成功励志"><h1>成功励志</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=家庭育儿"><h1>家庭育儿</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=生活时尚"><h1>生活时尚</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=旅游地理"><h1>旅游地理</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=心理"><h1>心理</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=体育保健"><h1>体育保健</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=收藏鉴赏"><h1>收藏鉴赏</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=悬疑"><h1>悬疑</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=法律"><h1>法律</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=医学卫生"><h1>医学卫生</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=自然科学"><h1>自然科学</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=社会科学"><h1>社会科学</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=政治军事"><h1>政治军事</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=哲学"><h1>哲学</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=教育考试"><h1>教育考试</h1></a>
    </section>
    <section class="category-section">
        <a href="bookAction-searchBooksByCategory?searchText=工具书"><h1>工具书</h1></a>
    </section>
</div>
<script src="footer.js"></script>
<script src="loadNavbar.js"></script>
</body>
</html>

