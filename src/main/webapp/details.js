// 购物车逻辑处理，保证购买书的数量小于库存量
document.addEventListener('DOMContentLoaded', function() {
    const decreaseButtons = document.querySelectorAll('.decrease');
    const increaseButtons = document.querySelectorAll('.increase');
    const quantityInputs = document.querySelectorAll('.quantity-input');

    decreaseButtons.forEach((button, index) => {
        button.addEventListener('click', function() {
            let quantity = parseInt(quantityInputs[index].value);
            if (quantity > 1) {
                quantityInputs[index].value = quantity - 1;
                calculateTotal();}
        });
    });

    increaseButtons.forEach((button, index) => {
        button.addEventListener('click', function() {
            let quantity = parseInt(quantityInputs[index].value);
            let maxQuantity = parseInt(quantityInputs[index].getAttribute('max'));
            if (quantity < maxQuantity) {
                quantityInputs[index].value = quantity + 1;
                calculateTotal();}
        });
    });
});
// 获取单本书的价格
const bookPrice = document.getElementById('bookPrice').innerText;
console.log(bookPrice);
// 获取显示总价格的元素
const totalPriceElement = document.getElementById('total');
// 获取数量输入框
const quantityInput = document.getElementById('quantity');

// 定义一个函数来计算总价格
function calculateTotal() {
    const quantity = quantityInput.value; // 获取输入的数量
    const totalPrice = bookPrice * quantity; // 计算总价格
    totalPriceElement.textContent = totalPrice.toFixed(2); // 显示总价格，保留两位小数
}

// 监听数量输入框的变化
quantityInput.addEventListener('input', calculateTotal);
// 初始化时计算一次总价格
calculateTotal();