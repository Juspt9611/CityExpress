<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="WBSupportCenter.vistas.prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">

            <div class="box_table_container">
                <div class="row">
                    <h1 class="box_table_title" style="margin-bottom: 1rem;"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Usuario</h1>
                    <%--<span class="box_table_title" style="margin-bottom: 1rem;">Usuario</span>--%>
                </div>

                <div id="tblUser" class="hidden">
                    <table id="tblPers" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                    </table>
                </div>



                <div id="pnlCrearPer">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="nombre_box_form_crearart" class="col-form-label">Nombre Usuario:</label>
                                <input type="text" id="UsuarioB" class="form-control" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <br />
                                <br />
                                <button type="button" class="btn btn-primary" id="btnInfor">Ir</button>
                            </div>
                        </div>
                    </div>
                    <div class="row hidden" id="camposActive">
                        <div class="col-lg-4">
                            <label for="nombre_box_form_crearart" class="col-form-label">Nombres:</label>
                            <input type="text" id="txtNombres" class="form-control" disabled style="background-color: #ffffff !important; border-color: #fff !important; font-weight: 800 !important;" />
                            <%--<asp:TextBox ID="txtNombres" runat="server" class="form-control" disabled></asp:TextBox>--%>
                        </div>
                        <div class="col-lg-4">
                            <label for="nombre_box_form_crearart" class="col-form-label">Apellidos:</label>
                            <input type="text" id="txtApellidos" class="form-control" disabled style="background-color: #ffffff !important; border-color: #fff !important; font-weight: 800 !important;" />
                            <%--<asp:TextBox ID="txtApellidos" runat="server" class="form-control" disabled></asp:TextBox>--%>
                        </div>
                        <div class="col-lg-4">
                            <label for="nombre_box_form_crearart" class="col-form-label">Correo:</label>
                            <input type="text" id="txtCorreo" class="form-control" disabled style="background-color: #ffffff !important; border-color: #fff !important; font-weight: 800 !important;" />
                            <%--<asp:TextBox ID="txtCorreo" runat="server" class="form-control" disabled></asp:TextBox>--%>
                        </div>
                        <%--<div class="col-lg-3">
                        <label for="nombre_box_form_crearart" class="col-form-label">Usuario:</label>
                        <input type="text" id="txtuser" class="form-control" disabled style="background-color: #ffffff !important; border-color: #fff !important;font-weight: bold 700 !important; " />
                        <%--<asp:TextBox ID="txtuser" runat="server" class="form-control" disabled></asp:TextBox>
                    </div>--%>
                        <br />
                        <br />
                        <div class="col-lg-6">
                            <label for="nombre_box_form_crearart" class="col-form-label">Grupo(s):</label>
                            <select class="js-example-responsive form-control" style="width: 100%" name="grupo[]" multiple="multiple" id="drowGrupo">
                            </select>
                        </div>
                        <div class="col-lg-6">
                            <label for="nombre_box_form_crearart" class="col-form-label">Roles:</label>
                            <select class="js-example-responsive form-control" style="width: 100%" name="drowRol" id="drowRol">
                            </select>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row hidden" id="divbtn">
                        <span class="box_table_title" style="margin-bottom: 1rem;"></span>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <button type="button" class="btn btn-success pull-right" id="btnGuardar"><span class="fa fa-floppy-o"></span>Guardar</button>
                            </div>
                        </div>
                    </div>
                    <table id="tablaUsuarios" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%"></table>
                    <table id="tablaUsuarios" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Usuario</th>
                                <th>Rol</th>
                                <th>Grupos</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </form>

    <script>
        $(document).ready(function () {
            select2();
            dataTableData();
        });

        function dataTableData() {
            $.ajax({
                async: false,
                type: 'POST',
                url: 'Reporte.aspx/ObtenerDatos',
                data: "{'fechaInicial': '}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    successResp = jsonReporte;
                    console.log(jsonReporte);
                    console.log(reporteSelect);

                    if (jsonReporte != null) {

                        if (reporteSelect == "palabras") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.palabraBuscada,
                                    visits: parseInt(index.numeroDeBusquedas, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                //dom: 'Bfrt<"col-md-6 inline"i> <"col-md-6 inline"p>',
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                    {
                                        extend: 'excelHtml5',
                                        text: '<i class="fa fa-file-excel-o"></i>',
                                        titleAttr: 'Exportar Excel',
                                        className: 'btn btn-app export excel',
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        text: '<i class="fa fa-file-pdf-o"></i>',
                                        titleAttr: 'Exportar PDF',
                                        className: 'btn btn-app export pdf',
                                        //exportOptions: {
                                        // columns: [0, 1]
                                        //},
                                    },
                                    ]
                                },
                                columns: [
                                { data: "palabraBuscada", title: 'Palabra buscada' },
                                { data: "numeroDeBusquedas", title: 'Número de búsquedas' }
                                ]
                            });
                        }
                        else if (reporteSelect == "valorados") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.nombreArticulo,
                                    visits: parseInt(index.calificacionTotal, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                    {
                                        extend: 'excelHtml5',
                                        text: '<i class="fa fa-file-excel-o"></i>',
                                        titleAttr: 'Exportar Excel',
                                        className: 'btn btn-app export excel',
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        text: '<i class="fa fa-file-pdf-o"></i>',
                                        titleAttr: 'Exportar PDF',
                                        className: 'btn btn-app export pdf',
                                        //exportOptions: {
                                        // columns: [0, 1]
                                        //},
                                    },
                                    ]
                                },
                                columns: [
                                { data: "idArticulo", title: 'Id del artículo' },
                                { data: "nombreArticulo", title: 'Nombre del artículo' },
                                { data: "categoria", title: 'Categoría' },
                                {
                                    data: "promedioCalificacion", title: 'Promedio de calificación', render: function (data, type, row) {
                                        var starPercentage = data / 5 * 100;
                                        var starPercentageRounded = Math.round(starPercentage / 10) * 10 + "%";
                                        return '<div class="stars-outer"><div class="stars-inner" style="width: ' + starPercentageRounded + ';"></div></div>';
                                    }
                                },
                                { data: "calificacionTotal", title: 'Calificación total' }
                                ]
                            });
                        }
                        else if (reporteSelect == "vistos") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.nombreArticulo,
                                    visits: parseInt(index.visitas, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                    {
                                        extend: 'excelHtml5',
                                        text: '<i class="fa fa-file-excel-o"></i>',
                                        titleAttr: 'Exportar Excel',
                                        className: 'btn btn-app export excel',
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        text: '<i class="fa fa-file-pdf-o"></i>',
                                        titleAttr: 'Exportar PDF',
                                        className: 'btn btn-app export pdf',
                                        //exportOptions: {
                                        // columns: [0, 1]
                                        //},
                                    },
                                    ]
                                },
                                columns: [
                                { data: "idArticulo", title: 'Id del artículo' },
                                { data: "nombreArticulo", title: 'Nombre del artículo' },
                                { data: "categoria", title: 'Categoría' },
                                { data: "visitas", title: 'Visitas' }
                                ]
                            });
                        }
                        else if (reporteSelect == "vistas") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.categoria,
                                    visits: parseInt(index.categoriaMasVista, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                    {
                                        extend: 'excelHtml5',
                                        text: '<i class="fa fa-file-excel-o"></i>',
                                        titleAttr: 'Exportar Excel',
                                        className: 'btn btn-app export excel',
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        text: '<i class="fa fa-file-pdf-o"></i>',
                                        titleAttr: 'Exportar PDF',
                                        className: 'btn btn-app export pdf',
                                        //exportOptions: {
                                        // columns: [0, 1]
                                        //},
                                    },
                                    ]
                                },
                                columns: [
                                { data: "categoria", title: 'Categoría' },
                                { data: "categoriaMasVista", title: 'Número de vistas' }
                                ]
                            });
                        }

                        repetirBusqueda = true;
                        jsonReporte = [];

                    } else {
                        swal("No se encontraron datos para esta búsqueda.", {
                            icon: "error",
                            button: "Aceptar",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                        $(".swal-button").click(function () {
                            //closeSite();
                        });
                        repetirBusqueda = false;
                    }

                },
                failure: function (response) {
                    console.log(response);
                }
            });
        }

        function select2() {
            $.ajax({
                async: false,
                type: "POST",
                url: "Usuario.aspx/LlenaGrupo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var opciones = "";
                    $.each(jQuery.parseJSON(data.d), function (item, index) {
                        opciones += '<option value="' + index.idGrupo + '">' + index.nombreGrupo + '</option>';
                    });
                    $('#drowGrupo').html(opciones);
                    $('#drowGrupo').select2({ placeholder: 'Selecciona...' });
                }
            });
            $.ajax({
                async: false,
                type: "POST",
                url: "Usuario.aspx/LlenaRol",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var opciones = "";
                    $.each(jQuery.parseJSON(data.d), function (item, index) {
                        opciones += '<option value="' + index.idRol + '">' + index.nombreRol + '</option>';
                    });
                    $('#drowRol').html(opciones);
                    $('#drowRol').select2({ placeholder: 'Selecciona...' });
                }
            });
        }

        function KeyPressed(e) {
            //Get the Key Code
            var code = (e.keyCode ? e.keyCode : e.which);
            if (code == 13) {
                event.preventDefault();
                swal({
                    text: 'Por seguridad escriba su contraseña',
                    content: "input"
                }).then(name => {
                    if (name != null) {
                        swal('hola' + '<%=Session["nombres"]%>');
                } else {
                    swal("Oh no!", "La contraseña es incorrecta", "error");
                }
                });
        }
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
                console.log(json);
                dataTable = $('#tablaAprobacionArticulos').DataTable({
                    data: json,
                    orderCellsTop: true,
                    fixedHeader: true,
                    "lengthMenu": [[15, 30, 50, 100], [15, 30, 50, 100]],
                    columns: [
                        { title: "ID", "visible": false },
                        { title: "Nombre" },
                        { title: "Apellidos" },
                        { title: "Usuario" },
                        { title: "Fecha" },
                        {
                            "title": "Detalle",
                            "mData": null,
                            "bSortable": false,
                            "mRender": function (data, type, full) {
                                return '<a class="btn btn-info btn-sm boton" style="width: 100%; color: #FFFFFF;">' + 'Ver' + '</a>';
                            }
                        }

                    ]
                });
                $('#tablaAprobacionArticulos').on('click', 'tbody .boton', function () {
                    var data_row = dataTable.row($(this).closest('tr')).data();
                    console.log(data_row[2]);
                    console.log("###");
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

    $("#btnGuardar").click(function () {

        var varGrup = "";
        var varRol = "";
        //console.log(arrayDeCadenas);

        $.each($("#drowGrupo").val(), function (index, value) { varGrup += value + "|"; });
        $.ajax({
            async: false,
            type: "POST",
            url: "Usuario.aspx/InsertarUsuario",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "{'Nombres':'" + $("#txtNombres").val() + "','Apellido':'" + $("#txtApellidos").val() + "','Usuario':'" + $('#UsuarioB').val() + "','grupos':'" + varGrup.substring(0, varGrup.length - 1) + "','rol':'" + $("#drowRol").val() + "'}",
            success: function (response) {

                console.log(response.d);

                if (response.d == true) {
                    swal("Perfecto!", "Usuario agregado " + $("#txtNombres").val(), "success");
                    $("#form1")[0].reset();
                    select2();
                    $("#camposActive").addClass('hidden');
                    $("#divbtn").addClass('hidden');

                } else {

                    swal("Oh no!", "Algo salio mal", "error");
                }

            }
        });
    });

    $("#btnInfor").click(function () {
        swal({
            text: 'Por seguridad escriba su contraseña',
            content: "input"
        }).then(name => {
            if (name != "") {
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Usuario.aspx/buscaDatos",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'Usuario':'" + '<%=Session["usuario"]%>' + "','contrasena':'" + name + "','UsuarioB':'" + $('#UsuarioB').val() + "'}",
                            success: function (response) {
                                console.log(response.d);
                                if (response.d != "ErrorContraseña") {
                                    if (response.d != "notuser") {
                                        select2();
                                        $('#txtNombres').val(response.d[1])
                                        $('#txtApellidos').val(response.d[2])
                                        $("#txtuser").val(response.d[3])
                                        if (response.d.length == 5) {
                                            $("#txtCorreo").val(response.d[4])
                                        } else { $("#txtCorreo").val(response.d[3] + "@itesoluciones.com") }
                                        swal("Perfecto!", "Datos de " + response.d[1] + " encontrados", "success");
                                        $("#camposActive").removeClass('hidden');
                                        $("#divbtn").removeClass('hidden');
                                    } else {
                                        swal("Oh no!", "Usuario no encontrado", "error");
                                    }
                                } else {
                                    swal("Oh no!", "Contraseña incorrecta", "error");
                                }
                            }
                        });
                        //swal('hola: '+'<%=Session["nombres"]%>');
                    }
                })
            });
    </script>
</asp:Content>
