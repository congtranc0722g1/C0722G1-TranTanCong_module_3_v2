<%--
  Created by IntelliJ IDEA.
  User: cong
  Date: 12/1/2022
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Chỉnh Sửa Sản Phẩm</h1>
<form action="/product?action=edit" method="post">
    <p>Nhập Tên Sản Phẩm</p>
    <input type="text" name="name" value="${product.getName()}">
    <p>Nhập Giá Sản Phẩm</p>
    <input type="text" name="price" value="${product.getPrice()}">
    <p>Nhập Mô Tả Sản Phẩm</p>
    <input type="text" name="describe" value="${product.getPrice()}">
    <p>Nhập Tên Công Ty</p>
    <input type="text" name="company" value="${product.getCompany()}">
    <br>
    <br>
    <button type="submit" class="btn btn-primary">Cập Nhật</button>
</form>
</body>
</html>
