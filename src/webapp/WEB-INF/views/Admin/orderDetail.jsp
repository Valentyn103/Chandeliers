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
</head>
<body>
<div class="container" style="margin-top: 25px;">
    <div class="row" style="text-align: center">
        <a href="/admin/addchan" class="btn btn-success btn-lg">Добавить люстру <i
                class="glyphicon glyphicon-plus"></i></a>
        <a href="/orders/current" class="btn btn-success btn-lg">Текущие заказы <i
                class="glyphicon glyphicon-shopping-cart"></i></a>
        <a href="/orders/all" class="btn btn-success btn-lg">Все заказы <i
                class="glyphicon glyphicon-list-alt"></i></a>
        <a href="/auth/logout" class="btn btn-danger btn-lg">Выход <i
                class="glyphicon glyphicon-off"></i></a>
    </div>
</div>
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

</body>
</html>
