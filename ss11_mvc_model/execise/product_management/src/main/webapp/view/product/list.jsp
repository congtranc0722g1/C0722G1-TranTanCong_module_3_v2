<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<h1 class="text-center"> Quản Lý Sản Phẩm</h1>
<a href="/product?action=add">
    <button class="btn bg-primary">Thêm mới sản phẩm</button>
</a>
<table class="table table-danger">
    <tr>
        <th>STT</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Công Ty</th>
        <th>Chỉnh Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getCompany()}</td>
            <td>
                <a href="/product?action=edit&id=${product.getId()}">
                    <button class="btn btn-primary">Chỉnh Sửa</button>
                </a>
            </td>
            <td>
                <a href="/product?action=delete&id=${product.getId()}">
                    <button class="btn btn-warning">Xóa</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
