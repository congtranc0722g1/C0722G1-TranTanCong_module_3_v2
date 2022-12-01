
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<h1 class="text-center">Thêm mới sản phẩm</h1>
<form action="/product?action=add" method="post">
    <p>Nhập Mã Sản Phẩm</p>
    <input type="text" name="id">
    <p>Nhập Tên Sản Phẩm</p>
    <input type="text " name="name">
    <p>Nhập Giá Sản Phẩm</p>
    <input type="text" name="price">
    <p>Nhập Mô Tả Sản Phẩm</p>
    <input type="text" name="describe">
    <p>Nhập Tên Công Ty</p>
    <input type="text" name="company">
    <br>
    <br>
    <button type="submit" class="btn btn-primary">Lưu</button>
</form>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
