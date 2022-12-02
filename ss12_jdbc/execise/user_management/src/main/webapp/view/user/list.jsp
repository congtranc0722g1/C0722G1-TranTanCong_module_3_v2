<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<h1 class="text-center"> QUẢN LÝ NGƯỜI DÙNG</h1>
<a href="/user?action=add">
    <button class="btn bg-primary">Thêm Mới Người Dùng</button>
</a>
<form action="/user" method="get" class="d-flex">
    <input value="${country}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập Quốc Gia"
           aria-label="Search" style="width: 150px" name="country">
    <input type="hidden" name="action" value="search">
    <button class="btn btn-success btn-outline-warning" type="submit">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
             viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>
    </button>
</form>
<c:if test="${mess != null}">
    <p>${mess}</p>
</c:if>
<table class="table table-danger">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Country</th>
        <th>Chỉnh Sủa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="user" items="${userList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <a href="/user?action=edit&id=${user.getId()}">
                    <button class="btn btn-primary">Chỉnh Sửa</button>
                </a>
            </td>
            <td>
                <button onclick="infoDelete('${user.getId()}', '${user.getName()}')" type="button"
                        class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<%-- modal delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa Khách Hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/user?action=delete" method="post">
                <div class="modal-body">
                    <input type="text" hidden id="deleteId" name="id">
                    <span>Bạn có muốn xóa người dùng</span> <span style="color: red" id="deleteName"></span> <span>không ?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>

