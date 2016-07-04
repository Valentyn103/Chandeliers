<%@ page contentType="text/html;charset=UTF-8" language="java" %><html lang="ru">
<head>
    <title>Авторизация</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <script src="/resources/js/bootstrap.js"></script>
</head>
<body>

<div>
    <li><a href="/">home</a></li>
    <% try {
        if (!session.getAttribute("user").equals("null")) {%>
    <li><a href="/showcart">Hello</a></li>
    <li><a href="/exit">Exit</a></li>
    <% }
    } catch (Exception exp) { %>
    <li class="selected"><a href="/register">Register</a></li>
    <li><a href="/login">Авторизация</a></li>
    <% } %>
    <div>Login in your account</div>
    <form name="login" class="navbar-form navbar-right" action="/login" method="post">
        <div class="form-group">
            <input type="text" name="login" class="form-control" placeholder="Логин"/>
            <input type="password" class="form-control" name="password" placeholder="Пароль"/>

            <input type="submit" class="btn btn-primary fa fa-sign-in" value="Авторизация" />

        </div>

        <div>
        </div>
    </form>
</div>
</body>
</html>
