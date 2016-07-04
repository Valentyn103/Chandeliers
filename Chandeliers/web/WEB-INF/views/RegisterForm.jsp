<%@ page contentType="text/html;charset=UTF-8" language="java" %><html lang="ru">
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <script src="/resources/js/bootstrap.js"></script>
</head>
<body>
<li><a href="/">home</a></li>
<% try {
    if (!session.getAttribute("user").equals("null")) {%>
<li><a href="/showcart">Hello</a></li>
<li><a href="/Exit">exit</a></li>
<% }
} catch (Exception exp) { %>
<li class="selected"><a href="/register">Register</a></li>
<li><a href="/login">Login</a></li>
<% } %>

<div>
    <div>create new account</div>
    <form name="register" action="/register" method="post">
        <div class="form_row">
            <label><strong>Login:</strong></label>
            <input type="text" name="login"/>
        </div>


        <div>
            <label><strong>Password:</strong></label>
            <input type="password" name="password"/>
        </div>

        <div>
            <label><strong>RePassword:</strong></label>
            <input type="password" name="repassword"/>
        </div>

        <div>
            <label><strong>Name:</strong></label>
            <input type="text" name="name"/>
        </div>


        <div>
            <label><strong>Email:</strong></label>
            <input type="text" name="email"/>
        </div>
        <div>
            <label><strong>Number:</strong></label>
            <input type="text" name="number"/>
        </div>
        <div>
            <input type="submit" name="btnlogin" value="Register"/>
        </div>
    </form>
</div>
</body>
</html>
