<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
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
</body>
</html>
