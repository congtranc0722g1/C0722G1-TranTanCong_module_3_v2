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
<form action="/product" method="get" class="d-flex">
    <input value="${name}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập tên"
           aria-label="Search" style="width: 150px" name="name">
    <input type="hidden" name="action" value="search">
    <button class="btn btn-success btn-outline-warning" type="submit">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
             viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>
    </button>
</form>
<table class="table table-danger">
    <tr>
        <th>STT</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Công Ty</th>
        <th>Chỉnh Sửa</th>
        <th>Xóa</th>
        <th>Chi Tiết</th>
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
            <td>
                <a href="/product?action=details&id=${product.getId()}">
                    <button class="btn btn-success">Chi tiết</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
