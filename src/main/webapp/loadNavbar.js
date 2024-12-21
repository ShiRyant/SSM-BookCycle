document.addEventListener('DOMContentLoaded', function() {
    fetch('navbar.jsp')
        .then(response => response.text())
        .then(data => {
            // 创建一个新的div元素
            const navbarDiv = document.createElement('div');
            // 设置新div的内容为navbar.html的内容
            navbarDiv.innerHTML = data;
            // 设置navbarDiv的样式，使其宽度为100%，并且定位在页面最上方
            navbarDiv.style.width = '100%';
            navbarDiv.style.top = '0';
            navbarDiv.style.left = '0';
            navbarDiv.style.zIndex = '1000'; // 确保navbar在页面最上层
            // 将新div插入到body的第一个子元素之前
            document.body.insertBefore(navbarDiv, document.body.firstChild);
            highlightActiveNav();
        })
        .catch(error => console.error('Error loading navbar:', error));
});

function highlightActiveNav() {
    // 获取当前页面的完整路径
    const currentPath = window.location.pathname;

    // 遍历导航栏中的所有链接
    document.querySelectorAll('.navbar ul li a').forEach(link => {
        // 获取链接的 href 属性
        const linkPath = link.getAttribute('href');
        // 如果当前路径包含 href 或完全匹配 href，则添加高亮
        if (currentPath.endsWith(linkPath)) {
            link.classList.add('active');
        } else if(currentPath === '/BookCycle/' && link.textContent.trim() === '首页') {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
}