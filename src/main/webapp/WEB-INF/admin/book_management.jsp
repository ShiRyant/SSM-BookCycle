<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookCycle-书籍管理</title>
    <style>
        .main-container {
            padding: 0 20px; /* 左右各留 20px 的空白 */
            max-width: 1800px; /* 设置最大宽度，内容居中 */
            margin: 0 auto; /* 居中对齐 */
            margin-top: 20px;
            margin-bottom: 20px;
        }
        /* 父容器样式 */
        .book-container {
            display: flex;
            flex-wrap: wrap; /* 自动换行 */
            gap: 15px; /* 每个书籍框的间距 */
            justify-content: space-between; /* 保持均匀分布 */
        }

        /* 每本书的样式 */
        .book-box {
            flex: 1 1 calc(25% - 15px); /* 每行显示 4 个书籍框 (100% / 4 = 25%)，减去间距 */
            border: 2px solid #000000;
            padding: 15px;
            border-radius: 4px;
            box-sizing: border-box;
            position: relative;
        }

        /* 保持按钮对齐右上角 */
        .actions {
            position: absolute;
            right: 10px;
            top: 10px;
        }

        .actions button {
            margin: 5px;
        }

        /* 大屏幕，每行显示 4 本书 */
        @media (min-width: 1024px) {
            .book-box {
                flex: 1 1 calc(25% - 15px);
            }
        }

        /* 中等屏幕，每行显示 3 本书 */
        @media (min-width: 768px) and (max-width: 1023px) {
            .book-box {
                flex: 1 1 calc(33.33% - 15px);
            }
        }

        /* 小屏幕，每行显示 2 本书 */
        @media (min-width: 480px) and (max-width: 767px) {
            .book-box {
                flex: 1 1 calc(50% - 15px);
            }
        }

        /* 超小屏幕，每行显示 1 本书 */
        @media (max-width: 479px) {
            .book-box {
                flex: 1 1 100%;
            }
        }

    </style>
</head>
<body style="margin: 0">
    <%@ include file="navbar_admin.jsp"%>
    <div class="main-container">
        <div class="book-container">
            <s:iterator value="bookList" var="book">
                <div class="book-box">
                    <p>书名: <s:property value="#book.title" /></p>
                    <p>出版社: <s:property value="#book.publisher" /></p>
                    <p>分类: <s:property value="#book.category" /></p>
                    <p>ISBN: <s:property value="#book.isbn" /></p>
                    <p>价格: <s:property value="#book.price" /></p>
                    <div class="actions">
                        <button onclick="editBook('<s:property value='%{id}'/>')">编辑</button>
                        <button onclick="confirmDelete()">删除</button>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
<script>
    function confirmDelete() {
        const flag = confirm("您确认要删除这条书籍数据吗");
        if(flag) {
            window.location.href = 'adminAction-deleteBook?bookId=<s:property value="#book.bookId"/>'
        }
    }
</script>
</body>
</html>
