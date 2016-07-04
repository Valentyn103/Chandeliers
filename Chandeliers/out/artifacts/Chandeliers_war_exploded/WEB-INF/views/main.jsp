<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>Люстры</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <script src="/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="navbar navbar-inverse"
             style="background-image: linear-gradient(to bottom, white 0%, white 100%); margin-bottom: 0px; border: 0px">
            <div class="container">
                <div class="nav navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Магазины</a></li>
                        <li><a href="#">Доставка</a></li>
                        <li><a href="#">Оплата</a></li>
                        <li><a href="#">О компании</a></li>
                        <li><a href="#">Контакты</a></li>
                    </ul>

                    <% try {
                        if (!session.getAttribute("email").equals("null")) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/showcart">Личный кабинет</a></li>
                        <li><a href="/exit">Выход</a></li>
                    </ul>
                    <% }

                    } catch (Exception exp) { %>
                    <li class="dropdown navbar-right nav navbar-nav">
                        <a href="#" class="dropdown-toggle" style="padding-top: 15px;" data-toggle="dropdown">Здравствуйте,
                            войдите в личный кабинет<span class="caret"></span></a>
                        <ul class="dropdown-menu" style="width: 310px; padding-left: 15px;  padding-right: 15px">
                            <li>
                                <form name="login" class="form-signin" action="/login" method="post">
                                    <h2 class="form-signin-heading">Вход в интернет-магазин</h2>
                                    <label for="inputEmail" class="sr-only">Эл. почта</label>
                                    <input type="email" id="inputEmail" class="form-control" name="email"
                                           placeholder="Эл. почта" required autofocus>
                                    <label for="inputPassword"
                                           class="sr-only">Пароль</label>
                                    <input style="margin-top: 10px;" type="password" id="inputPassword"
                                           class="form-control" name="password"
                                           placeholder="Пароль" required>
                                    <button style="margin-top: 10px;" class="btn btn-lg btn-primary btn-block"
                                            type="submit">Войти
                                    </button>
                                </form>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/register" style="padding: 0px 0px 10px 0px">
                                    <button class="btn btn-lg btn-success btn-block"
                                            type="button">Регистрация
                                    </button>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <% } %>
                </div>
            </div>
        </div>
        <div class="navbar navbar-inverse"
             style="background-image: linear-gradient(to bottom, #3c3c3c 0%, purple 100%);">
            <div class="container">
                <h1 style="color:red;">VIP</h1>
            </div>
        </div>
    </div>
</div>
</body>
</html>
