<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/ss10_customer.css">
</head>
<body>
<h1 class="text-center">Danh Sách Khách Hàng</h1>
<table class="table table-striped table-bordered">
    <tr class="text-center">
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr class="text-center">
            <td>${status.count}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getDateOfBirth()}</td>
            <td>${customer.getAddress()}</td>
            <td><img src="${customer.getImage()}" class="image-table"></td>
        </tr>
    </c:forEach>
</table>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
