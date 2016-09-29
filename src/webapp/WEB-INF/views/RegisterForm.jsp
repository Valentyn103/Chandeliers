<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html lang="ru">
<head>
    <title>Регистрация</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/mycss.css"/>
    <script src="/resources/js/bootstrap.js"></script>
</head>
<body>
${Hello}
<div class="container-fluid">
    <div class="row">
        <div class="navbar navbar-inverse"
             style="background-image: linear-gradient(to bottom, white 0%, white 100%); margin-bottom: 0px; border: 0px">
            <div class="container">
                <div class="nav navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/shops">Магазины</a></li>
                        <li><a href="/delivery">Доставка</a></li>
                        <li><a href="/payment">Оплата</a></li>
                        <li><a href="/company">О компании</a></li>
                    </ul>
                    <% try {
                        if (!session.getAttribute("email").equals("null")) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/personal">Личный кабинет</a></li>
                        <li><a href="/auth/logout">Выход</a></li>
                    </ul>
                    <% }

                    } catch (Exception exp) { %>
                    <li class="dropdown navbar-right nav navbar-nav">
                        <a href="#" class="dropdown-toggle" style="padding-top: 15px;" data-toggle="dropdown">Здравствуйте,
                            войдите в личный кабинет<span class="caret"></span></a>
                        <ul class="dropdown-menu" style="width: 310px; padding-left: 15px;  padding-right: 15px">
                            <li>
                                <form name="login" class="form-signin" action="/auth/login" method="post">
                                    <h2 class="form-signin-heading">Вход в интернет-магазин</h2>
                                    <label for="username" class="sr-only">Эл. почта</label>
                                    <input id="username" type="email" class="form-control" name="j_username" value=""
                                           placeholder="Эл. почта" required autofocus>

                                    <input id="password" type="password" class="form-control" name="j_password"
                                           data-toggle="password" placeholder="password">
                                    <label for="password"
                                           class="sr-only">Пароль</label>
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
             style="background-image: linear-gradient(to bottom, #006ac5 0%, #006ac5 100%);">
            <div class="container" style="display: flex">
                <h1><a href="/" style="color:white; text-decoration: none; cursor: auto;">VIP</a></h1>
                <div class="col-lg-6" style="margin-top: 20px; margin-left: 10px">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Поиск">
                        <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Поиск <span class="glyphicon glyphicon-search"/> </button>
                      </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <form class="form-horizontal" name="register" action="/register" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="email">Эл. почта</label>
                            <div class="col-md-4">
                                <input id="email" name="email" type="email" class="form-control" placeholder="Эл. почта"
                                       class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="UserPassword">Пароль</label>
                            <div class="col-md-4">
                                <input id="UserPassword" name="UserPassword" type="password" class="form-control" placeholder="Пароль"
                                       class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="UserRePassword">Подтверждение пароля</label>
                            <div class="col-md-4">
                                <input id="UserRePassword" name="UserRePassword" type="password"
                                       placeholder="Подтверждение пароля" class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="name">Фамилия Имя Отчество</label>
                            <div class="col-md-4">
                                <input id="name" name="name" type="text" placeholder="Фамилия Имя Отчество"
                                       class="form-control input-md">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="number">Телефон</label>
                            <div class="col-md-4">
                                <input id="number" name="number" type="tel" placeholder="Телефон"
                                       class="form-control input-md">
                            </div>
                        </div>

                        <button  style="margin-top: 10px;" class=" btn btn-lg btn-primary center-block"
                                 type="submit">Зарегистрироваться</button>

                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<hr>
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <ul class="list-unstyled list-inline pull-left">
                <li><a href="/shops">Магазины</a></li>
                <li><a href="/delivery">Доставка</a></li>
                <li><a href="/payment">Оплата</a></li>
                <li><a href="/company">О компании</a></li>
            </ul>
        </div>
        <div class="col-xs-4">
            <p class="text-muted pull-right">© 2016 VIP. All rights reserved</p>
        </div>
    </div>
</div>
</body>
</html>
