
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<html>
<head>
    <title>Transfer</title>
    <style>
        .message{
            color:white;
        }
        .error{
            color: red;
            font-family: Arial;
            font-weight: bold;
        }
        .success{
            color: lightgreen;
            font-weight: bold;
            font-family: Arial;
        }

    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
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
    <script src="/resource/js/jquery.validate.min.js"></script>
</head>
<body>
<center>

</center>
<div align="center" class="container">
    <form class="needs-validation" method="post">
        <h2>Transfer Transaction</h2>
        <h4>
            <a href="/customers">Back to customer list</a>
        </h4>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="depoId">ID Sender</label>
                <input type="number" class="form-control"  name="depoId" id="depoId" value="<c:out value='${customer.getId()}'/>">
            </div>
            <div class="col-md-4 mb-3">
                <label >Name</label>
                <input  type="text" name="name" id="name" size="45" class="form-control"
                        value="<c:out value='${customer.getName()}'/>"  readonly>
            </div>
            <div class="col-md-4 mb-3">
                <label >Balance</label>
                <input  type="number" name="salary" class="form-control" value="<c:out value='${customer.getBalance()}'/>" readonly>

            </div>
        </div>
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label >ID Receiver</label>
                <input type="number" name="withId" id="withId" class="form-control" required >
            </div>
            <div class="col-md-3 mb-3">
                <label>Money</label>
                <input onchange="myFunction()" type="number" name="balance" id="balance" size="15" class="form-control" required/>
            </div>
        </div>
        <div class="needs-validation">
            <button class="btn btn-primary" type="submit">Transfer Transaction</button>
        </div>
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
</body>
</html>