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
<form class="form-horizontal" name="chandelieradd" action="/admin/addchan" method="post" style="margin-top: 20px;" enctype="multipart/form-data">
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


        <%--<div class="modal fade" id="modal-1">--%>
        <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
        <%--<form class="form-horizontal" name="categoryadd" action="/categoryadd" method="post">--%>
        <%--<div class="modal-header">--%>
        <%--<button class="close" type="button" data-dismiss="modal">&times;</button>--%>
        <%--<h4 class="modal-title">Добавить категорию</h4>--%>
        <%--</div>--%>
        <%--<div class="modal-body">--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="AddCategory">Название категории</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<input id="AddCategory" name="nameCategory" type="text" placeholder="Название"--%>
        <%--class="form-control input-md">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="subcategory1">Подкатегория</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="subcategory1" name="namesubcategory" class="form-control">--%>
        <%--<option value="asdf">asdf</option>--%>
        <%--<option value="zxcv">zxcv</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="modal-footer">--%>

        <%--<button class="btn btn-success" type="submit">Добавить--%>
        <%--</button>--%>

        <%--<button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>--%>
        <%--</div>--%>
        <%--</form>--%>
        <%--</div>--%>

        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="subcategory">Подкатегория</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="subcategory" name="subcategory" class="form-control">--%>
        <%--<option value="asdf">asdf</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--<button class="btn btn-primary" data-toggle="modal" data-target="#modal-2"--%>
        <%--type="button">Добавить--%>
        <%--</button>--%>
        <%--<div class="modal fade" id="modal-2">--%>
        <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
        <%--<form class="form-horizontal" name="subcategoryadd" action="/subcategoryadd" method="post">--%>
        <%--<div class="modal-header">--%>
        <%--<button class="close" type="button" data-dismiss="modal">&times;</button>--%>
        <%--<h4 class="modal-title">Добавить подкатегорию</h4>--%>
        <%--</div>--%>
        <%--<div class="modal-body">--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="AddSubCategory">Название--%>
        <%--подкатегории</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<input id="AddSubCategory" name="nameSubCategory" type="text"--%>
        <%--placeholder="Название"--%>
        <%--class="form-control input-md">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="modal-footer">--%>
        <%--<button class="btn btn-success" type="submit">Добавить</button>--%>
        <%--<button class="btn btn-danger" type="button" data-dismiss="modal">Отмена</button>--%>
        <%--</div>--%>
        <%--</form>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="materialplafon">Материал плафона</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="materialplafon" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="colorplafon">Цвет плафона</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="colorplafon" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="materialbody">Материал корпуса</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="materialbody" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="colorbody">Цвет корпуса</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="colorbody" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="cartridge">Тип патрона</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="cartridge" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
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
            <label class="col-md-4 control-label" for="file">Ширина</label>
            <div class="col-md-4">
                <input id="file" name="file" type="file" placeholder="Ширина" class="form-control input-md">
            </div>
        </div>
        <button style="margin-top: 10px;" class=" btn btn-lg btn-primary center-block"
                type="submit">Добавить
        </button>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="form">Форма</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="form" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-md-4 control-label" for="type">Тип</label>--%>
        <%--<div class="col-md-4">--%>
        <%--<select id="type" name="selectbasic" class="form-control">--%>
        <%--<option value="1">Option one</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>

    </fieldset>
</form>
</body>
</html>
