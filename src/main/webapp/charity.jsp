<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>BookCycle-公益项目</title>
    <link rel="icon" href="favicon.ico">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            max-width: 1800px;
            min-width: 1600px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .charity-image-container {
            display: flex; /* 使用Flexbox布局 */
            align-items: flex-start; /* 垂直对齐 */
            width: 100%; /* 容器宽度充满整个屏幕 */
            min-width: 1600px;
        }

        .first-image {
            flex: 5; /* 左边图片的横向占比是右边的5倍 */
            height: 265px; /* 图片高度固定为265px */
            background-size: cover; /* 背景图片覆盖 */
            background-position: center; /* 背景图片居中 */
        }

        .second-image {
            flex: 1; /* 右边图片的横向占比是左边的1/5 */
            height: 265px; /* 图片高度固定为265px */
            background-size: cover; /* 背景图片覆盖 */
            background-position: center; /* 背景图片居中 */
            margin-left: 10px;
        }
        .news-section {
            margin-bottom: 40px;
            background-color: #F5F5F5;

        }
        .news-section h2 {
            color: red;
            margin-bottom: 10px;
        }
        .news-section ul {
            list-style-type: none;
            padding: 0;
            columns: 2;
            column-gap: 20px;
        }
        .news-section ul li {
            break-inside: avoid;
            margin-bottom: 20px;
        }
        .news-section ul li:before {
            content: "• ";
            color: green;
            margin-right: 5px;
        }
        .title{
            display: flex;
        }
        .real_time_info {
            display: flex;
            min-width: 1600px;
            max-width: 1800px;
            justify-content: center;
            align-items: center;
        }

        .left-image {
            flex: 0 0 auto;
            width: 50%; /* 可以根据需要调整宽度 */
            height: auto;
        }

        .right-column {
            flex: 1;
            display: flex;
            flex-direction: column;
            max-height: 570px;
            margin-bottom: 20px;
        }

        .right-row {
            display: flex;
            justify-content: space-between;
            margin-left: 10px;
        }

        .right-image {
            width: 460px;
            height: 285px;
            border-radius: 10px;
        }

        /* 确保右边纵向排列的两张图片的高度之和与左边图片的高度相同 */
        .right-image:first-child {
            width: 50%;
            margin-bottom: 10px;
        }

        .right-image:last-child {
            width: 50%;
            margin-left: 10px;
            margin-bottom: 10px;
        }
        .ad-slider {
            position: relative;
            max-width: 100%; /* 最大宽度与图片宽度一致 */
            max-height: 100%;
            margin: 120px auto 20px; /* 顶部和底部的外边距 */
            overflow: hidden; /* 隐藏溢出的内容 */
            border-radius: 10px; /* 四个角都是圆角 */
        }

        .ad-slider-wrapper {
            display: flex;
            transition: transform 0.5s ease;
        }

        .ad-slider-item {
            flex: 0 0 auto; /* 防止flex项目被压缩 */
            width: 100%; /* 图片宽度 */
            height: 570px; /* 图片高度 */
            background-size: cover;
            background-position: center;
        }

        .ad-slider-item img {
            width: 100%; /* 宽度自适应 */
            height: 100%; /* 高度自适应 */
            object-fit: contain; /* 确保图片完整显示 */
        }
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }
        .horizontal_line-title {
            font-size: 24px;
            color: #8B0000;
            font-weight: bold; /* 字体加粗 */
            display: inline-block; /* 行内块元素 */
            margin-right: 20px; /* 右边距 */
            position: relative;
        }

        .horizontal_line-title::before {
            content: ''; /* 伪元素内容为空 */
            position: absolute; /* 绝对定位 */
            left: 0; /* 左边对齐 */
            bottom: -5px; /* 底部对齐，位于文字下方 */
            width: 200px; /* 宽度100% */
            height: 3px; /* 横线高度 */
            background-color: red; /* 横线颜色 */
        }

        .horizontal_line-title::after {
            content: ''; /* 伪元素内容为空 */
            position: absolute; /* 绝对定位 */
            left: 0; /* 左边对齐 */
            bottom: -15px;
            width: 1700px;
            height: 3px;
            background-color: red;
        }

        .more-link {
            font-size: 14px;
            color: #8B0000;
            text-decoration: none;
            float: right;
            margin-top: 5px;
        }

        .horizontal_line-container {
            padding: 10px 0;
            margin-bottom: 20px;
        }
        .article {
            border-bottom: 1px solid #ccc; /* 底部边框 */
            padding: 10px 0; /* 垂直内边距 */
            display: flex; /* 使用flex布局 */
            align-items: center; /* 垂直居中 */
        }
        .article img {
            width: 300px; /* 图片宽度 */
            height: auto; /* 图片高度自动 */
            margin-right: 20px; /* 右边距 */
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .article-title {
            font-size: 18px; /* 标题字体大小 */
            color: #333; /* 标题颜色 */
            font-weight: bold; /* 标题加粗 */
            margin: 0; /* 去除外边距 */
        }
        .article-content {
            font-size: 14px; /* 内容字体大小 */
            color: #666; /* 内容颜色 */
            margin: 5px 0 0 0px; /* 上边距和左边距 */
        }
        .read-more {
            margin-left: 1300px;
            color: #007BFF; /* 链接颜色 */
            text-decoration: none; /* 去除下划线 */
        }
        .record{
            height: 200px;
        }
        .exhibition-title {
            font-size: 24px; /* 字体大小 */
            color: #8B0000; /* 字体颜色 */
            font-weight: bold; /* 字体加粗 */
            text-align: center; /* 文本居中 */
            margin-top: 50px; /* 顶部外边距 */
            margin-bottom: 20px; /* 底部外边距 */
            position: relative; /* 设置相对定位 */
        }

        .exhibition-title::after {
            content: '←→';
            color: #8B0000; /* 符号颜色 */
            position: absolute; /* 绝对定位 */
            left: 50%; /* 左边对齐 */
            transform: translateX(-50%); /* 水平居中 */
            top: 100%; /* 位于标题下方 */
        }

        .exhibition-line {
            border-top: 2px solid #8B0000; /* 上边框，模拟底线 */
            margin: 40px auto; /* 垂直外边距，水平居中 */
            width: 95%; /* 线宽 */
        }
        .carousel-container {
            position: relative;
            width: 1530px; /* 轮播图容器宽度 */
            height: 400px; /* 轮播图容器高度 */
            overflow: hidden; /* 隐藏溢出内容 */
            margin: auto;
        }

        .carousel-slider {
            display: flex;
            transition: transform 0.5s ease;

        }

        .carousel-item {
            width: 500px; /* 图片宽度 */
            height: 400px; /* 图片高度 */
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px; /* 图片之间的外边距 */
        }

        .carousel-item img {
            width: 500px;
            height: 400px;
        }

        .carousel-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 30px;
            color: #8B0000; /* 箭头颜色 */
            cursor: pointer;
            z-index: 10; /* 确保箭头在轮播图上方 */
        }

        .carousel-arrow.left {
            left: 10px;
        }

        .carousel-arrow.right {
            right: 10px;
        }
        .last-container {
            display: flex;
            width: 90%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            align-items: flex-start;
        }
        .image-section {
            flex: 1;
            margin-right: 20px;
        }
        .text-section {
            flex: 3;
        }
        .section {
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 24px;
            color: #8B0000;
            font-weight: bold;
            border-bottom: 2px solid #8B0000;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        .more-link {
            float: right;
            font-size: 14px;
            color: #8B0000;
            text-decoration: none;
        }
        .more-link::after {
            content: " >>";
        }
        /* 为特定的容器添加类名，例如 .news-list */
        .news-list {
            list-style-type: none;
            padding: 0;
        }
        .news-list li {
            margin-bottom: 10px;
        }
        .news-list li::before {
            content: "·";
            color: #8B0000;
            margin-right: 5px;
        }
    </style>
</head>
<body>
<script src="loadNavbar.js"></script>
<div class="container">
    <div class="header">
        <div class="charity-image-container">
            <div class="first-image" style="background-image: url('images/Public_welfare_poster.png')"></div>
            <div class="second-image" style="background-image: url('images/connect_us.webp')"></div>
        </div>
    </div>

    <div class="news-section">
        <div class="title">
            <img src="images/Headlines.png" width="80" height="80">
            <h2>头条新闻</h2>
        </div>
        <ul>
            <li><a href="charity_details.html" style="text-decoration: none;color: black">“友邦友爱·书香筑梦”2024友邦广东公益行动正式启动</a> </li>
            <li>这是一份书单，亦是你的旅行清单</li>
            <li>书海扬帆”图书捐赠公益项目圆满落幕，文化之光照亮偏远地区</li>
            <li>张晓翔：以阅读为桥梁，探寻传统文化的独特魅力</li>
        </ul>
    </div>
    <div class="horizontal_line-container">
        <span class="horizontal_line-title">最新资讯</span>
        <a href="#" class="more-link">更多>></a>
    </div>
    <div class="real_time_info">
        <!-- 左边的图片 -->
        <div class="ad-slider" style="margin-top: 10px">
            <div class="ad-slider-wrapper">
                <div class="ad-slider-item"><img src="images/charity_5.png" alt="Slide 1"></div>
                <div class="ad-slider-item"><img src="images/charity_10.png" alt="Slide 2"></div>
                <div class="ad-slider-item"><img src="images/charity_11.png" alt="Slide 3"></div>
                <!-- 更多的轮播图片 -->
            </div>
            <a class="prev" onclick="moveSlide(-1)">&#10094;</a>
            <a class="next" onclick="moveSlide(1)">&#10095;</a>
        </div>
        <!-- 右边的图片 -->
        <div class="right-column">
            <div class="right-row">
                <img src="images/charity_6.png" alt="Right Image 1" class="right-image" >
                <img src="images/charity_7.png" alt="Right Image 2" class="right-image">
            </div>
            <div class="right-row">
                <img src="images/charity_8.png" alt="Right Image 3" class="right-image">
                <img src="images/charity_9.png" alt="Right Image 4" class="right-image">
            </div>
        </div>
    </div>
    <img src="images/renting.png" style="width: 100%;height: auto;margin-top: 20px;margin-bottom: 20px">
    <div class="horizontal_line-container">
        <span class="horizontal_line-title">爱心记录</span>
        <a href="#" class="more-link">更多>></a>
    </div>
    <div class="article">
        <img src="images/charity_1.png" alt="Article Image">
        <div class="record">
            <h2 class="article-title">教科院：捐赠爱心图书 助力乡村振兴</h2>
            <p class="article-content">捐赠仪式上，双庙村党总支书记王明才简要介绍了当前农家书屋建设及农村儿童阅读条件现状，并对教科院的爱心之举表示高度的赞扬
                和由衷的感谢。他表示，爱心图书的捐赠，对于培育文明乡风、良好家风、淳朴民风、丰富乡民精神文化生活，促进乡村社会文明建设，助力乡村振兴具有重要意义。捐赠仪式结束
                后，在村委会工作人员的带领下，教科院师生一行参观了农家书屋、育秧工厂等场所，并就爱心支教达成了初步意向。据悉，本次由教科院青年志愿者支队承办的图书捐赠活动以自
                愿为主，活动得到了教科院及兄弟学院毕业生的踊跃支持，大家纷纷用实际行动诠释着爱的真谛。他们精心挑选出自己喜爱的图书，涉及党建、科技、生活、文化、少儿、综合六大类别，短短两天，共收到爱心书籍300余本。</p>
        </div>
    </div>

    <div class="article">
        <img src="images/charity_2.png" alt="Article Image">
        <div class="record">
            <h2 class="article-title">和平街社区开展“手拉手 心连心 共沐书香”捐书活动</h2>
            <p class="article-content">“捐一缕书香，献一片真情”，为了深入开展精神文明建设和新时代文明实践活动。近日，越河街道和平街社区开展“手拉手 心连心 共沐书香”捐书活动。
                倡议活动一发出便得到了辖区党员和志愿者的积极响应。活动中，党员和志愿者们主动将自己家中的图书捐献出来，送到孩子们手中，同时鼓励孩子们要多读书、读好书、好读书，养成良好的读书习惯，争做一名对社会有用之人。通过这种方式，帮助更多的孩子们阅读更多的课外图书，让孩子们爱上阅读，让书籍在孩子们手中传递，希望更多的居民参与到传递文明、传递爱，做新时代文明实践的践行者。
            </p>
        </div>
    </div>

    <div class="article">
        <img src="images/charity_3.png" alt="Article Image">
        <div class="record">
            <h2 class="article-title">书送梦想·点亮未来丨一本书公益活动全国捐赠计划第一站走进新疆巴楚！</h2>
            <p class="article-content">继一本书公益活动全国捐赠计划启动仪式落幕之后，一本书志愿服务队积极联合爱心社区、爱心企业及社会各界爱心人士，为老少边地区的孩子募集图书。本次被捐赠的
                两所小学分别是巴楚县阿纳库勒乡第七小学（简称“第七小学”）和巴楚县阿纳库勒乡第四小学（简称“第四小学”），共有3300多名孩子。近两年，巴楚县在生活物质上已经“脱贫”，但是在教育和阅读方
                面仍需要更多的支持和援助。仪式上，巴楚县县委教育工委副书记、教育局党组书记、局长陈洪琴致辞，并向一本书志愿服务队的到来和长期以来关心、支持巴楚教育的社会各界表示衷心的感谢！</p>
        </div>
    </div>
    <div class="article">
        <img src="images/charity_4.png" alt="Article Image">
        <div class="record">
            <h2 class="article-title">市青联开展“青心呵护童伴 文明与爱同行”爱心图书置换公益活动 </h2>
            <p class="article-content">为助力乡村振兴，充分发挥青联组织动员优势，进一步关心关爱乡村青少年健康成长，濮阳市青年联合会在龙都广场西门开展“青心呵护童伴 文明与爱同行”爱心图书置换公益活动。市青联各界别委员、市龙艺公益志愿服务中心、返乡大学生志愿
                者20余人参加活动。一大早，四面八方的爱心市民就带着孩子来到活动现场，将精心挑选的书籍递交给志愿者，家长们纷纷表示，这种活动形式很有意义，做公益的
                同时，还可以培养孩子们的社会责任感和爱心。有的爱心市民还专门到书店挑选了新书送给孩子们。</p>
        </div>
    </div>
    <div class="exhibition-title">精彩展厅</div>
    <div class="exhibition-line"></div>
    <div class="carousel-container">
        <div class="carousel-slider">
            <div class="carousel-item"><img src="images/exhibition1.webp" alt="Image 1"></div>
            <div class="carousel-item"><img src="images/exhibition2.webp" alt="Image 2"></div>
            <div class="carousel-item"><img src="images/exhibition3.webp" alt="Image 3"></div>
            <div class="carousel-item"><img src="images/charity_12.jpg" alt="Image 4"></div>
            <div class="carousel-item"><img src="images/charity_13.jpg" alt="Image 5"></div>
            <div class="carousel-item"><img src="images/charity_14.jpg" alt="Image 6"></div>
            <div class="carousel-item"><img src="images/charity_15.jpg" alt="Image 7"></div>
            <!-- 更多图片 -->
        </div>
        <div class="carousel-arrow left" onclick="moveSlide(-1)">&#10094;</div>
        <div class="carousel-arrow right" onclick="moveSlide(1)">&#10095;</div>
    </div>
</div>
<script src="footer.js"></script>
<script src="details.js"></script>
</body>
<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let slides = document.getElementsByClassName("ad-slider-item");
        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex >= slides.length) {slideIndex = 0}
        slides[slideIndex].style.display = "block";
        setTimeout(showSlides, 3000); // Change image every 3 seconds
    }

    function moveSlide(n) {
        let slides = document.getElementsByClassName("ad-slider-item");
        if (n < 0) {
            if (slideIndex === 0) {
                slideIndex = slides.length - 1;
            } else {
                slideIndex--;
            }
        } else {
            if (slideIndex === slides.length - 1) {
                slideIndex = 0;
            } else {
                slideIndex++;
            }
        }
        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex].style.display = "block";
    }
    let slideIndex_2 = 0;
    let slides_2 = document.getElementsByClassName("carousel-item");
    const totalslides_2 = slides_2.length;
    let slideWidth_2 = 510; // 单张幻灯片宽度加上外边距 (500px + 10px)

    function showslides_2() {
        let slider = document.querySelector('.carousel-slider');
        slider.style.transform = `translateX(-${slideIndex_2 * slideWidth_2}px)`;
    }

    function moveSlide_2(n) {
        slideIndex_2 += n;
        if (slideIndex_2 >= (totalslides_2-2)) {slideIndex_2 = 0;}
        if (slideIndex_2 < 0) {slideIndex_2 = totalslides_2 - 1;}
        showslides_2();
    }

    function autoPlay_2() {
        moveSlide_2(1);
        setTimeout(autoPlay_2, 3000); // 每3秒自动播放下一张
    }
    autoPlay_2(); // 初始化自动播放
    showslides_2(); // 初始化轮播图
</script>
</html>