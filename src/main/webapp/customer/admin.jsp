<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="/layout/head.jsp" %>
<body>
<div id="wrapper">
<%--    <%@include file="/layout/toolbar.jsp" %>--%>
<%--    <%@include file="/layout/left-sidebar.jsp" %>--%>

    <%@include file="/layout/navbar-custom.jsp" %>
    <%@include file="/layout/left-side-menu.jsp" %>
    <!-- Start Page Content here -->
    <%--    <div class="container">--%>
    <div class="content-page">
        <div class="content">
            <!-- Start container-fluid -->
            <div class="container-fluid">
<%--                <div class="row">--%>
                    <div class="col-sm-7" style="text-align: center">
                        <a href="/customers?action=create" class="btn btn-success"><i class="fa fa-plus-square-o"
                                                                                      aria-hidden="true"></i> <span>Add New Customer</span></a>
                        <a href="/transfers" class="btn btn-success"><i class="fa fa-history"
                                                                        aria-hidden="true"></i> <span>Transfer money Information</span></a><br>
                    </div>
                    <form class="app-search" method="post">
                        <div class="app-search-box">
                            <div class="input-group">
                                <input name="search" style="margin-left: 800px" type="text" class="form-control" placeholder="Search...">
                                <input type="hidden" name="action" value="search">
                                <div class="input-group-append">
                                    <button class="btn" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <h5 class="mt-0 font-14 mb-3" style="margin-left: 400px">THÔNG TIN KHÁCH HÀNG</h5>
                                <div class="table-responsive">
                                    <table class="table table-hover mails m-0 table table-actions-bar table-centered">
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
                                        <c:forEach var="user" items="${listCustomer}">
                                            <tr>
                                                <td><c:out value="${user.getId()}"/></td>
                                                <td><c:out value="${user.getName()}"/></td>
                                                <td><c:out value="${user.getEmail()}"/></td>
                                                <td><c:out value="${user.getPhone()}"/></td>
                                                <td><c:out value="${user.getAddress()}"/></td>
                                                <td><c:out value="${user.getBalance()}"/></td>
                                                <td><a class="btn btn-success"
                                                       href="/customers?action=deposits&id=${user.id}"
                                                       title="Deposit">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                                </a></td>
                                                <td><a class="btn btn-warning"
                                                       href="/customers?action=withdraws&id=${user.id}"
                                                       title="Withdraw">
                                                    <i class="fa fa-minus" aria-hidden="true"></i>
                                                </a></td>
                                                <td><a class="btn btn-primary"
                                                       href="/customers?action=transfer&id=${user.id}"
                                                       title="Transfer">
                                                    <i class="fa fa-exchange" aria-hidden="true"></i>
                                                </a></td>
                                                <td><a class="btn btn-info" href="/customers?action=edit&id=${user.id}"
                                                       title="Edit">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </a></td>
                                                <td><a class="btn btn-danger" id="deleteAll"
                                                       href="/customers?action=delete&id=${user.id}"
                                                       title="Delete">
                                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                </a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

<%--                </div>--%>
                <%--    </div>--%>
            </div>
        </div>
    </div>

    <!-- END content-page -->
    <%@include file="/layout/right-sidebar.jsp" %>
    <%@include file="/layout/right-bar.jsp" %>
</div>
</body>
</html>
