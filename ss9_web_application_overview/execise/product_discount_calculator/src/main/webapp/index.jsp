<%--
  Created by IntelliJ IDEA.
  User: cong
  Date: 11/29/2022
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1></h1>
<form action="/product" method="post">
    <label>Mô tả của sản phẩm</label>
    <input type="text" name="describe">
    <label>Giá niêm yết của sản phẩm</label>
    <input type="text" name="price">
    <label>Tỷ lệ chiết khấu</label>
    <input type="text" name="percent">
    <button type="submit">Tính chiết khấu</button>
</form>
</body>
</html>
