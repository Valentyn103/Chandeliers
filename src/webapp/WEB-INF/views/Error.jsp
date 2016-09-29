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
                        <li><a href="/shops">Магазины</a></li>
                        <li><a href="/delivery">Доставка</a></li>
                        <li><a href="/payment">Оплата</a></li>
                        <li><a href="/company">О компании</a></li>
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
            <div class="row" style="margin-left: 25px;">
                <h1 style="color: red;">${number}</h1>
                <h2>${error}</h2>
                <a href="/" class="btn btn-success">Перейти на главную страницу <i
                        class="glyphicon glyphicon-arrow-left"></i></a>
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
<script>
    ${modal}
</script>
</body>
</html>
