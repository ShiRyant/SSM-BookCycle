document.addEventListener('DOMContentLoaded', function() {
    // 创建一个请求来获取navbar.html的内容
    fetch('bookcycle-hub-layout.html')
        .then(response => response.text())
        .then(data => {
            // 创建一个新的div元素
            const navbarDiv = document.createElement('div');
            // 设置新div的内容为navbar.html的内容
            navbarDiv.innerHTML = data;
            // 设置navbarDiv的样式，使其宽度为100%，并且定位在页面最下方
            navbarDiv.style.width = '100%';
            navbarDiv.style.position = 'relative'; // 使用fixed定位
            navbarDiv.style.bottom = '0'; // 距离底部0
            navbarDiv.style.left = '0';
            navbarDiv.style.zIndex = '1000'; // 确保navbar在页面最上层
            // 将新div添加到body的末尾
            document.body.appendChild(navbarDiv);
        })
        .catch(error => console.error('Error loading navbar:', error));
});