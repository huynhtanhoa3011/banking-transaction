<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Banking Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
    <style>
        body {
            /*background-image: url("https://i2.wp.com/data.kenhsinhvien.net/files/2012/10/24/KenhSinhVien-tuyetroi15.gif");*/
            background-color: honeydew;
        }
        label.error {
            color: red;
        }
    </style>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body>
<div class="container">
    <div style="text-align: center">
        <h3 style="color: #8000ff">DANH SÁCH KHÁCH HÀNG TÌM THẤY</h3>
        <a href="/customers">Back to customer list</a>
    </div>

<%--    <div class="table-title">--%>
<%--        <div class="row">--%>
<%--            <div class="col-sm-5" style="color: red ">--%>
<%--                <h2><i class="fa fa-university" aria-hidden="true"></i>BANKING MANAGER</h2>--%>
<%--            </div>--%>
<%--            <div class="col-sm-7">--%>
<%--                <a href="/customers?action=create" class="btn btn-success"><i class="fa fa-plus-square-o" aria-hidden="true"></i> <span>Add New Customer</span></a>--%>
<%--                <a href="/transfers" class="btn btn-success"><i class="fa fa-history" aria-hidden="true"></i> <span>Transfer money Information</span></a>--%>
<%--&lt;%&ndash;                <form method="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input name="search" type="text">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="hidden" name="action" value="search">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="submit" class="btn btn-danger">Search</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </form>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <table class="table table-striped table-hover table-light">
        <thead>
        <tr>
            <th class="table-warning">Id</th>
            <th class="table-warning">Name</th>
            <th class="table-warning">Email</th>
            <th class="table-warning">Phone</th>
            <th class="table-warning">Address</th>
            <th class="table-warning">Balance</th>
            <th colspan="5" class="table-warning" style="text-align: center">Action</th>
        </tr>
        </thead>

        <c:forEach var="user" items="${searchList}">
            <tr>
                <td><c:out value="${user.getId()}"/></td>
                <td><c:out value="${user.getName()}"/></td>
                <td><c:out value="${user.getEmail()}"/></td>
                <td><c:out value="${user.getPhone()}"/></td>
                <td><c:out value="${user.getAddress()}"/></td>
                <td><c:out value="${user.getBalance()}"/></td>
                <td><a class="btn btn-success" href="/customers?action=deposits&id=${user.id}" title="Deposit">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a></td>
                <td><a class="btn btn-warning" href="/customers?action=withdraws&id=${user.id}" title="Withdraw">
                    <i class="fa fa-minus" aria-hidden="true"></i>
                </a></td>
                <td><a class="btn btn-primary" href="/customers?action=transfer&id=${user.id}" title="Transfer">
                    <i class="fa fa-exchange" aria-hidden="true"></i>
                </a></td>
                <td><a class="btn btn-info" href="/customers?action=edit&id=${user.id}" title="Edit">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                </a></td>
                <td><a class="btn btn-danger" id="deleteAll" href="/customers?action=delete&id=${user.id}"
                       title="Delete">
                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                </a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>