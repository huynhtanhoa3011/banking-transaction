<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body>
<h1 style="margin-left: 600px">Customer Infomation</h1>
<p>
    <a href="/customers" style="margin-left: 680px">Back to customer list</a>
</p>
<%--<form method="post" >--%>
<%--    <h3>Are you sure?</h3>--%>
<%--    <fieldset>--%>
<%--        <legend>Customer information</legend>--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>Name: </td>--%>
<%--                <td>--%>
<%--                    <input type="text" value="<c:out value="${customer.name}"/>"/>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Email: </td>--%>
<%--                <td><input type="text" value="<c:out value="${customer.email}"/>"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Phone: </td>--%>
<%--                <td>--%>
<%--                    <input type="text" value="<c:out value="${customer.phone}"/>"/>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Address: </td>--%>
<%--                <td><input type="text" value="<c:out value="${customer.address}"/>"/></td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td><input type="submit" value="Delete customer"></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </fieldset>--%>
<%--</form>--%>
<form id="frmSuspensionCustomer" method="post">
    <fieldset class="row g-3">
        <input type="hidden" name="id" id="id" value="5">
        <div class="col-md-6">
            <label class="form-label">Full name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" value="<c:out value="${customer.name}"/>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<c:out value="${customer.email}"/>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="<c:out value="${customer.phone}"/>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="<c:out value="${customer.address}"/>">
        </div>


        <div class="col-md-12" style="margin-left: 700px">
            <button type="submit" value="Delete customer" id="btnSuspendedCustomer" class="btn btn-outline-danger">
                <i class="fa fa-ban" aria-hidden="true"></i>
                Delete
            </button>
        </div>

    </fieldset>
</form>
</body>
</html>