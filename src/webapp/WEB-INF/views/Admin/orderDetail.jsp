<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Все заказы</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/mycss.css"/>
    <link href="/resources/css/styles.css" rel="stylesheet">
</head>
<body>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="logo">
                    <h1><a href="/admin">Admin</a></h1>
                </div>
            </div>
            <div class="col-md-7">
                <div class="navbar navbar-inverse" role="banner">
                    <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                        <ul class="nav navbar-nav">
                            <li><a href="/auth/logout">Выход</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-content">
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <li><a href="/admin"><i class="glyphicon glyphicon-home"></i> Main</a></li>
                    <li><a href="/admin/addchan"><i class="glyphicon glyphicon-plus"></i> Добавить
                        люстру</a></li>
                    <li><a href="/orders/current"><i class="glyphicon glyphicon-shopping-cart"></i> Текущие заказы</a>
                    </li>
                    <li><a href="/orders/all"><i class="glyphicon glyphicon-list-alt"></i> Все заказы</a></li>
                    <li><a href="/users/all"><i class="glyphicon glyphicon-list-alt"></i> Все юзеры</a>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-body">
                    <div class="row">

                        <div class="container" style="margin-top: 25px;">
                            <div class="row">
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <th scope="row">Дата</th>
                                        <td>${order.date}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Адрес</th>
                                        <td>${order.address}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Цена</th>
                                        <td>${order.cost}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Емейл</th>
                                        <td>${order.user.email}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Имя</th>
                                        <td>${order.user.name}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Телефон</th>
                                        <td>${order.user.number}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Статус</th>
                                        <td>${order.status}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${order.orderItems}" var="item" varStatus="loop">
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
                                        </tr>
                                    </c:forEach>
                                    <td/>
                                    <td/>
                                    <td/>
                                    <td/>
                                    <td style="text-align: center; vertical-align: middle;">Итого к оплате</td>
                                    <td style="text-align: center; vertical-align: middle;">${order.cost}</td>
                                    <td/>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row" style="text-align: center; margin-bottom: 20px;">
                                <a href="/order/finish/${order.orderId}" class="btn btn-success">Завершить <i
                                        class="glyphicon glyphicon-ok"></i></a>
                                <a href="/order/cancel/${order.orderId}" class="btn btn-danger">Отменить <i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">

        <div class="copy text-center">
            <a href='#'>Vip.com</a>
        </div>

    </div>
</footer>

<script src="/resources/js/custom.js"></script>

</body>
</html>
