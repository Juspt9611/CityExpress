<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="WBSupportCenter.vistas.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .textoCategorias {
            font-size: 13px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container"  id="categoSub">
        <div class="box_table_container" id="idCategorias">
            <div class="row">
                <span class="box_table_title">Categorías y subcategorías</span>
            </div>
            <br />
            <div>
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-align-center">Categoría</th>
                                    <th class="text-align-center">Subcategoría 1</th>
                                    <th class="text-align-center" id="th2">Subcategoría 2</th>
                                    <th class="text-align-center" id="th3">Subcategoría 3</th>
                                    <th class="text-align-center" id="th4">Subcategoría 4</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <center><a class="btn btn-sm text-white" href="javascript:void(0)" onclick="agregarCatSub();" role="button" style="background: #b1b1b1;"><i class='fa fa-plus'></i></a></td></center>
                                    <td>
                                        <select id="selectCategoria" class="custom-select" style="width: 80%"></select>
                                        <a id="btn1" class="btn btn-sm text-white" href="javascript:void(0)" onclick="agregarSubCat();" role="button" style="background: #b1b1b1;"><i class='fa fa-plus'></i></a>
                                    </td>
                                    <td>
                                        <select id="selectSubCategoria" class="custom-select" style="width: 80%"></select>
                                        <a id="btn2" class="btn btn-sm text-white" href="javascript:void(0)" onclick="agregarSubCat();" role="button" style="background: #b1b1b1;"><i class='fa fa-plus'></i></a>
                                    </td>
                                    <td>
                                        <select id="selectSubCategoriaDos" class="custom-select" style="width: 80%"></select>
                                        <a id="btn3" class="btn btn-sm text-white" href="javascript:void(0)" onclick="agregarSubCat();" role="button" style="background: #b1b1b1;"><i class='fa fa-plus'></i></a>
                                    </td>
                                    <td>
                                        <select id="selectSubCategoriaTres" class="custom-select" style="width: 80%"></select>
                                        <a id="btn4" class="btn btn-sm text-white" href="javascript:void(0)" onclick="agregarSubCat();" role="button" style="background: #b1b1b1;"><i class='fa fa-plus'></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <div class="list-group" id="listCategoria"></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <div class="list-group" id="listSubcategoria1"></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <div class="list-group" id="listSubcategoria2"></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <div class="list-group" id="listSubcategoria3"></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <div class="list-group" id="listSubcategoria4"></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="agregaCategoSub">
        <div class="box_table_container">
            <a id="btnAtras" class="btn btn-warning pull-right" href="javascript:void(0)" onclick="returnCategorias();" role="button">Atrás</a>
            <div class="row">
                <span class="box_table_title">Agregar categoría</span>
            </div>
            <br />
            <div>
                <div class="row">
                    <div class="col-sm-12 col-md-2 col-lg-2"></div>
                    <div class="col-sm-12 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label for="nombreCat">Nombre:</label>
                            <input type="text" class="form-control" id="nombreCat">
                        </div>
                        <div class="form-group">
                            <label for="descrCat">Descripción:</label>
                            <input type="text" class="form-control" id="descrCat">
                        </div>
                        <a class="btn btn-primary" href="javascript:void(0)" onclick="guardarCategoria();" role="button">Agregar</a>
                    </div>
                    <div class="col-sm-12 col-md-2 col-lg-2"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="agregaSubCat">
        <div class="box_table_container">
            <a id="btnAtrasSub" class="btn btn-warning pull-right" href="javascript:void(0)" onclick="returnCategorias();" role="button">Atrás</a>
            <div class="row">
                <span class="box_table_title">Agregar Subcategoría</span>
            </div>
            <br />
            <div>
                <div class="row">
                    <div class="col-sm-12 col-md-2 col-lg-2"></div>
                    <div class="col-sm-12 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label for="nombreSubCat">Nombre:</label>
                            <input type="text" class="form-control" id="nombreSubCat">
                        </div>
                        <div class="form-group">
                            <label for="descrSubCat">Descripción:</label>
                            <input type="text" class="form-control" id="descrSubCat">
                        </div>
                        <a class="btn btn-primary" href="javascript:void(0)" onclick="guardarSubCat();" role="button">Agregar</a>
                    </div>
                    <div class="col-sm-12 col-md-2 col-lg-2"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var reporteSelect;
        $(document).ready(function () {
            $('#th2').hide();
            $('#selectSubCategoria').hide();
            $('#btn2').hide();
            $('#th3').hide();
            $('#selectSubCategoriaDos').hide();
            $('#btn3').hide();
            $('#th4').hide();
            $('#selectSubCategoriaTres').hide();
            $('#btn4').hide();
            llenarComboCategoria();
            showListCategoria();
            showListSubcategoriaUno();
            showListSubcategoriaDos();
            showListSubcategoriaTres();
            showListSubcategoriaCuatro();
            $('#agregaCategoSub').hide();
            $('#agregaSubCat').hide();

            var select = document.getElementById('selectCategoria');
            select.addEventListener('change',
                function () {
                    var selectedOption = this.options[select.selectedIndex];
                    reporteSelect = selectedOption.value;
                    if (reporteSelect != 0) {
                        showListSubcategoriaUno(reporteSelect);
                        $('#selectSubCategoriaDos').val('');
                        $('#selectSubCategoriaDos').text('');
                        $('#selectSubCategoriaTres').val('');
                        $('#selectSubCategoriaTres').text('');
                        $('#listSubcategoria2').empty();
                        $('#listSubcategoria3').empty();
                        $('#listSubcategoria4').empty();
                        $('#th2').show();
                        $('#selectSubCategoria').show();
                        $('#btn2').show();
                        $('#th3').hide();
                        $('#selectSubCategoriaDos').hide();
                        $('#btn3').hide();
                        $('#th4').hide();
                        $('#selectSubCategoriaTres').hide();
                        $('#btn4').hide();
                    } else {
                        $('#selectSubCategoria').val('');
                        $('#selectSubCategoria').text('');
                        $('#listSubcategoria1').empty();
                        $('#th2').hide();
                        $('#selectSubCategoria').hide();
                        $('#btn2').hide();
                        $('#listSubcategoria2').empty();
                        $('#th3').hide();
                        $('#selectSubCategoriaDos').hide();
                        $('#btn3').hide();
                        $('#listSubcategoria3').empty();
                        $('#th4').hide();
                        $('#selectSubCategoriaTres').hide();
                        $('#btn4').hide();
                        $('#listSubcategoria4').empty();
                    }
                }
            );

            var select2 = document.getElementById('selectSubCategoria');
            select2.addEventListener('change',
                function () {
                    var selectedOption = this.options[select2.selectedIndex];
                    reporteSelect = selectedOption.value;
                    if (reporteSelect != 0) {
                        showListSubcategoriaDos(reporteSelect);
                        $('#selectSubCategoriaTres').val('');
                        $('#selectSubCategoriaTres').text('');
                        $('#listSubcategoria3').empty();
                        $('#listSubcategoria4').empty();
                        $('#th3').show();
                        $('#selectSubCategoriaDos').show();
                        $('#btn3').show();
                    } else {
                        $('#selectSubCategoriaDos').val('');
                        $('#selectSubCategoriaDos').text('');
                        $('#listSubcategoria2').empty();
                        $('#th3').hide();
                        $('#selectSubCategoriaDos').hide();
                        $('#btn3').hide();
                        $('#listSubcategoria3').empty();
                        $('#th4').hide();
                        $('#selectSubCategoriaTres').hide();
                        $('#btn4').hide();
                        $('#listSubcategoria4').empty();
                    }
                    
                }
            );

            var select3 = document.getElementById('selectSubCategoriaDos');
            select3.addEventListener('change',
                function () {
                    var selectedOption = this.options[select3.selectedIndex];
                    reporteSelect = selectedOption.value;
                    if (reporteSelect != 0) {
                        showListSubcategoriaTres(reporteSelect);
                        $('#selectSubCategoriaTres').val('');
                        $('#selectSubCategoriaTres').text('');
                        $('#listSubcategoria4').empty();
                        $('#th4').show();
                        $('#selectSubCategoriaTres').show();
                        $('#btn4').show();
                    } else {
                        $('#selectSubCategoriaTres').val('');
                        $('#selectSubCategoriaTres').text('');
                        $('#listSubcategoria3').empty();
                        $('#th4').hide();
                        $('#selectSubCategoriaTres').hide();
                        $('#btn4').hide();
                        $('#listSubcategoria4').empty();
                    }
                }
            );

            var select4 = document.getElementById('selectSubCategoriaTres');
            select4.addEventListener('change',
                function () {
                    var selectedOption = this.options[select4.selectedIndex];
                    reporteSelect = selectedOption.value;
                    if (reporteSelect != 0) {
                        showListSubcategoriaCuatro(reporteSelect);
                    } else {
                        $('#listSubcategoria4').empty();
                    }
                }
            );
        });

        function guardarCategoria() {
            var nombreCategoria = $('#nombreCat').val();
            var descripcionCategoria = $('#descrCat').val();
            if (nombreCategoria != "" && descripcionCategoria != "") {
                $.ajax({
                    type: "POST",
                    url: "Categoria.aspx/registrarCategoria",
                    data: "{'nombreCategoria':'" + nombreCategoria + "', 'descripcionCategoria':'" + descripcionCategoria + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#nombreCat').val('');
                        $('#descrCat').val('');
                        $('#categoSub').show();
                        $('#agregaCategoSub').hide();
                        swal({
                            title: "Éxito!!",
                            text: "Categoría guardada!!",
                            icon: "success",
                            button: "Aceptar"
                        });
                    }
                });
            } else {
                swal({
                    title: "Error!!",
                    text: "No se permiten campos vacíos!!",
                    icon: "warning",
                    button: "Aceptar"
                });
            }
        }

        function guardarSubCat() {
            var nombreSubcat = $('#nombreSubCat').val();
            var descripcionSubcat = $('#descrSubCat').val();
            if (nombreSubcat != "" && descripcionSubcat != "") {
                $.ajax({
                    type: "POST",
                    url: "Categoria.aspx/registrarSubcategoria",
                    data: "{'idPadre':'" + reporteSelect + "','nombreSubcategoria':'" + nombreSubcat + "', 'descripcionSubcategoria':'" + descripcionSubcat + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#nombreSubCat').val('');
                        $('#descrSubCat').val('');
                        $('#categoSub').show();
                        $('#agregaSubCat').hide();
                        swal({
                            title: "Éxito!!",
                            text: "Subcategoría guardada!!",
                            icon: "success",
                            button: "Aceptar"
                        });
                    }
                });
            } else {
                swal({
                    title: "Error!!",
                    text: "No se permiten campos vacíos!!",
                    icon: "warning",
                    button: "Aceptar"
                });
            }
        }

        function agregarSubCat() {
            $('#categoSub').hide();
            $('#agregaCategoSub').hide();
            $('#agregaSubCat').show();
        }

        function agregarCatSub() {
            $('#categoSub').hide();
            $('#agregaCategoSub').show();
        }

        function returnCategorias() {
            $('#categoSub').show();
            $('#agregaCategoSub').hide();
            $('#agregaSubCat').hide();
        }

        function llenarComboCategoria() {
            $.ajax({
                type: "POST",
                url: "Categoria.aspx/consultarCategoria",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    $('#selectCategoria').append('<option value="">Elige una opcion...</option>');
                    $.each(jsonReporte, function (key, list) {
                        $('#selectCategoria').append('<option value=' + list.idCategoria + ' class="textoCategorias">' + list.nombreCategoria + '</option>');
                    });
                }       
            });    
        }

        function showListCategoria() {
            var html;
            $.ajax({
                type: "POST",
                url: "Categoria.aspx/consultarCategoria",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    $.each(jsonReporte, function (key, list) {
                        $('#listCategoria').append('<a href="javascript:void(0)" onclick="(' + list.idCategoria + ', \'' + list.nombreCategoria + '\', \'' + list.descripcionCategoria + '\');" role="button" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn" style="padding: 0px 5px;background:#fcf2a1;"><i class="fa fa-minus" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</a>');
                    });
                }       
            });   

            $('#listCategoria').html('');
            $('#listCategoria').html(html);
        }

        function mostrarDatos(idCat, nombre, descr) {
            console.log(idCat);
            console.log(nombre);
            console.log(descr);
        }

        function showListSubcategoriaUno(idCat) {
            var html;
            $.ajax({
                type: "POST",
                url: "Categoria.aspx/consultarSubcategoria",
                contentType: "application/json; charset=utf-8",
                data: "{'idCat':'" + idCat + "'}",
                dataType: "json",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    if (jsonReporte != null) {
                        $('#selectSubCategoria').val('');
                        $('#selectSubCategoria').text('');
                        $('#selectSubCategoria').append('<option value="">Elige una opcion...</option>');
                        $.each(jsonReporte, function (key, list) {
                            $('#listSubcategoria1').append('<li href="#" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn" style="padding: 0px 5px;background:#fcf2a1;"><i class="fa fa-minus" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</li>');
                            $('#selectSubCategoria').append('<option value=' + list.idCategoria + ' class="textoCategorias">' + list.nombreCategoria + '</option>');
                        });
                    } else {
                        $('#selectSubCategoria').hide();
                        $('#th2').hide();
                        $('#btn2').hide();
                    }
                }       
            });   

            $('#listSubcategoria1').html('');
            $('#listSubcategoria1').html(html);
        }

        function showListSubcategoriaDos(idCat) {
            var html;
            $.ajax({
                type: "POST",
                url: "Categoria.aspx/consultarSubcategoria",
                contentType: "application/json; charset=utf-8",
                data: "{'idCat':'" + idCat + "'}",
                dataType: "json",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    if (jsonReporte != null) {
                        $('#selectSubCategoriaDos').val('');
                        $('#selectSubCategoriaDos').text('');
                        $('#selectSubCategoriaDos').append('<option value="">Elige una opcion...</option>');
                        $.each(jsonReporte, function (key, list) {
                            $('#listSubcategoria2').append('<li href="#" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn" style="padding: 0px 5px;background:#fcf2a1;"><i class="fa fa-minus" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</li>');
                            $('#selectSubCategoriaDos').append('<option value=' + list.idCategoria + ' class="textoCategorias">' + list.nombreCategoria + '</option>');
                        });
                    } else {
                        $('#selectSubCategoriaDos').hide();
                        $('#th3').hide();
                        $('#btn3').hide();
                    }
                    
                }       
            });   

            $('#listSubcategoria2').html('');
            $('#listSubcategoria2').html(html);
        }

        function showListSubcategoriaTres(idCat) {
            var html;
            $.ajax({
                type: "POST",
                url: "Categoria.aspx/consultarSubcategoria",
                contentType: "application/json; charset=utf-8",
                data: "{'idCat':'" + idCat + "'}",
                dataType: "json",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    if (jsonReporte != null) {
                        $('#selectSubCategoriaTres').val('');
                        $('#selectSubCategoriaTres').text('');
                        $('#selectSubCategoriaTres').append('<option value="0">Elige una opcion...</option>');
                        $.each(jsonReporte, function (key, list) {
                            $('#listSubcategoria3').append('<li href="#" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn" style="padding: 0px 5px;background:#fcf2a1;"><i class="fa fa-minus" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</li>');
                            $('#selectSubCategoriaTres').append('<option value=' + list.idCategoria + ' class="textoCategorias">' + list.nombreCategoria + '</option>');
                        });
                    } else {
                        $('#selectSubCategoriaTres').hide();
                        $('#th4').hide();
                        $('#btn4').hide();
                    }
                }       
            });   

            $('#listSubcategoria3').html('');
            $('#listSubcategoria3').html(html);
        }

        function showListSubcategoriaCuatro(idCat) {
            var html;
            $.ajax({
                type: "POST",
                url: "Categoria.aspx/consultarSubcategoria",
                contentType: "application/json; charset=utf-8",
                data: "{'idCat':'" + idCat + "'}",
                dataType: "json",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    $.each(jsonReporte, function (key, list) {
                        $('#listSubcategoria4').append('<li href="#" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn" style="padding: 0px 5px;background:#fcf2a1;"><i class="fa fa-minus" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</li>');
                    });
                }       
            });   

            $('#listSubcategoria4').html('');
            $('#listSubcategoria4').html(html);
        }
    </script>
</asp:Content>
