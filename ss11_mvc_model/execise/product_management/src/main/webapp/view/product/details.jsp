<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
</head>
<body>
<h1>Thông tin chi tiết sản phẩm</h1>
<p>Mã Sản Phẩm: ${product.getId()}</p>
<p>Tên Sản Phẩm: ${product.getName()}</p>
<p>Giá Sản Phẩm: ${product.getPrice()}</p>
<p>Mô Tả: ${product.getDescribe()}</p>
<p>Hãng Sản Xuất: ${product.getCompany()}</p>
<a href="/product">
    <button>Xong</button>
</a>
</body>
</html>
