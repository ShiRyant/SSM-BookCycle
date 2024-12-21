<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookCycle-循环知识，共享智慧</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="navbar.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<script src="loadNavbar.js"></script>
<br>
<div class="part">
    <div class="book-shelf-container">
        <nav style="margin-right: 18px;max-width: 1900px">
            <div class="BestsellerListContainer">
                <div class="container_a">
                    <img src="images/hot.png" style="width: 30px;height: 30px;position: absolute">
                    <div style="position: absolute;margin-left: 40px;font-size: 20px;font-weight: bold">近期热门</div>
                    <ol class="BestsellerList">
                        <li>
                            <div class="book-info">
                                <div class="book-name">白鹿原</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="images/book1.jpeg" alt="Image 1">
                                        <div class="ranking_author">作者：陈忠实</div>
                                        <div class="old-price">¥49.50</div>
                                        <div class="new-price">¥18.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">挪威的森林</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/挪威的森林.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：村上春树</div>
                                        <div class="old-price">¥41.80</div>
                                        <div class="new-price">¥15.20</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">史记</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/史记.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：司马迁</div>
                                        <div class="old-price">¥28.60</div>
                                        <div class="new-price">¥10.40</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">无人生还</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/无人生还.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：阿加莎·克里斯蒂</div>
                                        <div class="old-price">¥38.50</div>
                                        <div class="new-price">¥14.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">我的世界观</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/我的世界观.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：阿尔伯特·爱因斯坦</div>
                                        <div class="old-price">¥58.00</div>
                                        <div class="new-price">¥28.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">兔子坡</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/兔子坡.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：罗伯特·罗素</div>
                                        <div class="old-price">¥29.50</div>
                                        <div class="new-price">¥12.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">窗边的小豆豆</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/窗边的小豆豆.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：黑柳彻子</div>
                                        <div class="old-price">¥29.50</div>
                                        <div class="new-price">¥10.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">四库全书</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/四库全书.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：张金华</div>
                                        <div class="old-price">¥49.90</div>
                                        <div class="new-price">¥24.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">白夜行</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/白夜行.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：东野圭吾</div>
                                        <div class="old-price">¥30.00</div>
                                        <div class="new-price">¥12.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="book-info">
                                <div class="book-name">水浒传</div>
                                <div class="book-details">
                                    <div class="details-container">
                                        <img class="book-image" src="http://1.117.59.169:8080/images/水浒传.jpg" alt="Image 1">
                                        <div class="ranking_author">作者：施耐庵</div>
                                        <div class="old-price">¥36.00</div>
                                        <div class="new-price">¥13.00</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </nav>
        <div class="book-shelf">
            <s:iterator value="books" var="book">
                <div class="recommended-book" onclick="function viewDetail(bookId) {
                            window.location.href = 'bookAction-bookDetail?bookId=' + bookId;
                        }
                        viewDetail('<s:property value="#book.bookId"/>')">
                    <img src="http://1.117.59.169:8080/images/<s:property value="#book.title"/>.jpg" alt="Book"
                         class="book-cover" style="margin-top: 20px;width: 160px;height: 160px;border-radius: 3px">
                    <div class="book-info">
                        <h3 class="book-title"><s:property value="#book.title"/></h3>
                        <p class="author" style="align-items: center"><s:property value="#book.author"/></p>
                        <p class="price1"><span class="current-price">¥<s:property value="#book.price*0.4"/>
                        </span><span class="original-price">¥<s:property value="#book.price*1.1" /></span></p>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
</div>
<script src="footer.js"></script>
</body>
</html>
