<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>Добавить люстру</title>
    <script src="/resources/js/jquery-3.0.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>
    <script src="/resources/js/bootstrap.js"></script>
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
                    <li class="current"><a href="/admin/addchan"><i class="glyphicon glyphicon-plus"></i> Добавить люстру</a></li>
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

                        <form class="form-horizontal" name="chandelieradd" action="/admin/addchan" method="post" style="margin-top: 20px;"
                              enctype="multipart/form-data">
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="articul">Артикул</label>
                                    <div class="col-md-4">
                                        <input id="articul" name="articul" type="text" placeholder="Артикул" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="unitcost">Цена</label>
                                    <div class="col-md-4">
                                        <input id="unitcost" name="unitcost" type="number" placeholder="Цена" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="height">Высота</label>
                                    <div class="col-md-4">
                                        <input id="height" name="height" type="number" placeholder="Высота" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="width">Ширина</label>
                                    <div class="col-md-4">
                                        <input id="width" name="width" type="number" placeholder="Ширина" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="lamps">Количество ламп</label>
                                    <div class="col-md-4">
                                        <input id="lamps" name="lamps" type="number" placeholder="Количество ламп"
                                               class="form-control input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="power">Мощность</label>
                                    <div class="col-md-4">
                                        <input id="power" name="power" type="number" placeholder="Мощность" class="form-control input-md">
                                    </div>
                                </div>

                                <form class="form-horizontal" name="qwer" action="/qwer" method="post">
                                    <button class="btn btn-success" type="submit" style="display: none">Добавить</button>
                                </form>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="info">Информация</label>
                                    <div class="col-md-4">
                                        <input id="info" name="info" type="text" placeholder="Информация" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="category">Категория</label>
                                    <div class="col-md-4">
                                        <select id="category" name="category" class="form-control">
                                            <c:forEach items="${category}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-1"
                                            type="button">Добавить
                                    </button>

                                    </button>
                                    <div class="modal fade" id="modal-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form class="form-horizontal" name="categoryadd" action="/categoryadd" method="post">
                                                    <div class="modal-header">
                                                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Добавить категорию</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="nameCategory">Название
                                                                категории</label>
                                                            <div class="col-md-4">
                                                                <input id="nameCategory" name="nameCategory" type="text"
                                                                       placeholder="Название"
                                                                       class="form-control input-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success" type="submit">Добавить</button>
                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="firm">Фирма</label>
                                    <div class="col-md-4">
                                        <select id="firm" name="firm" class="form-control">
                                            <c:forEach items="${firm}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-3"
                                            type="button">Добавить
                                    </button>
                                    <div class="modal fade" id="modal-3">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form class="form-horizontal" name="firmadd" action="/firmadd" method="post">
                                                    <div class="modal-header">
                                                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Добавить фирму</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="addfirm">Название
                                                                фирмы</label>
                                                            <div class="col-md-4">
                                                                <input id="addfirm" name="nameFirm" type="text"
                                                                       placeholder="Название"
                                                                       class="form-control input-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success" type="submit">Добавить</button>
                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="style">Стиль</label>
                                    <div class="col-md-4">
                                        <select id="style" name="style" class="form-control">
                                            <c:forEach items="${style}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-5"
                                            type="button">Добавить
                                    </button>
                                    <div class="modal fade" id="modal-5">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form class="form-horizontal" name="styleadd" action="/styleadd" method="post">
                                                    <div class="modal-header">
                                                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Добавить стиль</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="addstyle">Название
                                                                фирмы</label>
                                                            <div class="col-md-4">
                                                                <input id="addstyle" name="namestyle" type="text"
                                                                       placeholder="Название"
                                                                       class="form-control input-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success" type="submit">Добавить</button>
                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="cartridge">Патрон</label>
                                    <div class="col-md-4">
                                        <select id="cartridge" name="cartridge" class="form-control">
                                            <c:forEach items="${cartridge
                    }" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-4"
                                            type="button">Добавить
                                    </button>
                                    <div class="modal fade" id="modal-4">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form class="form-horizontal" name="cartridgeadd" action="/cartridgeadd" method="post">
                                                    <div class="modal-header">
                                                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Добавить патрон</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="addcartridge">Название
                                                                патрона</label>
                                                            <div class="col-md-4">
                                                                <input id="addcartridge" name="namecartridge" type="text"
                                                                       placeholder="Название"
                                                                       class="form-control input-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success" type="submit">Добавить</button>
                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="bodycolor">Цвет каркаса</label>
                                    <div class="col-md-4">
                                        <select id="bodycolor" name="bodycolor" class="form-control">
                                            <c:forEach items="${color}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-6"
                                            type="button">Добавить
                                    </button>
                                    <div class="modal fade" id="modal-6">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form class="form-horizontal" name="coloradd" action="/coloradd" method="post">
                                                    <div class="modal-header">
                                                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Добавить цвет</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="addcartridge">Название
                                                                цвета</label>
                                                            <div class="col-md-4">
                                                                <input id="addcolor" name="namecolor" type="text"
                                                                       placeholder="Название"
                                                                       class="form-control input-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success" type="submit">Добавить</button>
                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="bodymaterial">Материал каркаса</label>
                                    <div class="col-md-4">
                                        <select id="bodymaterial" name="bodymaterial" class="form-control">
                                            <c:forEach items="${material}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-7"
                                            type="button">Добавить
                                    </button>
                                    <div class="modal fade" id="modal-7">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form class="form-horizontal" name="materialadd" action="/materialadd" method="post">
                                                    <div class="modal-header">
                                                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Добавить материал</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="addcartridge">Название
                                                                материала</label>
                                                            <div class="col-md-4">
                                                                <input id="addmaterial" name="namematerial" type="text"
                                                                       placeholder="Название"
                                                                       class="form-control input-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-success" type="submit">Добавить</button>
                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="plafoncolor">Цвет плафона</label>
                                    <div class="col-md-4">
                                        <select id="plafoncolor" name="plafoncolor" class="form-control">
                                            <c:forEach items="${color}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="plafonmaterial">Материал плафона</label>
                                    <div class="col-md-4">
                                        <select id="plafonmaterial" name="plafonmaterial" class="form-control">
                                            <c:forEach items="${material}" var="item">
                                                <option value="${item.name}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="file">Фото</label>
                                    <div class="col-md-4">
                                        <input id="file" name="file" type="file" placeholder="file" class="form-control input-md">
                                    </div>
                                </div>
                                <button style="margin-top: 10px;" class=" btn btn-lg btn-primary center-block"
                                        type="submit">Добавить
                                </button>


                            </fieldset>
                        </form>
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
