<%--
  Created by IntelliJ IDEA.
  User: cong
  Date: 12/2/2022
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>THÊM MỚI NGƯỜI DÙNG</h1>
<a href="/user">
    <button>Quay về trang list</button>
</a>
<c:if test="${mess != null}">
    <p>${mess}</p>
</c:if>
<form method="post">
    <p>Nhập Tên</p>
    <input type="text" name="name">
    <p>Nhập Email</p>
    <input type="text" name="email">
    <p>Nhập Quốc Gia</p>
    <input type="text" name="count">
    <button type="submit">Lưu</button>
</form>
</body>
</html>
