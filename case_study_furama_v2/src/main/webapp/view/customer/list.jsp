<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.0.2-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css/customer_css.css">
</head>
<body>
<div class="row header">
    <div class="col-lg-2">
        <img class="icon" id="logo" src="/image/zyro-image%20(2).png" height="150" width="90"/>
    </div>

    <div class="col-lg-8">
        <div class="row">
            <div class="col-lg-8 text-center top">
                <p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt"
                         viewBox="0 0 16 16">
                        <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                        <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                    103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</p>
            </div>

            <div class="col-lg-4 text-center top">
                <p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-telephone-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                    </svg>
                    84-236-3847 333/888
                </p>
            </div>
        </div>
    </div>

    <div class="col-lg-2 text-end top">
        <p class="login">Trần Tấn Công</p>
    </div>
</div>
<div class="background-main">
<div class="row text-danger text-center">
    <h1>QUẢN LÝ KHÁCH HÀNG</h1>
</div>
<div class="row main">
    <div class="col-lg-2">
        <a href="/customer">
            <button class="btn btn-warning btn-outline-danger">Làm mới trang</button>
        </a>
    </div>

    <div class="col-lg-3">
        <a href="/customer">
            <button class="btn btn-warning btn-outline-danger">Quay lại trang chủ</button>
        </a>
    </div>

    <div class="col-lg-3">
        <a href="/customer">
            <button class="btn btn-warning btn-outline-danger">Thêm mới khách hàng</button>
        </a>
    </div>

    <div class="col-lg-4">
        <form action="/customer" method="get" class="d-flex">
            <input value="${name_search}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập tên"
                   aria-label="Search" style="width: 150px" name="name">
            <input value="${address_search}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập địa chỉ"
                   aria-label="Search" style="width: 150px" name="address">
            <input type="hidden" name="action" value="search">
            <button class="btn btn-success btn-outline-warning" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
        </form>
    </div>
</div>

<div class="row margin">
    <table class="table table-striped table-bordered" id="tableCustomer" style="width: 100%">
        <thead>
        <tr class="align text-center">
            <th>STT</th>
            <th>Loại Khách</th>
            <th>Họ Tên</th>
            <th>Ngày Sinh</th>
            <th>Giới Tính</th>
            <th>Số CMND</th>
            <th>Số Điện Thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Chỉnh sửa</th>
            <th>Xóa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr class="align text-center">
                <td>${status.count}</td>
                <td>${customer.getCustomerTypeId()}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getDateOfBirth()}</td>
                <td>${customer.isGender()}</td>
                <td>${customer.getIdCard()}</td>
                <td>${customer.getPhone()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td>
<%--                    <a href="https://chuanseoweb.com/" class="csw-btn-button" rel="nofollow" target="_blank" >Chỉnh sửa</a>--%>
                    <a class="btn btn-primary" style="width: 100px" href="/benh-an?action=edit&id=${customer.id}" role="button">Chỉnh Sửa</a>
                </td>
                <td><a>
                    <!-- Button trigger modal -->
                    <button onclick="infoDelete('${customer.getId()}', '${customer.getName()}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Xóa
                    </button>
                </a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<div class="row text-lg-center fs-4 btn-secondary">
    <p>©2022 Furama Resort Danang</p>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
    }
</script>
<script src="../../bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
