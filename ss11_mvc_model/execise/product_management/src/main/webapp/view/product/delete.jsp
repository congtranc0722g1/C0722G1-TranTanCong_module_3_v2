<%--
  Created by IntelliJ IDEA.
  User: cong
  Date: 12/1/2022
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove Product</title>
</head>
<body>
<h1>Đang xóa sản phẩm</h1>
<form method="post">
    <p>Mã Sản Phẩm</p>
    <input type="text" name="id" value="${product.getId()}" readonly>
    <p>Nhập Tên Sản Phẩm</p>
    <input type="text" name="name" value="${product.getName()}" readonly>
    <p>Nhập Giá Sản Phẩm</p>
    <input type="text" name="price" value="${product.getPrice()}" readonly>
    <p>Nhập Mô Tả Sản Phẩm</p>
    <input type="text" name="describe" value="${product.getPrice()}" readonly>
    <p>Nhập Tên Công Ty</p>
    <input type="text" name="company" value="${product.getCompany()}" readonly>
    <br>
    <br>
    <button type="submit" class="btn btn-primary">Xóa</button>
</form>
</body>
</html>
