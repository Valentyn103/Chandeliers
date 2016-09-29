<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
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
                    <li class="current"><a href="/admin"><i class="glyphicon glyphicon-home"></i> Main</a></li>
                    <li><a href="/admin/addchan"><i class="glyphicon glyphicon-plus"></i> Добавить люстру</a></li>
                    <li><a href="/orders/current"><i class="glyphicon glyphicon-shopping-cart"></i> Текущие заказы</a></li>
                    <li><a href="/orders/all"><i class="glyphicon glyphicon-list-alt"></i> Все заказы</a></li>
                    <li><a href="/users/all"><i class="glyphicon glyphicon-list-alt"></i> Все юзеры</a>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-body">
                    <div class="row">
                        <h1>Админ панель</h1>
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
