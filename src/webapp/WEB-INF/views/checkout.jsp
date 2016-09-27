<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="ru">
<head>
    <title>Оформление заказа</title>
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
                        <li><a href="#">Магазины</a></li>
                        <li><a href="#">Доставка</a></li>
                        <li><a href="#">Оплата</a></li>
                        <li><a href="#">О компании</a></li>
                        <li><a href="#">Контакты</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/personal">Личный кабинет</a></li>
                        <li><a href="/auth/logout">Выход</a></li>
                    </ul>
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
                <form class="form-horizontal" name="order" action="/order/success" method="post">
                    <h1>Оформление заказа</h1>
                    <fieldset>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="name">Фамилия Имя Отчество</label>
                            <div class="col-md-4">
                                <input id="name" name="name" value="${name}" type="text"
                                       placeholder="Фамилия Имя Отчество"
                                       class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="number">Телефон</label>
                            <div class="col-md-4">
                                <input id="number" name="number" type="tel" value="${number}" placeholder="Телефон"
                                       class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="number">Населенный пункт</label>
                            <div class="col-md-4">
                                <input id="city" name="city" type="text" placeholder="Населенный пункт"
                                       class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="address">Адрес доставки</label>
                            <div class="col-md-4">
                                <input id="address" name="address" type="text" placeholder="Адрес доставки"
                                       class="form-control input-md" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="address">Комментарии к заказу</label>
                            <div class="col-md-4">
                                <input id="info" name="info" type="text" placeholder="Комментарии к заказу"
                                       class="form-control input-md">
                            </div>
                        </div>
                        <button style="margin-top: 10px;" class=" btn btn-lg btn-primary center-block"
                                type="submit">Оформить заказ
                        </button>
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
                                    <td style="text-align: center; vertical-align: middle;"><a
                                            href="/chandelier/${item.chandelier.article}">${item.chandelier.category.name} ${item.chandelier.firm.name}
                                            ${item.chandelier.article}</a></td>
                                    <td style="text-align: center; vertical-align: middle;">${item.chandelier.unitCost}</td>
                                    <td style="text-align: center; vertical-align: middle;">${item.quantity}</td>
                                    <td style="text-align: center; vertical-align: middle;">${item.chandelier.unitCost * item.quantity}</td>
                                    <td style="text-align: center; vertical-align: middle;">
                                        <a class="glyphicon glyphicon-remove-circle" href="/remove/${item.orderItemId}"
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
</body>
</html>
