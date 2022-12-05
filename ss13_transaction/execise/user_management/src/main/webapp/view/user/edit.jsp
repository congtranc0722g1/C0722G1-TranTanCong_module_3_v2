<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h1>CHỈNH SỬA NGƯỜI DÙNG</h1>
<c:if test="${mess != null}">
    <p>${mess}</p>
</c:if>
<form method="post">
    <p>Nhập Tên</p>
    <input type="text" name="name" value="${user.getName()}">
    <p>Nhập Giá Email</p>
    <input type="text" name="email" value="${user.getEmail()}">
    <p>Nhập Quốc Gia</p>
    <input type="text" name="country" value="${user.getCountry()}">
    <br>
    <br>
    <button type="submit" class="btn btn-primary">Cập Nhật</button>
</form>
</body>
</html>
