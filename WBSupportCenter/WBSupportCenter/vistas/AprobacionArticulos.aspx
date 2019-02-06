<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="AprobacionArticulos.aspx.cs" Inherits="WBSupportCenter.vistas.articulosVistos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table.dataTable thead th, table.dataTable thead td {
            border-bottom: 1px solid #ddd !important;
        }

        body {
            color: #000000 !important;
        }

        .pull-left {
            float: left !important;
        }

        .pull-right {
            float: right !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="contenidoTabla">
        <div class="box_table_container">
            <a class="btn btn-danger btn-sm text-white pull-right" id="btnEliminar" onclick="eliminar();">Eliminar</a>
            <a class="btn btn-primary btn-sm text-white pull-right hidden" id="btnAutorizar" onclick="autorizar();">Autorizar</a>
            <div class="row">
                <span class="box_table_title" id="titleSpan"></span>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
                    <br />
                    <table id="tablaAprobacionArticulos" class="table table-striped table-bordered nowrap display dataTable " width="100%">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Contenido</th>
                                <th>Estatus</th>
                                <th>Versión</th>
                                <th>Fecha</th>
                                <th>Usuario</th>
                                <th>Autorizador</th>
                                <th>Validador</th>
                                <th>Estatus</th>
                                <th>Detalle</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
                    <br />
                    <table id="tablaEliminacionArticulos" class="table table-striped table-bordered nowrap display dataTable hidden" width="100%"></table>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="container" id="contenidoArticulo" hidden>
        <div id="box-blog" class="box_table_container">
            <div class="row">
                <span id="titleCard" class="box_table_title" style="margin-bottom: 1rem; font-weight: 700; text-align: center !important; font-size: 2rem;"></span>
            </div>
            <div class="row">
                <div id="box-contenido-blog">
                </div>
            </div>
            <div class="row">
                <div id="box-Botones-blog" class="col-lg-12 box_table_buttons">
                    <button class="btn btn-warning pull-left" style="border-right: 5px;" id="atras"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp Regresar</button>
                    <button class="btn btn-success pull-right" style="color: #FFFFFF;" id="aceptar"><i class="fa fa-check" aria-hidden="true"></i>&nbsp Aprobar</button>
                    <button type="button" class="btn btn-danger pull-right" style="color: #FFFFFF; margin-right: 10px;" id="rechazar"><i class="fa fa-times" aria-hidden="true"></i>&nbsp Rechazar</button>
                </div>
            </div>
        </div>
        <br>
    </div>
    <script>
        $(document).ready(function () {
            var datos = new Array();
            var dataTable;
            var idArticulo = null;
            var estatus = null;
            var comentario = null;
            console.log("ready");
            init();
            //bootsVal();
            $('#titleSpan').text('Autorizar artículos');
        });

        function eliminar() {
            $('#tablaAprobacionArticulos').DataTable().destroy();
            $('#tablaAprobacionArticulos').empty();
            $('#titleSpan').text('Eliminar artículos');
            $('#btnAutorizar').removeClass('hidden');
            $('#btnEliminar').addClass('hidden');
            dataTableDataDelete();
            $('#tablaEliminacionArticulos').removeClass('hidden');
        }

        function autorizar() {
            $('#titleSpan').text('Autorizar artículos');
            $('#btnAutorizar').addClass('hidden');
            $('#btnEliminar').removeClass('hidden');
            $('#tablaEliminacionArticulos').DataTable().destroy();
            $('#tablaEliminacionArticulos').empty();
            $('#tablaEliminacionArticulos').addClass('hidden');
            dataTableData();
        }

        function init() {
            dataTableData();
            $('#tablaAprobacionArticulos thead tr:eq(1) th').each(function (i) {
                var title = $(this).text();
                $('input', this).on('keyup change', function () {
                    if (dataTable.column(i).search() !== this.value) {
                        dataTable
                            .column(i)
                            .search(this.value)
                            .draw();
                    }
                });
            });

            $("#aceptar").click(function (e) {
                e.preventDefault(), swal({
                    title: "¿Aprobar artículo?",
                    text: "",
                    icon: "info",
                    closeOnClickOutside: false,
                    buttons: {
                        cancel: {
                            text: "Cancelar",
                            value: null,
                            visible: !0,
                            className: "btn btn-default",
                            closeModal: !0
                        },
                        confirm: {
                            text: "Aprobar",
                            value: !0,
                            visible: !0,
                            className: "btn btn-info",
                            closeModal: !0
                        }
                    }
                }).then((willDelete) => {
                    $(".swal-button swal-button--confirm btn btn-info").click(function () {
                        $(".swal-button swal-button--confirm btn btn-info").attr("disabled", true);
                    })
                    if (willDelete) {
                        swal("Operación exitosa", {
                            icon: "success",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                        estatus = 1;
                        saveEstatusArticulo(idArticulo, estatus);
                    } else {
                        $(".swal-button swal-button--confirm btn btn-info").attr("disabled", false);
                    }
                });
            })

            $("#atras").click(function () {
                $("#contenidoArticulo").hide();
                $("#contenidoTabla").fadeIn(2000);
            });

            $("#rechazar").click(function () {
                //bootsVal();
                swal({
                    title: "Agregar comentario",
                    text: "¿Por qué se rechaza el artículo?",
                    buttons: true,
                    dangerMode: true,
                    content: {
                        element: "input",
                    },
                    buttons: {
                        cancel: {
                            text: "Cancelar",
                            //value: null,
                            visible: !0,
                            className: "btn btn-default",
                            closeModal: !0
                        },
                        confirm: {
                            text: "Rechazar",
                            //value: !0,
                            visible: !0,
                            className: "btn btn-info",
                            closeModal: !0
                        }
                    }
                }).then((value) => {
                    if (value == null) {
                        $(".swal-button swal-button--cancel btn btn-default").attr("disabled", false);
                    }else if (value != "") {
                        estatus = 2;
                        saveEstatusArticulo(idArticulo, estatus, value);
                        swal("Rechazado exitosamente", {
                            icon: "success",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                    } else if (value == "") {
                       swal("Ingresar comentario", {
                            icon: "error",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                    }           
                });
            });
        }

        function dataTableData() {
            var datos = null;
            $.ajax({
                type: 'POST',
                url: 'AprobacionArticulos.aspx/consultarArticuloAprobar',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    datos = response.d;
                    var json = $.parseJSON(datos);
                    dataTable = $('#tablaAprobacionArticulos').DataTable({
                        data: json,
                        dom: '<"pull-left"f><"pull-right">tip',
                        "data": json,
                        orderCellsTop: true,
                        fixedHeader: true,
                        pageLength: 10,
                        language: {
                            zeroRecords: 'Sin resultados encontrados',
                            infoEmpty: 'Mostrando 0 de 0 entradas',
                            "oPaginate": {
                                "sPrevious": "Ant.", // This is the link to the previous page
                                "sNext": "Sig."
                            }
                        },
                        columns: [
                            { title: "Código" },
                            { title: "Nombre" },
                            { title: "Contenido", "visible": false },
                            { title: "EstatusArticulo", "visible": false },
                            { title: "Version", "visible": false },
                            { title: "Fecha" },
                            { title: "idUsuario", "visible": false },
                            { title: "Autorizador", "visible": false },
                            { title: "Validador", "visible": false },
                            {
                                "title": "Estatus",
                                "mData": null,
                                "bSortable": false,
                                "mRender": function (data, type, full) {
                                    if (data[3] == 1) {
                                        return '<span class="label label-success">Aprobado</span>';
                                    } else if (data[3] == 2) {
                                        return '<span class="label label-danger">Rechazado</span>';
                                    } else {
                                        return '<span class="label label-primary">Pendiente</span>';
                                    }
                                }
                            },
                            {
                                "title": "Detalle",
                                "mData": null,
                                "bSortable": false,
                                "mRender": function (data, type, full) {
                                    return '<a class="btn btn-info btn-sm boton" style="width: 100%; color: #FFFFFF;">' + 'Revisar' + '</a>';
                                }
                            }
                        ]
                    });
                    $('#tablaAprobacionArticulos').on('click', 'tbody .boton', function () {
                        var data_row = dataTable.row($(this).closest('tr')).data();
                        $("#contenidoTabla").hide();
                        $('#contenidoArticulo').removeAttr('hidden').fadeIn(2000);
                        addDataCard(data_row);
                    })
                },
                failure: function (response) {
                    console.log(response);
                }
            });
        }

        function dataTableDataDelete() {
            var datos = null;
            $.ajax({
                type: 'POST',
                url: 'AprobacionArticulos.aspx/consultarArticulosAprobados',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    console.log(response);
                    datos = response.d;
                    console.log(datos);
                    var json = $.parseJSON(datos);
                    console.log(json);
                    $('#tablaEliminacionArticulos').DataTable({
                        data: json,
                        dom: '<"pull-left"f><"pull-right">tip',
                        orderCellsTop: true,
                        fixedHeader: true,
                        language: {
                            zeroRecords: 'Sin resultados encontrados',
                            infoEmpty: 'Mostrando 0 de 0 entradas',
                            "oPaginate": {
                                "sPrevious": "Ant.", // This is the link to the previous page
                                "sNext": "Sig."
                            }
                        },
                        columns: [
                            { title: 'Código', data: 'idarticulo' },
                            { title: 'Nombre', data: 'nombreArticulo' },
                            { data: 'autor', visible: false },
                            { data: 'contenido', visible: false },
                            { data: 'idEstatusArticulo', visible: false },
                            { title: 'Versión', data: 'version' },
                            { title: 'Fecha de Creación', data: 'fechaCreacion' },
                            { data: 'nombreCategoria', visible: false },
                            { title: 'Estatus', data: 'estatus' },
                            {
                                title: 'Detalle',
                                data: null,
                                sortable: false,
                                render: function (data, type, row) {
                                    console.log(data.idarticulo);
                                    return '<center><a class="btn btn-danger btn-sm text-white" onclick="eliminarArticulo(' + data.idarticulo + ');">Eliminar</a></center>'
                                }
                            }
                        ]
                    });
                },
                failure: function (response) {
                    console.log(response);
                }
            });
        }

        function eliminarArticulo(idArticulo) {
            console.log(idArticulo);
            $.ajax({
                type: 'POST',
                url: 'AprobacionArticulos.aspx/eliminarArticulo',
                data: '{ idArticulo: ' + idArticulo + ' }',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    swal("¡Éxito!", "¡¡¡El registro ha sido eliminado correctamente!!!", "success");
                },
                failure: function (response) {
                    console.log(response);
                }
            });
            $('#tablaEliminacionArticulos').DataTable().destroy();
            $('#tablaEliminacionArticulos').empty();
            dataTableDataDelete();
        }

        function addDataCard(data_row) {
            idArticulo = null;
            idArticulo = data_row[0];
            $("#titleCard").empty();
            $("#box-contenido-blog").empty();
            $("#titleCard").append(data_row[1]);
            $("#box-contenido-blog").append(data_row[2]);
        }

        function saveEstatusArticulo(idArticulo, estatus, comentario) {
            $.ajax({
                async: false,
                type: "POST",
                url: 'AprobacionArticulos.aspx/guardarEstatusArticuloAprobar',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArticulo': '" + idArticulo + "', 'estatus': '" + estatus + "','comentario': '" + comentario + "' }",
                success: function (response) {
                    if (response = "success") {
                        swal("Operación exitosa", {
                            icon: "success",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });

                        $("#contenidoArticulo").hide();
                        $("#contenidoTabla").fadeIn(2000);
                        dataTable.destroy();
                        dataTableData();
                        $("#0").val("");
                        $("#1").val("");
                        $("#5").val("");
                        $("#9").val("");
                    }
                },
                failure: function (response) {
                    console.log(response);
                }
            });
        }
    </script>
</asp:Content>