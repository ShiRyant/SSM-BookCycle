<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>BookCycle-购物车</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .cart-container {
            width: 1400px;
            margin: 0 auto;
        }
        .cart-header {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .cart-header h2 {
            margin: 0;
        }
        .cart-steps {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .cart-steps div {
            flex: 1;
            text-align: center;
            background-color: #ddd;
            padding: 5px;
            margin-right: 5px;
        }
        .cart-steps div.active {
            background-color: #ff6600;
            color: white;
        }
        .cart-items {
            margin-top: 20px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .cart-item img {
            width: 70px;
            height: 70px;
        }
        .cart-item-info {
            flex: 1;
            margin-left: 10px;
        }
        .cart-item-info h3 {
            margin: 0;
            font-size: 16px;
        }
        .cart-item-info p {
            margin: 5px 0;
            color: #666;
        }
        .cart-item-quantity {
            display: flex;
            align-items: center;
        }
        .cart-item-quantity button {
            padding: 5px 10px;
            margin-right: 5px;
        }
        .cart-item-quantity input {
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            margin-right: 10px;
            height: 15px;
            width: 50px;
            text-align: left;
        }
        .cart-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f8f8f8;
            border-top: 1px solid #ddd;
            margin-top: 20px;
        }
        .cart-footer .total {
            font-size: 18px;
            color: #ff6600;
            font-weight: bold;
        }
        .total-price {
            font-weight: bold;
            color: #ff6600;
        }
        .remove-button {
            background-color: #ff6600;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 3px;
        }
    </style>
    <link rel="icon" href="favicon.ico">
</head>
<body style="margin: 0">
<div class="cart-container">
    <div class="cart-header">
        <h1><s:property value="#session.user.username"/>的购物车</h1>
    </div>

    <div class="cart-items">
        <s:iterator value="#session.cart" var="book">
            <div class="cart-item" data-price="15.20">
                <input type="checkbox" class="item-checkbox" data-price="<s:property value="#book.price" />" checked>
                <img src="http://1.117.59.169:8080/images/<s:property value="#book.title"/>.jpg" alt="书籍封面">
                <div class="cart-item-info">
                    <h3><s:property value="#book.title" /></h3>
                    <p style="text-decoration: line-through">原价: ¥<s:property value="#book.price/0.4*1.1" /></p>
                    <p>BookCycle价: ¥<s:property value="#book.price" /></p>
                </div>
                <div class="cart-item-quantity">
                    <input type="text" class="quantity" value="<s:property value="#book.quantity" />">
                </div>
                <s:form action="removeCartItem" namespace="/" method="post" id="hiddenData">
                    <input type="hidden" name="bookId" value="<s:property value="#book.bookId" />">
                    <input type="hidden" name="title" value="<s:property value="#book.title" />">
                    <input type="hidden" name="price" value="<s:property value="#book.price*0.4" />">
                    <input type="hidden" name="quantity" value="<s:property value="#book.quantity" />">
                    <button class="remove-button" type="submit">删除</button>
                </s:form>
            </div>
        </s:iterator>
    </div>

    <div class="cart-footer">
        <div>
            <input type="checkbox" id="select-all" checked> 全选
            总计: <span id="total-items">0</span>本
        </div>
        <div class="total" onclick="submitCart()">
            ¥<span id="total-price">0</span>
        </div>
    </div>
</div>
<script src="loadNavbar.js"></script>
<script src="footer.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        let totalItems = 0;

        function updateTotalItems() {
            totalItems = 0;
            document.querySelectorAll('.cart-item input[type="checkbox"]:checked').forEach(item => {
                totalItems += parseInt(item.parentElement.querySelector('.quantity').value);
            });
            document.getElementById('total-items').textContent = totalItems;
        }

        function updateQuantity(input, type) {
            const quantityInput = input.parentElement.querySelector('.quantity');
            let quantity = parseInt(quantityInput.value);
            if (type === 'increase' && quantity < 99) {
                quantity++;
            } else if (type === 'decrease' && quantity > 1) {
                quantity--;
            }
            quantityInput.value = quantity;
            updateTotalItems();
        }

        document.querySelectorAll('.cart-item').forEach(item => {

            const checkbox = item.querySelector('.item-checkbox');

            checkbox.addEventListener('change', updateTotalItems);

            // item.querySelector('.remove-button').addEventListener('click', () => {
            //     const isConfirmed = confirm('您确定要删除此商品吗？');
            //     if (isConfirmed) {
            //         item.parentElement.removeChild(item);
            //         updateTotalItems();
            //     }
            // });
        });

        document.getElementById('select-all').addEventListener('change', (e) => {
            const checkboxes = document.querySelectorAll('.cart-item input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = e.target.checked;
            });
            updateTotalItems();
        });

        // 初始化书本总数
        updateTotalItems();
    });

    // 监听表单提交事件
    function confirmSubmission(event) {
        // 弹出确认对话框
        const userConfirmed = confirm("您确定要删除此商品吗？");
        // 如果用户点击“取消”，阻止表单提交
        if (!userConfirmed) {
            event.preventDefault(); // 阻止默认的提交行为
        }
    }

    // 添加事件监听器
    window.onload = function () {
        const form = document.getElementById("hiddenData");
        form.addEventListener("submit", confirmSubmission);
    };

    //计算总价格
    function calculateTotalPrice() {
        let totalPrice = 0;
        const cartItems = document.querySelectorAll(".cart-item");

        cartItems.forEach((item) => {
            const checkbox = item.querySelector(".item-checkbox");
            const quantityInput = item.querySelector(".quantity")
            const price = parseFloat(checkbox.dataset.price);

            if(checkbox.checked) {
                const quantity = parseInt(quantityInput.value);
                totalPrice += price * quantity;
            }
        })

        document.getElementById("total-price").textContent = totalPrice.toFixed(2);
    }

    //同步全选按钮状态
    function syncSelectAllState() {
        const allCheckboxes = document.querySelectorAll(".item-checkbox");
        const selectAllCheckbox = document.getElementById("select-all");

        selectAllCheckbox.checked = Array.from(allCheckboxes).every((checkbox) => checkbox.checked);
    }

    window.onload = function () {
        calculateTotalPrice();
        // 监听复选框和数量输入框的变化
        document.querySelectorAll(".item-checkbox").forEach((checkbox) => {
            checkbox.addEventListener("change", () => {
                calculateTotalPrice();
                syncSelectAllState();
            });
        });

        document.querySelectorAll(".quantity").forEach((input) => {
            input.addEventListener("input", calculateTotalPrice);
        });

        // 监听全选按钮
        const selectAllCheckbox = document.getElementById("select-all");
        selectAllCheckbox.addEventListener("change", function () {
            const allCheckboxes = document.querySelectorAll(".item-checkbox");
            // 将所有复选框的状态设置为与全选按钮一致
            allCheckboxes.forEach((checkbox) => {
                checkbox.checked = selectAllCheckbox.checked;
            });
            // 重新计算总价格
            calculateTotalPrice();
        });
    };

    function submitCart() {
        const userConfirmed = confirm("您确定要结算购物车所有商品吗？");
        if (userConfirmed) {
            alert("结算成功，合计" + document.getElementById("total-price").innerText + "元，感谢您的支持！")
            window.location.href = 'removeAllItem';
        }
    }

</script>

</body>
</html>