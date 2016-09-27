<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Информация</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/mycss.css"/>
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
                    <sec:authorize access="isAuthenticated()">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/personal">Личный кабинет</a></li>
                            <li><a href="/auth/logout">Выход</a></li>
                        </ul>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <li class="dropdown navbar-right nav navbar-nav">
                            <a href="#" class="dropdown-toggle" style="padding-top: 15px;" data-toggle="dropdown">Здравствуйте,
                                войдите в личный кабинет<span class="caret"></span></a>
                            <ul class="dropdown-menu" style="width: 310px; padding-left: 15px;  padding-right: 15px">
                                <li>
                                    <form name="login" class="form-signin" action="/auth/login" method="post">
                                        <h2 class="form-signin-heading">Вход в интернет-магазин</h2>
                                        <label for="username" class="sr-only">Эл. почта</label>
                                        <input id="username" type="email" class="form-control" name="j_username"
                                               value=""
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
                    </sec:authorize>
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
                <div class="col-lg-6">
                    <button
                            class="btn" style="float: right; margin-top:12px; background-color: #006ac5;"
                            data-toggle="modal" data-target="#modal"><i
                            class="glyphicon glyphicon-shopping-cart" style="font-size: 35px; color:white;"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-3">
                    <img src="${image}" alt="" style="width: 290px; height: 290px;">
                </div>
                <div class="col-sm-5 col-md-5" style="margin-left: 15px;">
                    <h1 style="margin-top: 0px;">${category} ${firm} ${article}</h1>
                    <hr/>
                    <h1>${unitcost} грн
                        <form name="buy" action="/buy/${article}" method="post">

                            <button type="submit" style="float:right;"
                                    class="btn btn-primary btn-lg" style="float: right">Купить <i
                                    class="glyphicon glyphicon-shopping-cart"></i></button>
                            <div class="col-md-3" style="float: right;">
                                <input id="quantity" name="quantity" type="number" placeholder="Кол-во" value="1"
                                       class="form-control input-lg">
                            </div>
                        </form>
                    </h1>

                    <h3 style="color: green">Есть в наличии</h3>
                    <hr/>
                    <p>${info}</p>
                </div>
                <div class="col-sm-3 col-md-3" style="border-left: 1px solid #e5e5e5; height: 180px;">
                    Доставка
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <br>
                    <div class="tabs">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-1" data-toggle="tab">Характеристики</a></li>
                            <li><a href="#tab-2" data-toggle="tab">Отзывы</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab-1">
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <th scope="row">Категория товара</th>
                                        <td>${category}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Производитель</th>
                                        <td>${firm}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Высота, мм</th>
                                        <td>${height}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ширина, мм</th>
                                        <td>${width}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Количество ламп</th>
                                        <td>${lamps}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Мощность, Вт</th>
                                        <td>${power}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="tab-2">
                                Hello
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade in" id="modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form class="form-horizontal" name="cart" action="/checkout" method="post">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Корзина</h4>
                </div>
                <div class="modal-body">
                    ${auth}
                        <c:if test="${empty auth}">
                            <table class="table table-striped">
                                <caption>Товары</caption>
                                <thead>
                                <tr>
                                    <th style="text-align: center; vertical-align: middle;">#</th>
                                    <th style="text-align: center; vertical-align: middle;">Фото</th>
                                    <th style="text-align: center; vertical-align: middle;">Название</th>
                                    <th style="text-align: center; vertical-align: middle;">Цена</th>
                                    <th style="text-align: center; vertical-align: middle;">Количество</th>
                                    <th style="text-align: center; vertical-align: middle;">Сумма</th>
                                    <th style="text-align: center; vertical-align: middle;">Удалить</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orderItem}" var="item" varStatus="loop">
                                    <tr>
                                        <td style="text-align: center; vertical-align: middle;">${loop.index+1}</td>
                                        <td style="text-align: center; vertical-align: middle;"><img
                                                src="${imageService.generateImageUrl(item.chandelier)}" alt=""
                                                style="width: 145px; height: 115px;"></td>
                                        <td style="text-align: center; vertical-align: middle;"><a href="/chandelier/${item.chandelier.article}">${item.chandelier.category.name} ${item.chandelier.firm.name}
                                                ${item.chandelier.article}</a></td>
                                        <td style="text-align: center; vertical-align: middle;">${item.chandelier.unitCost}</td>
                                        <td style="text-align: center; vertical-align: middle;">${item.quantity}</td>
                                        <td style="text-align: center; vertical-align: middle;">${item.chandelier.unitCost * item.quantity}</td>
                                        <td style="text-align: center; vertical-align: middle;">
                                            <a class="glyphicon glyphicon-remove-circle"  href="/remove/${item.orderItemId}"
                                               style="text-decoration: none; cursor: auto;"> </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <td/>
                                <td/>
                                <td/>
                                <td/>
                                <td style="text-align: center; vertical-align: middle;">Итого к оплате</td>
                                <td style="text-align: center; vertical-align: middle;">${cost}</td>
                                <td/>
                                </tbody>
                            </table>
                        </c:if>
                </div>
                <div class="modal-footer">
                    <c:if test="${empty auth}">
                        <button class="btn btn-success" type="submit">Оформить заказ</button>
                    </c:if>
                    <button class="btn btn-primary" type="button" data-dismiss="modal">Продолжить покупки</button>
                </div>
            </form>
        </div>
    </div>
</div>

<hr>
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <ul class="list-unstyled list-inline pull-left">
                <li><a href="#">Магазины</a></li>
                <li><a href="#">Доставка</a></li>
                <li><a href="#">Оплата</a></li>
                <li><a href="#">О компании</a></li>
                <li><a href="#">Контакты</a></li>
            </ul>
        </div>
        <div class="col-xs-4">
            <p class="text-muted pull-right">© 2016 VIP. All rights reserved</p>
        </div>
    </div>
</div>
<script>
    ${modal}
</script>
</body>
</html>
