<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css/facility_case.css">
</head>
<body>
<div>
    <h1 class="text-center text-danger">Thêm mới dịch vụ</h1>
    <c:if test="${mess != null}">
        <p style="color: brown; margin-left: 215px">${mess}</p>
    </c:if>
    <div class="row margin-create-edit">
        <form method="post">
            <div class="mb-3">
                <label class="form-label">Mã dịch vụ</label>
                <input type="text" name="id" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Tên Dịch Vụ</label><br>
                <input type="text" name="name" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Diện Tích</label>
                <input type="text" name="area" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Chi Phí Thuê</label>
                <input type="text" name="cost" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Số Người Tối Đa</label> <br>
                <input type="text" name="max-people" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Kiểu Thuê</label>
                <select name="rent-type">
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <option value="${rentType.getId()}">${rentType.getName()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Loại Dịch Vụ</label>
                <select name="facility-type">
                    <c:forEach var="facilityType" items="${facilityTypeList}">
                        <option value="${facilityType.getId()}">${facilityType.getName()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Tiêu Chuẩn Phòng</label>
                <input type="text" name="standard-room" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Mô Tả Tiện Nghi Khác</label>
                <input type="text" name="description-other-convenience" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Diện Tích Hồ Bơi</label>
                <input type="text" name="pool-area" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Số Phòng</label>
                <input type="text" name="number-of-floors" class="form-control">
            </div>
            <a href="/customer">
                <a class="btn btn-secondary" href="/facility" role="button">Hủy</a>
            </a>
            <button type="submit" class="btn btn-primary">Lưu</button>
        </form>
    </div>
</div>
<div class="row text-lg-center fs-4 btn-secondary footer">
    <p>©2022 Furama Resort Danang</p>
</div>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
