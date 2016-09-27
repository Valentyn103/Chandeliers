<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>Люстры</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/mycss.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-slider.css"/>
    <script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/bootstrap-slider.js"></script>
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
                                               data-toggle="password" placeholder="password" required autofocus>
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
                    <form name="filter" action="/filter" method="post">
                        <h3 style="margin-top: 15px">Фильтр</h3>
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapseFirm">Производитель</a>
                                    </h4>
                                </div>
                                <div id="collapseFirm" class="panel-collapse collapse in">
                                    <div class="panel-body checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                        <table class="table">
                                            <c:forEach items="${firm}" var="item">
                                                <tr>
                                                    <td>
                                                        <label>
                                                            <input name="firm" value="${item.name}"
                                                                   type="checkbox">${item.name}
                                                        </label>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapseCategory">Категория</a>
                                    </h4>
                                </div>
                                <div id="collapseCategory" class="panel-collapse collapse in">
                                    <div class="panel-body checkbox" style="margin-top: 0px; margin-bottom: 0px">
                                        <table class="table">
                                            <c:forEach items="${category}" var="item">
                                                <tr>
                                                    <td>
                                                        <label>
                                                            <input name="category" value="${item.name}"
                                                                   type="checkbox">${item.name}
                                                        </label>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapseCost">Цена</a>
                                    </h4>
                                </div>
                                <div id="collapseCost" class="panel-collapse collapse in">
                                    <input id="ex2" name="ex2" style="width:100%;" type="text" class="span2" value=""
                                           data-slider-min="${minCost}"
                                           data-slider-max="${maxCost}" data-slider-step="100"
                                           data-slider-value="[${minCost},${maxCost}]"/></div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapsePower">Мощность</a>
                                    </h4>
                                </div>
                                <div id="collapsePower" class="panel-collapse collapse">
                                    <input id="ex3" name="ex3" style="width:100%;" type="text" class="span2" value=""
                                           data-slider-min="${minPower}"
                                           data-slider-max="${maxPower}" data-slider-step="5"
                                           data-slider-value="[${minPower},${maxPower}]"/></div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapseLamps">Количество ламп</a>
                                    </h4>
                                </div>
                                <div id="collapseLamps" class="panel-collapse collapse">
                                    <input id="ex4" name="ex4" style="width:100%;" type="text" class="span2" value=""
                                           data-slider-min="${minLamp}"
                                           data-slider-max="${maxLamp}" data-slider-step="1"
                                           data-slider-value="[${minLamp},${maxLamp}]"/></div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapseWidth">Ширина, мм</a>
                                    </h4>
                                </div>
                                <div id="collapseWidth" class="panel-collapse collapse">
                                    <input id="ex5" name="ex5" style="width:100%;" type="text" class="span2" value=""
                                           data-slider-min="${minWidth}"
                                           data-slider-max="${maxWidth}" data-slider-step="5"
                                           data-slider-value="[${minWidth},${maxWidth}]"/></div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapseHeight">Высота, мм</a>
                                    </h4>
                                </div>
                                <div id="collapseHeight" class="panel-collapse collapse">
                                    <input id="ex6" name="ex6" style="width:100%;" type="text" class="span2" value=""
                                           data-slider-min="${minHeight}"
                                           data-slider-max="${maxHeight}" data-slider-step="5"
                                           data-slider-value="[${minHeight},${maxHeight}]"/></div>
                            </div>
                            <button style="margin-top: 10px;" class=" btn btn-lg btn-primary btn-block"
                                    type="submit">Применить
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-sm-9 col-md-9">
                    <div class="dropdown" style="float: right; margin-right: 15px;">
                        Сортировка :
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownsort"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Новинки
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" id="dropdown-menusort" aria-labelledby="dropdownMenu1">
                            <li><a href="#">От дешевых к дорогим</a></li>
                            <li><a href="#">От дорогих к дешевым</a></li>
                            <li><a href="#">Новинки</a></li>
                        </ul>
                    </div>
                    <h1 style="margin-top: 0px">Люстры</h1>

                </div>
                ${info}
                <div class="row col-sm-9 col-md-9" style="padding-right: 0px">
                    <c:forEach items="${chandelier}" var="item">
                        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                            <div class="thumbnail">
                                <div style="width: 170px; height: 170px;  margin: auto;" >
                                <img src="${imageService.generateImageUrl(item)}" alt="" style="width: 170px; height: auto;" ></div>
                                <div class="caption">
                                    <h4 style="word-break: break-all; height: 50px"><a
                                            href="/chandelier/${item.article}">${item.category.name} ${item.firm.name} ${item.article}</a>
                                    </h4>
                                    <p>${item.unitCost} грн</p>
                                    <a href="/chandelier/${item.article}" class="btn btn-info" style="display: block;">Подробнее
                                        <i
                                                class="glyphicon glyphicon-arrow-right"></i>
                                    </a>
                                    <a href="/chandelier/${item.article}" style="margin-top: 5px; display: block;"
                                       class="btn btn-success">Купить <i
                                            class="glyphicon glyphicon-shopping-cart"></i> </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
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
<script>
    $("#ex2").slider({});
    $("#ex3").slider({});
    $("#ex4").slider({});
    $("#ex5").slider({});
    $("#ex6").slider({});
</script>
</body>
</html>
