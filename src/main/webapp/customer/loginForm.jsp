<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../login/text.css">
</head>
<body>
<div class="login-page">
    <div>
        <p>
            <c:if test="${requestScope['error'] != null}">
                <span><c:out value="${requestScope['error']}" /></span>
            </c:if>
        </p>
    </div>
    <div class="form">
        <form method="post" class="login-form">
            <input name="username" type="text" placeholder="username"/>
            <input name="password" type="password" placeholder="password"/>
            <button type="submit">login</button>
            <p class="message">Not registered? <a href="#">Create an account</a></p>
        </form>
    </div>
</div>
<script>
    $('.message a').click(function () {
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
</script>
</body>
</html>
