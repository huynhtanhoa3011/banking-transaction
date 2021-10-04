<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>

    <style>
        label.error{
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
    <script src="/resource/js/jquery.validate.min.js"></script>
</head>
<body class="bg-warning p-2 text-secondary bg-opacity-25">
<div class="container">
    <div class="table-title mb-4">
        <div class="row">
            <div class="row">
                <div class="col-sm-6" style="margin-left: 500px">
                    <h1>Create customer</h1>
                    <h3 style="margin-left: 25px">
                        <a href="/customers"> Black list Customer</a>
                    </h3>
                </div>
            </div>
        </div>
    </div>
    <form id="frmCreateCustomer" method="post">
        <fieldset class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="col-md-6">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" name="email">
            </div>
            <div class="col-md-6">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone">
            </div>
            <div class="col-md-6">
                <label class="form-label">Address</label>
                <input type="text" class="form-control" name="address">
            </div>
            <div class="col-md-12" style="margin-left: 580px">
                <button type="submit" id="btnCreateCustomer" class="btn btn-outline-primary">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Create customer
                </button>
            </div>
        </fieldset>
    </form>
    <div class="message">
        <c:if test='${requestScope["success"] != null}'>
            <div class="alert alert-success" role="alert" style="position: fixed; bottom: 0; right: 0; left: 0">
                    ${requestScope["success"]}
            </div>

        </c:if>
        <c:if test='${requestScope["error"] != null}'>
            <div class="alert alert-danger" role="alert" style="position: fixed; bottom: 0; right: 0; left: 0">
                <strong> ${requestScope["error"]}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
    </div>
</div>
<script>
    $(".alert-success").fadeOut(4000);
    $(".alert-danger").fadeIn();
    $(".close").click(function() {
        $(".alert-danger").fadeOut();
    })
</script>
</body>
</html>
