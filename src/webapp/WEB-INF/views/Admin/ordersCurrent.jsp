<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Текущие заказы</title>
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

    <table class="table table-striped">
        <caption>Заказы</caption>
        <thead>
        <tr>
            <th style="text-align: center; vertical-align: middle;">#</th>
            <th style="text-align: center; vertical-align: middle;">Дата</th>
            <th style="text-align: center; vertical-align: middle;">Цена</th>
            <th style="text-align: center; vertical-align: middle;">Адрес</th>
            <th style="text-align: center; vertical-align: middle;">Телефон</th>
            <th style="text-align: center; vertical-align: middle;">Действие</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="item" varStatus="loop">
            <tr>
                <td style="text-align: center; vertical-align: middle;">${loop.index+1}</td>
                <td style="text-align: center; vertical-align: middle;">${item.date}</td>
                <td style="text-align: center; vertical-align: middle;">${item.cost}</td>
                <td style="text-align: center; vertical-align: middle;">${item.address}</td>
                <td style="text-align: center; vertical-align: middle;">${item.user.number}</td>
                <td style="text-align: center; vertical-align: middle;">
                    <a href="/order/detail/${item.orderId}" class="btn btn-success">Подробнее <i
                            class="glyphicon glyphicon-info-sign"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
