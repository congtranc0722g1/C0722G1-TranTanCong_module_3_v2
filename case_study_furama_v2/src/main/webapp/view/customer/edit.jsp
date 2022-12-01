
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css/customer_case.css">
</head>
<body class="edit-background">
<div class="row header">
    <div class="col-lg-2">
        <img class="icon" id="logo" src="image/zyro-image%20(2).png" height="100" width="60"/>
    </div>

    <div class="col-lg-8">
        <div class="row">
            <div class="col-lg-8 text-center top">
                <p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-geo-alt"
                         viewBox="0 0 16 16">
                        <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                        <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                    103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam
                </p>
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
<div>
    <h1 class="text-center text-danger">Chỉnh sửa khách hàng</h1>
    <c:if test="${mess != null}">
        <p style="color: brown; margin-left: 215px">${mess}</p>
    </c:if>
    <div class="row margin-create-edit">
        <form method="post">
            <div class="mb-3">
                <label class="form-label">Loại Khách Hàng</label>
                <select name="customer-type-id">
                    <c:forEach var="customerType" items="${customerTypeList}">
                        <option value="${customerType.id}"
                                <c:if test="${customerType.id == customer.getCustomerTypeId()}">selected</c:if>>${customerType.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Họ Tên</label>
                <input type="text" name="name" value="${customer.getName()}" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Ngày Sinh</label>
                <input type="date" name="birthday" value="${customer.getDateOfBirth()}" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Giới Tính</label> <br>
                <label><input type="radio" name="gender" value="true" <c:if test="${customer.isGender()}">checked</c:if>> Nam</label>
                <label><input type="radio" name="gender" value="false" <c:if test="${!customer.isGender()}">checked</c:if>> Nữ</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Số CMND</label>
                <input type="text" name="id-card" value="${customer.getIdCard()}" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Số Điện Thoại</label>
                <input type="text" name="phone-number" value="${customer.getPhone()}" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="text" name="email" value="${customer.getEmail()}" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Địa chỉ</label>
                <input type="text" name="address" value="${customer.getAddress()}" class="form-control">
            </div>
            <a href="/customer">
                <a class="btn btn-secondary" href="/customer" role="button">Hủy</a>
            </a>
            <button type="submit" class="btn btn-primary">Cập Nhật</button>
        </form>
    </div>
</div>
<div class="row text-lg-center fs-4 btn-secondary footer">
    <p>©2022 Furama Resort Danang</p>
</div>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
