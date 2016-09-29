<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="ru">
<head>
    <title>Благодарим Вас за заказ в интернет-магазине VIP.com</title>
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
            </div>
        </div>
        <div class="container">
            <div class="row">
                <h1 style="margin-top: 0px;">Благодарим Вас за заказ в интернет-магазине VIP.com!</h1>
                <h3 class="mrgn">Номер Вашего заказа : ${orderId}</h3>
                <h3 class="mrgn">Адрес доставки : ${address}</h3>
                <h3 class="mrgn">Номер телефона : ${number}</h3>
                <table class="table table-striped">
                    <caption style="font-size: 16px;">Товары</caption>
                    <thead>
                    <tr>
                        <th style="text-align: center; vertical-align: middle;">#</th>
                        <th style="text-align: center; vertical-align: middle;">Фото</th>
                        <th style="text-align: center; vertical-align: middle;">Название</th>
                        <th style="text-align: center; vertical-align: middle;">Цена</th>
                        <th style="text-align: center; vertical-align: middle;">Количество</th>
                        <th style="text-align: center; vertical-align: middle;">Сумма</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orderItem}" var="item" varStatus="loop">
                        <tr>
                            <td style="text-align: center; vertical-align: middle;">${loop.index+1}</td>
                            <td style="text-align: center; vertical-align: middle;"><img
                                    src="${imageService.generateImageUrl(item.chandelier)}" alt="" style="width: 145px; height: 115px;"></td>
                            <td style="text-align: center; vertical-align: middle;">${item.chandelier.category.name} ${item.chandelier.firm.name}
                                    ${item.chandelier.article}</td>
                            <td style="text-align: center; vertical-align: middle;">${item.chandelier.unitCost}</td>
                            <td style="text-align: center; vertical-align: middle;">${item.quantity}</td>
                            <td style="text-align: center; vertical-align: middle;">${item.chandelier.unitCost * item.quantity}</td>
                        </tr>
                    </c:forEach>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td style="text-align: center; vertical-align: middle;">Итого к оплате</td>
                    <td style="text-align: center; vertical-align: middle;">${cost}</td>
                    </tbody>
                </table>
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
