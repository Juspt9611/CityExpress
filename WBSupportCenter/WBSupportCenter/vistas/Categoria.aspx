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
                                        <center>
                                            <input type="hidden" id="idCategoria" />
                                            <input type="hidden" id="idCategoriaEdit" />
                                            <input type="text" id="inputCategoria" class="form-control">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="hidden" id="idSubcategoria1" />
                                            <input type="hidden" id="idSubcategoria1Edit" />
                                            <input type="text" id="inputSubcategoria1" class="form-control">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="hidden" id="idSubcategoria2" />
                                            <input type="hidden" id="idSubcategoria2Edit" />
                                            <input type="text" id="inputSubcategoria2" class="form-control">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="hidden" id="idSubcategoria3" />
                                            <input type="hidden" id="idSubcategoria3Edit" />
                                            <input type="text" id="inputSubcategoria3" class="form-control">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="hidden" id="idSubcategoria4" />
                                            <input type="hidden" id="idSubcategoria4Edit" />
                                            <input type="text" id="inputSubcategoria4" class="form-control">
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center><a id="btnCat" class="btn btn-success btn-sm text-white" href="javascript:void(0)" onclick="guardarCategoria();" role="button">Agregar</a></center>
                                        <center><a id="btnCatEdit" class="btn btn-warning btn-sm text-white" href="javascript:void(0)" onclick="editarCategoria(1);" role="button">Editar</a></center>
                                    </td>
                                    <td>
                                        <center><a id="btnSub1" class="btn btn-success btn-sm text-white" href="javascript:void(0)" onclick="guardarSubcategoria(1);" role="button">Agregar</a></center>
                                        <center><a id="btnSub1Edit" class="btn btn-warning btn-sm text-white" href="javascript:void(0)" onclick="editarCategoria(2);" role="button">Editar</a></center>
                                    </td>
                                    <td>
                                        <center><a id="btnSub2" class="btn btn-success btn-sm text-white" href="javascript:void(0)" onclick="guardarSubcategoria(2);" role="button">Agregar</a></center>
                                        <center><a id="btnSub2Edit" class="btn btn-warning btn-sm text-white" href="javascript:void(0)" onclick="editarCategoria(3);" role="button">Editar</a></center>
                                    </td>
                                    <td>
                                        <center><a id="btnSub3" class="btn btn-success btn-sm text-white" href="javascript:void(0)" onclick="guardarSubcategoria(3);" role="button">Agregar</a></center>
                                        <center><a id="btnSub3Edit" class="btn btn-warning btn-sm text-white" href="javascript:void(0)" onclick="editarCategoria(4);" role="button">Editar</a></center>
                                    </td>
                                    <td>
                                        <center><a id="btnSub4" class="btn btn-success btn-sm text-white" href="javascript:void(0)" onclick="guardarSubcategoria(4);" role="button">Agregar</a></center>
                                        <center><a id="btnSub4Edit" class="btn btn-warning btn-sm text-white" href="javascript:void(0)" onclick="editarCategoria(5);" role="button">Editar</a></center>
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
    <script>
        $(document).ready(function () {
            showListCategoria();
            showListSubcategoriaUno();
            showListSubcategoriaDos();
            showListSubcategoriaTres();
            showListSubcategoriaCuatro();
            $('#btnCatEdit').hide();
            $('#btnSub1Edit').hide();
            $('#btnSub2Edit').hide();
            $('#btnSub3Edit').hide();
            $('#btnSub4Edit').hide();
        });

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
                        $('#listCategoria').append('<a href="javascript:void(0)" onclick="showListSubcategoriaUno(' + list.idCategoria + ');cargarIdCategoria(' + list.idCategoria + ');" role="button" class="dblClickCat list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn btn-warning" style="padding: 0px 5px;" onclick="cargarDatosEditar(' + list.idCategoria + ', \'' + list.nombreCategoria + '\', 1);"><i class="fa fa-edit" style="font-size:10px;"></i></button>&nbsp;<button class="btn btn-danger" style="padding: 0px 5px;" onclick="eliminarCategorias(' + list.idCategoria + ');refresh(1);"><i class="fa fa-times" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</a>');
                    });
                }       
            });   

            $('#listCategoria').html('');
            $('#listCategoria').html(html);
        }

        function cargarDatosEditar(idCat, nombre, typeExe) {
            if (typeExe == 1) {
                $('#idCategoriaEdit').val(idCat);
                $('#inputCategoria').val(nombre);
                $('#btnCat').hide();
                $('#btnCatEdit').show();
            } else if (typeExe == 2) {
                $('#idSubcategoria1Edit').val(idCat);
                $('#inputSubcategoria1').val(nombre);
                $('#btnSub1').hide();
                $('#btnSub1Edit').show();
            } else if (typeExe == 3) {
                $('#idSubcategoria2Edit').val(idCat);
                $('#inputSubcategoria2').val(nombre);
                $('#btnSub2').hide();
                $('#btnSub2Edit').show();
            } else if (typeExe == 4) {
                $('#idSubcategoria3Edit').val(idCat);
                $('#inputSubcategoria3').val(nombre);
                $('#btnSub3').hide();
                $('#btnSub3Edit').show();
            } else if (typeExe == 5) {
                $('#idSubcategoria4Edit').val(idCat);
                $('#inputSubcategoria4').val(nombre);
                $('#btnSub4').hide();
                $('#btnSub4Edit').show();
            }
        }

        function cargarIdCategoria(idCat) {
            $('#idCategoria').val(idCat);
        }

        function cargarIdSubcategorias(idCat, typeExe) {
            if (typeExe == 1) {
                $('#idSubcategoria1').val(idCat);
            } else if (typeExe == 2) {
                $('#idSubcategoria2').val(idCat);
            } else if (typeExe == 3) {
                $('#idSubcategoria3').val(idCat);
            } else if (typeExe == 4) {
                $('#idSubcategoria4').val(idCat);
            }
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
                        $.each(jsonReporte, function (key, list) {
                            $('#listSubcategoria1').append('<a href="javascript:void(0)" onclick="showListSubcategoriaDos(' + list.idCategoria + ');cargarIdSubcategorias(' + list.idCategoria + ', 1);" role="button" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn btn-warning" style="padding: 0px 5px;" onclick="cargarDatosEditar(' + list.idCategoria + ', \'' + list.nombreCategoria + '\', 2);"><i class="fa fa-edit" style="font-size:10px;"></i></button>&nbsp;<button class="btn btn-danger" style="padding: 0px 5px;" onclick="eliminarSubCat(2, ' + list.idCategoria + ');"><i class="fa fa-times" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</a>');
                        });
                        $('#listSubcategoria1').show();
                        $('#listSubcategoria2').hide();
                        $('#listSubcategoria3').hide();
                        $('#listSubcategoria4').hide();
                    } else {
                        $('#listSubcategoria1').hide();
                        $('#listSubcategoria2').hide();
                        $('#listSubcategoria3').hide();
                        $('#listSubcategoria4').hide();
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
                        $.each(jsonReporte, function (key, list) {
                            $('#listSubcategoria2').append('<a href="javascript:void(0)" onclick="showListSubcategoriaTres(' + list.idCategoria + ');cargarIdSubcategorias(' + list.idCategoria + ', 2);" role="button" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn btn-warning" style="padding: 0px 5px;" onclick="cargarDatosEditar(' + list.idCategoria + ', \'' + list.nombreCategoria + '\', 3);"><i class="fa fa-edit" style="font-size:10px;"></i></button>&nbsp;<button class="btn btn-danger" style="padding: 0px 5px;" onclick="eliminarSubCat(3, ' + list.idCategoria + ');"><i class="fa fa-times" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</a>');
                        });
                        $('#listSubcategoria2').show();
                        $('#listSubcategoria3').hide();
                        $('#listSubcategoria4').hide();
                    } else {
                        $('#listSubcategoria2').hide();
                        $('#listSubcategoria3').hide();
                        $('#listSubcategoria4').hide();
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
                        $.each(jsonReporte, function (key, list) {
                            $('#listSubcategoria3').append('<a href="javascript:void(0)" onclick="showListSubcategoriaCuatro(' + list.idCategoria + ');cargarIdSubcategorias(' + list.idCategoria + ', 3);" role="button" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn btn-warning" style="padding: 0px 5px;" onclick="cargarDatosEditar(' + list.idCategoria + ', \'' + list.nombreCategoria + '\', 4);"><i class="fa fa-edit" style="font-size:10px;"></i></button>&nbsp;<button class="btn btn-danger" style="padding: 0px 5px;" onclick="eliminarSubCat(4, ' + list.idCategoria + ');"><i class="fa fa-times" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</a>');
                        });
                        $('#listSubcategoria3').show();
                        $('#listSubcategoria4').hide();
                    } else {
                        $('#listSubcategoria3').hide();
                        $('#listSubcategoria4').hide();
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
                        $('#listSubcategoria4').append('<a href="javascript:void(0)" role="button" class="list-group-item list-group-item-action font-weight-bold textoCategorias"><button class="btn btn-warning" style="padding: 0px 5px;" onclick="cargarDatosEditar(' + list.idCategoria + ', \'' + list.nombreCategoria + '\', 5);"><i class="fa fa-edit" style="font-size:10px;"></i></button>&nbsp;<button class="btn btn-danger" style="padding: 0px 5px;" onclick="eliminarSubCat(5, ' + list.idCategoria + ');"><i class="fa fa-times" style="font-size:10px;"></i></button>&nbsp;' + list.nombreCategoria + '</a>');
                    });
                    $('#listSubcategoria4').show();
                }       
            });   

            $('#listSubcategoria4').html('');
            $('#listSubcategoria4').html(html);
        }

        function eliminarCategorias(idCat) {
            swal({
                title: "Estás seguro?",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/eliminarCategorias",
                        data: "{'idCat':'" + idCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var jsonReporte = $.parseJSON(response.d);
                            console.log(jsonReporte);
                            if (jsonReporte[0].total > 0) {
                                swal({
                                    title: "No se puede eliminar",
                                    text: "Artículos relacionados con esta categoría",
                                    icon: "warning",
                                });
                            } else {
                                swal("Ha sido eliminado", {
                                    icon: "success",
                                });
                                refresh(1);
                            }
                        }       
                    });   
                } 
            });
        }

        function eliminarSubCat(typeExe, idCat) {
            swal({
                title: "Estás seguro?",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/eliminarCategorias",
                        data: "{'idCat':'" + idCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var jsonReporte = $.parseJSON(response.d);
                            if (jsonReporte[0].total > 0) {
                                swal({
                                    title: "No se puede eliminar",
                                    text: "Artículos relacionados con esta categoría",
                                    icon: "warning",
                                });
                            } else {
                                swal("Ha sido eliminado", {
                                    icon: "success",
                                });
                                refresh(typeExe);
                            }
                        }       
                    });   
                } 
            });
        }

        function refresh(typeExe) {
            if (typeExe == 1) {
                showListCategoria();
            } else if (typeExe == 2) {
                showListSubcategoriaUno($('#idCategoria').val());
            } else if (typeExe == 3) {
                showListSubcategoriaDos($('#idSubcategoria1').val());
            } else if (typeExe == 4) {
                showListSubcategoriaTres($('#idSubcategoria2').val());
            } else if (typeExe == 5) {
                showListSubcategoriaCuatro($('#idSubcategoria3').val());
            }
        }

        function guardarCategoria() {
            var nombreCategoria = $('#inputCategoria').val();
            if (nombreCategoria != "") {
                $.ajax({
                    type: "POST",
                    url: "Categoria.aspx/registrarCategoria",
                    data: "{'nombreCategoria':'" + nombreCategoria + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#inputCategoria').val('');
                        swal({
                            title: "Éxito!!",
                            text: "Categoría guardada!!",
                            icon: "success",
                            button: "Aceptar"
                        });
                        refresh(1);
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

        function guardarSubcategoria(typeExe) {
            if (typeExe == 1) {
                var idSubcat = $('#idCategoria').val();
                var nombreSubcat = $('#inputSubcategoria1').val();
                if (idSubcat != null && nombreSubcat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/registrarSubcategoria",
                        data: "{'idPadre':'" + idSubcat + "','nombreSubcategoria':'" + nombreSubcat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $('#inputSubcategoria1').val('');
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría guardada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(2);
                        }
                    });
                } else {
                    swal({
                        title: "Error!!",
                        text: "No se permiten campos vacíos o no ha seleccionado una categoría",
                        icon: "warning",
                        button: "Aceptar"
                    });
                }
            } else if (typeExe == 2) {
                var idSubcat = $('#idSubcategoria1').val();
                var nombreSubcat = $('#inputSubcategoria2').val();
                if (idSubcat != null && nombreSubcat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/registrarSubcategoria",
                        data: "{'idPadre':'" + idSubcat + "','nombreSubcategoria':'" + nombreSubcat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $('#inputSubcategoria2').val('');
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría guardada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(3);
                        }
                    });
                } else {
                    swal({
                        title: "Error!!",
                        text: "No se permiten campos vacíos o no ha seleccionado una categoría",
                        icon: "warning",
                        button: "Aceptar"
                    });
                }
            } else if (typeExe == 3) {
                var idSubcat = $('#idSubcategoria2').val();
                var nombreSubcat = $('#inputSubcategoria3').val();
                if (idSubcat != null && nombreSubcat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/registrarSubcategoria",
                        data: "{'idPadre':'" + idSubcat + "','nombreSubcategoria':'" + nombreSubcat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $('#inputSubcategoria3').val('');
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría guardada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(4);
                        }
                    });
                } else {
                    swal({
                        title: "Error!!",
                        text: "No se permiten campos vacíos o no ha seleccionado una categoría",
                        icon: "warning",
                        button: "Aceptar"
                    });
                }
            } else if (typeExe == 4) {
                var idSubcat = $('#idSubcategoria3').val();
                var nombreSubcat = $('#inputSubcategoria4').val();
                if (idSubcat != null && nombreSubcat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/registrarSubcategoria",
                        data: "{'idPadre':'" + idSubcat + "','nombreSubcategoria':'" + nombreSubcat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $('#inputSubcategoria4').val('');
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría guardada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(5);
                        }
                    });
                } else {
                    swal({
                        title: "Error!!",
                        text: "No se permiten campos vacíos o no ha seleccionado una categoría",
                        icon: "warning",
                        button: "Aceptar"
                    });
                }
            }
        }

        function editarCategoria(typeExe) {
            if (typeExe == 1) {
                var idCat = $('#idCategoriaEdit').val();
                var nombreCat = $('#inputCategoria').val();

                if (nombreCat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/editarCategorias",
                        data: "{'idCat':'" + idCat + "','nombreCategoria':'" + nombreCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría editada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(1);
                            $('#btnCat').show();
                            $('#btnCatEdit').hide();
                            $('#inputCategoria').val('');
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
            } else if (typeExe == 2) {
                var idCat = $('#idSubcategoria1Edit').val();
                var nombreCat = $('#inputSubcategoria1').val();

                if (nombreCat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/editarCategorias",
                        data: "{'idCat':'" + idCat + "','nombreCategoria':'" + nombreCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría editada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(2);
                            $('#btnSub1').show();
                            $('#btnSub1Edit').hide();
                            $('#inputSubcategoria1').val('');
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
            } else if (typeExe == 3) {
                var idCat = $('#idSubcategoria2Edit').val();
                var nombreCat = $('#inputSubcategoria2').val();

                if (nombreCat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/editarCategorias",
                        data: "{'idCat':'" + idCat + "','nombreCategoria':'" + nombreCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría editada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(3);
                            $('#btnSub2').show();
                            $('#btnSub2Edit').hide();
                            $('#inputSubcategoria2').val('');
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
            } else if (typeExe == 4) {
                var idCat = $('#idSubcategoria3Edit').val();
                var nombreCat = $('#inputSubcategoria3').val();

                if (nombreCat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/editarCategorias",
                        data: "{'idCat':'" + idCat + "','nombreCategoria':'" + nombreCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría editada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(4);
                            $('#btnSub3').show();
                            $('#btnSub3Edit').hide();
                            $('#inputSubcategoria3').val('');
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
            } else if (typeExe == 5) {
                var idCat = $('#idSubcategoria4Edit').val();
                var nombreCat = $('#inputSubcategoria4').val();

                if (nombreCat != "") {
                    $.ajax({
                        type: "POST",
                        url: "Categoria.aspx/editarCategorias",
                        data: "{'idCat':'" + idCat + "','nombreCategoria':'" + nombreCat + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            swal({
                                title: "Éxito!!",
                                text: "Subcategoría editada!!",
                                icon: "success",
                                button: "Aceptar"
                            });
                            refresh(5);
                            $('#btnSub4').show();
                            $('#btnSub4Edit').hide();
                            $('#inputSubcategoria4').val('');
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
        }
    </script>
</asp:Content>
