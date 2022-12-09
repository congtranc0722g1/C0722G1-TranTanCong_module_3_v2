<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Employe</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="../../css/employee_case.css">
</head>
<body>
<div class="row header">
    <div class="col-lg-2">
        <img class="icon" id="logo" src="../../image/zyro-image%20(2).png" height="100" width="60"/>
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
        <h1>QUẢN LÝ NHÂN VIÊN</h1>
    </div>
    <div class="row main">
        <div class="col-lg-2">
            <a href="/employee">
                <button class="btn btn-warning btn-outline-danger">Làm mới trang</button>
            </a>
        </div>

        <div class="col-lg-2">
            <a href="../../index.jsp">
                <button class="btn btn-warning btn-outline-danger">Quay lại trang chủ</button>
            </a>
        </div>

        <div class="col-lg-2">
            <a href="#">
                <button class="btn btn-warning btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal1">Thêm mới nhân viên</button>
            </a>
        </div>

        <div class="col-lg-6">
            <form class="d-flex">
                <input value="${name}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập tên"
                       aria-label="Search" style="width: 150px" name="name">
                <input value="${address}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập địa chỉ"
                       aria-label="Search" style="width: 150px" name="address">
                <input value="${divisionName}" class="form-control me-2 justify-content-between" type="text" placeholder="Nhập bộ phận"
                       aria-label="Search" style="width: 150px" name="division">
                <input type="hidden" name="action" value="search">
                <button class="btn btn-success btn-outline-warning" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg></button>
            </form>
        </div>
    </div>
<%--    <c:if test="${mess != null}">--%>
<%--        <p style="color: brown; margin-left: 23px">${mess}</p>--%>
<%--    </c:if>--%>
    <p id="mess" style="color: brown; margin-left: 23px">${mess}</p>
    <div class="row margin">
        <table class="table table-striped table-bordered" id="tableCustomer" style="width: 100%">
            <thead>
            <tr class="align text-center">
                <th>STT</th>
                <th>Họ Tên</th>
                <th>Ngày Sinh</th>
                <th>Số CMND</th>
                <th>Lương</th>
                <th>Số Điện Thoại</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Vị trí</th>
                <th>Trình Độ</th>
                <th>Bộ Phận</th>
                <th>Chỉnh sửa</th>
                <th>Xóa</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="employee" items="${employeeList}" varStatus="status">
                <tr class="align text-center">
                    <td>${status.count}</td>
                    <td>${employee.getName()}</td>
                    <td>${employee.getDateOfBirth()}</td>
                    <td>${employee.getIdCard()}</td>
                    <td>${employee.getSalary()}</td>
                    <td>${employee.getPhone()}</td>
                    <td>${employee.getEmail()}</td>
                    <td>${employee.getAddress()}</td>
                    <td>${employee.getPosition().getName()}</td>
                    <td>${employee.getEducationDegree().getName()}</td>
                    <td>${employee.getDivision().getName()}</td>
                    <td>
                        <button onclick="infoEdit('${employee.getId()}', '${employee.getName()}', '${employee.getDateOfBirth()}', '${employee.getIdCard()}', '${employee.getSalary()}', '${employee.getPhone()}', '${employee.getEmail()}', '${employee.getAddress()}', '${employee.position.id}', '${employee.educationDegree.id}', '${employee.division.id}')" type="button"
                                class="btn btn-primary" style="width: 100px" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                            Chỉnh sửa
                        </button>
                    </td>
                    <td>
                        <button onclick="infoDelete('${employee.getId()}', '${employee.getName()}')" type="button"
                                class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=delete" method="post">
            <div class="modal-body">
                <input type="text" hidden id="deleteId" name="id">
                <span>Bạn có muốn xóa khách hàng</span> <span style="color: red" id="deleteName"></span> <span>không ?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary">Xóa</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal add -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Thêm mới nhân viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=add" method="post">
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Họ Tên</label>
                    <input type="text" name="name" class="form-control width-form" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ngày Sinh</label>
                    <input type="date" name="birthday" class="form-control width-form" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số CMND</label>
                    <input type="text" name="id-card" class="form-control width-form" required pattern="[0-9]{12}" title="Số cmnd phải là 12 số">
                </div>
                <div class="mb-3">
                    <label class="form-label">Lương</label>
                    <input type="text" name="salary" class="form-control width-form" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số Điện Thoại</label>
                    <input type="text" name="phone-number" class="form-control width-form" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="text" name="email" class="form-control width-form" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Địa chỉ</label>
                    <input type="text" name="address" class="form-control width-form" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Vị Trí</label> <br>
                    <select name="position">
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.getId()}">${position.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Trình Độ</label> <br>
                    <select name="education-degree">
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.getId()}">${educationDegree.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Bộ Phận</label> <br>
                    <select name="division">
                        <c:forEach var="division" items="${divisionList}">
                            <option id="" value="${division.getId()}">${division.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary">Lưu</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal edit -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Chỉnh Sửa nhân viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=edit" method="post">
            <div class="modal-body">
                <input type="text" hidden id="editId" name="id">
                <div class="mb-3">
                    <label class="form-label">Họ Tên</label>
                    <input  type="text" name="name" id="name" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ngày Sinh</label>
                    <input type="date" name="birthday" id="day-of-birth" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Số CMND</label>
                    <input type="text" name="id-card" id="id-card" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Lương</label>
                    <input type="text" name="salary" id="salary" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Số Điện Thoại</label>
                    <input type="text" name="phone-number" id="phone" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="text" name="email" id="email" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Địa chỉ</label>
                    <input type="text" name="address" id="address" class="form-control width-form">
                </div>
                <div class="mb-3">
                    <label class="form-label">Vị Trí</label> <br>
                    <select name="position" id="position-id-edit">
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.getId()}">${position.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Trình Độ</label> <br>
                    <select name="education-degree" id="education-degree-id-edit">
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.getId()}">${educationDegree.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Bộ Phận</label> <br>
                    <select name="division" id="division-id-edit">
                        <c:forEach var="division" items="${divisionList}">
                            <option value="${division.getId()}">${division.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary">Cập Nhật</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="row text-lg-center fs-4 btn-secondary">
    <p>©2022 Furama Resort Danang</p>
</div>
<script>
    function infoEdit(id, name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId) {
        document.getElementById("editId").value = id;
        document.getElementById("name").value = name;
        document.getElementById("day-of-birth").value = dateOfBirth;
        document.getElementById("id-card").value = idCard;
        document.getElementById("salary").value = salary;
        document.getElementById("phone").value = phone;
        document.getElementById("email").value = email;
        document.getElementById("address").value = address;
        document.getElementById("position-id-edit").value = positionId;
        document.getElementById("education-degree-id-edit").value = educationDegreeId;
        document.getElementById("division-id-edit").value = divisionId;


    }

    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>$(document).ready(function () {
    $('#tableCustomer').dataTable({
        "dom": 'lrtip',
        "lengthChange": false,
        "pageLength": 5
    });
});
</script>
<script>
    setTimeout(function(){ close(document.getElementById("mess").style.display= "none") }, 3000);
</script>
</body>
</html>
