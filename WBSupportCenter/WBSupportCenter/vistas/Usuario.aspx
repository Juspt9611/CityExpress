<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="WBSupportCenter.vistas.prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">

            <div class="box_table_container">
                <a class="btn btn-warning btn-sm text-white hidden pull-right" id="btnAtras" onclick="atras();">Atrás</a>
                <div class="row">
                    <h1 class="box_table_title" style="margin-bottom: 1rem;"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Usuario</h1>
                    <%--<span class="box_table_title" style="margin-bottom: 1rem;">Usuario</span>--%>
                </div>
                <div id="tblUser" class="hidden">
                    <table id="tblPers" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                    </table>
                </div>
                <div id="pnlCrearPer">
                    <div class="row insertUser">
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
                    <br />
                    <table id="tablaUsuarios" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%"></table>
                </div>
            </div>
        </div>
    </form>

    <script>
        var usuarioAdmin = $('#idAdmin').val();
        $(document).ready(function () {
            select2();
            //dataTableData();
            tablaUsuarios(usuarioAdmin);
        });

        function atras() {
            $("#camposActive").addClass('hidden');
            $("#divbtn").addClass('hidden');
            $("#btnAtras").addClass('hidden');
            $(".insertUser").show();
            tablaUsuarios(usuarioAdmin);
        }

        function tablaUsuarios(usuario) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Usuario.aspx/consultarUsuariosxAdmin",
                data: "{'usuario': '"+ usuario +"' }",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    console.log(response.d);
                    var jsonReporte = $.parseJSON(response.d);
                    console.log(jsonReporte);
                    $('#tablaUsuarios').DataTable({
                        data: jsonReporte,
                        orderCellsTop: true,
                        fixedHeader: true,
                        columns: [
                            { title: 'Nombres', data: 'nombre' },
                            { title: 'Apellidos', data: 'apellidos' },
                            { title: 'Usuario', data: 'nombreUsuario' },
                            { title: 'Rol', data: 'nombreRol' },
                            { title: 'Grupos', data: 'nombreGrupo' },
                            {
                                title: 'Detalle',
                                data: null,
                                sortable: false,
                                render: function (data, type, row) {
                                    return '<center><a class="btn btn-warning btn-sm text-white" onclick="editarUsuario(\'' + usuario + '\',\'' + '<%=Session["usuario"]%>' + '\', \'' + data.nombreUsuario + '\', \'' + data.nombreRol + '\', \'' + data.nombreGrupo + '\');">Editar</a></center>'
                                }
                            }
                        ]
                    });
                }
            });
        }

        function editarUsuario(admin, contra, usuario, rol, grupo) {
            if (contra != "") {
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Usuario.aspx/buscaDatos",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'Usuario':'" + admin + "','contrasena':'" + contra + "','UsuarioB':'" + usuario + "'}",
                    success: function (response) {
                        console.log(response.d);
                        if (response.d != "ErrorContraseña") {
                            if (response.d != "notuser") {
                                select2(rol, grupo);
                                $('#txtNombres').val(response.d[1])
                                $('#txtApellidos').val(response.d[2])
                                $("#txtuser").val(response.d[3])
                                if (response.d.length == 5) {
                                    $("#txtCorreo").val(response.d[4])
                                } else {
                                    $("#txtCorreo").val(response.d[3] + "@itesoluciones.com")
                                }
                                swal("Perfecto!", "Datos de " + response.d[1] + " encontrados", "success");
                                $("#camposActive").removeClass('hidden');
                                $("#divbtn").removeClass('hidden');
                                $("#btnAtras").removeClass('hidden');
                                $(".insertUser").hide();
                                $("#UsuarioB").val('');
                                $('#tablaUsuarios').DataTable().destroy();
                                $('#tablaUsuarios').empty();
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
        }

        function select2(rol, grupo) {
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

                    if (grupo == 'Support Center') {
                        $('#drowGrupo').val('1').trigger('change.select2');
                    } else if (grupo == 'Mejora') {
                        $('#drowGrupo').val('2').trigger('change.select2');
                    } else if (grupo == 'Marketing') {
                        $('#drowGrupo').val('3').trigger('change.select2');
                    }
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
                    if (rol == 'Administrador') {
                        $('#drowRol').val('1').trigger('change.select2');
                    } else if (rol == 'Redactor') {
                        $('#drowRol').val('2').trigger('change.select2');
                    } else if (rol == 'Autorizador') {
                        $('#drowRol').val('3').trigger('change.select2');
                    } else if (rol == 'Lector') {
                        $('#drowRol').val('4').trigger('change.select2');
                    }
                }
            });
        }

        function KeyPressed(e) {
            //Get the Key Code
            var code = (e.keyCode ? e.keyCode : e.which);
            if (code == 13) {
                event.preventDefault();
                swal({
                    text: 'Por favor, ingresa tu contraseña:',
                    content: "input"
                }).then(name => {
                    if (name != null) {
                        swal('hola' + '<%=Session["nombres"]%>');
                } else {
                        swal("Contraseña incorrecta.", "Por favor verifícala e inténtalo de nuevo.", "error");
                }
            });
        }
    }

    /*
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
    */
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
                    swal("Alta de usuario exitosa.", "", "success");
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
                name = name.trim();
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
                                        swal("Usuario encontrado.", "", "success");
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
