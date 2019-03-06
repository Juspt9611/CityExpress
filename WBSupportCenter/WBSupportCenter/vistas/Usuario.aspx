<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="WBSupportCenter.vistas.prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dataTables_filter {
            display: none; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">

            <div class="box_table_container">
                <%--<a class="btn btn-warning btn-sm text-white hidden pull-right" id="btnAtras" onclick="atras();">Atrás</a>--%>
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
                                <label for="nombre_box_form_crearart" class="col-form-label">Buscar un nombre de usuario para darlo de alta:</label>
                                <input type="text" id="UsuarioB" class="form-control" placeholder="Usuario" />
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <div class="form-group">
                                <label class="col-form-label" style="color: transparent;">Boton ir:</label>
                                <button type="button" class="btn btn-primary" id="btnInfor">Ir</button>
                                <%--<br />
                                <br />
                                <button type="button" class="btn btn-primary" id="btnInfor">Ir</button>--%>
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
                            <label for="nombre_box_form_crearart" class="col-form-label">Rol:</label>
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
                                <button type="button" class="btn btn-success pull-right" id="btnGuardar"><i class="fa fa-check" aria-hidden="true"></i>&nbsp Guardar</button>
                                <button type="button" class="btn btn-success pull-right" id="btnGuardarEdit"><i class="fa fa-check" aria-hidden="true"></i>&nbsp Editar</button>
                                <button type="button" class="btn btn-danger pull-right" style="color: #FFFFFF; margin-right: 10px;" id="atras"><i class="fa fa-times" aria-hidden="true"></i>&nbsp Cancelar</button>
                                <button type="button" class="btn btn-danger pull-right" style="color: #FFFFFF; margin-right: 10px;" id="atrasEdit"><i class="fa fa-times" aria-hidden="true"></i>&nbsp Cancelar</button>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="table" id="divTable">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="nombre_box_form_crearart" class="col-form-label">Buscar un usuario ya registrado:</label>
                                    <input type="text" id="txtUsuarioRegistrado" class="form-control" placeholder="Buscar" />
                                </div>
                            </div>
                        </div>
                        <table id="tablaUsuarios" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%"></table>
                    </div>
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>

    <script>
        var usuarioAdmin = $('#idAdmin').val();
        var passAdmin = $('#idPass').val();
        var idCreador = $('#idCreador').val();

        var idPersonal;
        var idUsuario;
        var idGrupo;
        var idRol;

        var arrayUsers = [];

        $(document).ready(function () {
            tablaUsuarios(usuarioAdmin, passAdmin);

            if (top.location != self.location) top.location = self.location;
            shortcut.add("space", function () { });

            $("#txtUsuarioRegistrado").keyup(function () {
                $('#tablaUsuarios').DataTable().search($("#txtUsuarioRegistrado").val()).draw();
            });

        });

        //function atras() {
        //    $("#camposActive").addClass('hidden');
        //    $("#divbtn").addClass('hidden');
        //    $("#btnAtras").addClass('hidden');
        //    $(".insertUser").show();
        //    tablaUsuarios(usuarioAdmin, passAdmin);
        //}

        $("#atras").click(function () {
            $("#form1")[0].reset();
            //select2();
            $("#camposActive").addClass('hidden');
            $("#divbtn").addClass('hidden');
            $("#divTable").removeClass('hidden');
            $(".insertUser").show();
            tablaUsuarios(usuarioAdmin, passAdmin);
            //$("#form1")[0].reset();
            //select2();
            //$("#camposActive").addClass('hidden');
            //$("#divbtn").addClass('hidden');
            //$(".insertUser").show();
            //$("#divTable").removeClass('hidden');
            //tablaUsuarios(usuarioAdmin, passAdmin);
        });

        $("#atrasEdit").click(function () {
            $("#form1")[0].reset();
            $("#camposActive").addClass('hidden');
            $("#divbtn").addClass('hidden');
            $("#divTable").removeClass('hidden');
            $(".insertUser").show();
            tablaUsuarios(usuarioAdmin, passAdmin);
        });

        function tablaUsuarios(usuario, pass) {
            arrayUsers = [];
            $.ajax({
                async: false,
                type: "POST",
                url: "Usuario.aspx/consultarUsuariosxAdmin",
                data: "{'usuario': '" + usuario + "' }",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    console.log(response.d);
                    var jsonReporte = $.parseJSON(response.d);
                    console.log(jsonReporte);
                    $('#tablaUsuarios').DataTable({
                        data: jsonReporte,
                        dom: '<"pull-left"f><"pull-right">tip',
                        language: {
                            "searchPlaceholder": "Usuario",
                            "search": "Buscar un nombre de usuario ya registrado: </br>",
                            //"emptyTable": "No hay información",
                            "infoEmpty": "Mostrando 0 de 0 entradas",
                            "zeroRecords": "Sin resultados encontrados",
                            "oPaginate": {
                                "sPrevious": "Ant.", // This is the link to the previous page
                                "sNext": "Sig."
                            }
                        },
                        orderCellsTop: true,
                        fixedHeader: true,
                        pageLength: 10,
                        columns: [
                            { title: 'Nombres', data: 'nombre' },
                            { title: 'Apellidos', data: 'apellidos' },
                            { title: 'Usuario', data: 'nombreUsuario' },
                            { title: 'Rol', data: 'nombreRol' },
                            { title: 'Grupos', data: 'nombreGrupo' },
                            { title: 'Id Rol', data: 'idRol', visible: false },
                            { title: 'Id Personal', data: 'idPersonal', visible: false },
                            { title: 'Id Usuario', data: 'idUsuario', visible: false },
                            { title: 'Id Grupos', data: 'idGrupos', visible: false },
                            {
                                title: 'Detalle',
                                data: null,
                                sortable: false,
                                render: function (data, type, row) {
                                    arrayUsers.push(data.nombreUsuario);
                                    return '<center><a class="btn btn-warning btn-sm" onclick="editarUsuario(\'' + usuario + '\',\'' + pass + '\', \'' + data.nombreUsuario + '\', \'' + data.nombreRol + '\', \'' + data.nombreGrupo + '\', \'' + data.idPersonal + '\', \'' + data.idUsuario + '\', \'' + data.idGrupos + '\', \'' + data.idRol + '\');"><i class="fa fa-pencil" aria-hidden="true"></i> Editar</a></center>'
                                    //return '<center><a class="btn btn-warning btn-sm text-white" onclick="editarUsuario(\'' + usuario + '\',\'' + 'Lun4-963$%' + '\', \'' + data.nombreUsuario + '\', \'' + data.nombreRol + '\', \'' + data.nombreGrupo + '\');">Editar</a></center>';
                                }
                            }
                        ]
                    });
                }
            });
        }

        function editarUsuario(admin, contra, usuario, rol, grupo, idP, idU, idG, idR) {
            idPersonal = idP;
            idUsuario = idU;
            idGrupo = idG;
            idRol = idR;
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
                                select2(rol, idGrupo);
                                $('#txtNombres').val(response.d[1])
                                $('#txtApellidos').val(response.d[2])
                                $("#txtuser").val(response.d[3])
                                if (response.d.length == 5) {
                                    $("#txtCorreo").val(response.d[4])
                                } else {
                                    $("#txtCorreo").val(response.d[3] + "@hotelescity.com")
                                }
                                //swal("Perfecto!", "Datos de " + response.d[1] + " encontrados", "success");
                                $("#camposActive").removeClass('hidden');
                                $("#divbtn").removeClass('hidden');
                                $("#btnAtras").removeClass('hidden');
                                $(".insertUser").hide();
                                $("#UsuarioB").val('');
                                $('#tablaUsuarios').DataTable().destroy();
                                $('#tablaUsuarios').empty();
                                $("#btnGuardarEdit").removeClass('hidden');
                                $("#btnGuardar").addClass('hidden');
                                $("#atrasEdit").removeClass('hidden');
                                $("#atras").addClass('hidden');
                            } else {
                                swal("Oh no!", "Usuario no encontrado", "error");
                            }
                        } else {
                            swal("Contraseña incorrecta.", "Por favor verifícala e inténtalo de nuevo.", "error");
                        }
                    }
                });
                //swal('hola: '+'<%=Session["nombres"]%>');
            }
        }

        function select2(rol, idGrupo) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Usuario.aspx/LlenaGrupo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var opciones = "";
                    $.each(jQuery.parseJSON(data.d), function (item, index) {
                        //opciones += '<option value="' + index.nombreGrupo + '" id="' + index.idGrupo + '">' + index.nombreGrupo + '</option>';
                        opciones += '<option value="' + index.idGrupo + '">' + index.nombreGrupo + '</option>';
                    });
                    $('#drowGrupo').html(opciones);
                    $('#drowGrupo').select2({ placeholder: 'Selecciona...' });
                    if (idGrupo != undefined) {
                        var str = idGrupo;
                        var separador = ", ";
                        var arregloGrup = str.split(separador);
                        $('#drowGrupo').val(arregloGrup).trigger('change.select2');
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

        $("#btnGuardar").click(function () {
            var varGrup = "";
            var varRol = "";
            if ($('#drowGrupo').val() != null) {
                $.each($("#drowGrupo").val(), function (index, value) {
                    varGrup += value + "|";
                });
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Usuario.aspx/InsertarUsuario",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'idCreador':'" + idCreador + "', 'Nombres':'" + $("#txtNombres").val() + "','Apellido':'" + $("#txtApellidos").val() + "','Usuario':'" + $('#UsuarioB').val() + "','grupos':'" + varGrup.substring(0, varGrup.length - 1) + "','rol':'" + $("#drowRol").val() + "'}",
                    success: function (response) {
                        console.log(response.d);
                        if (response.d == true) {
                            swal("Alta de usuario exitosa.", "", "success");
                            $("#form1")[0].reset();
                            select2();
                            $("#camposActive").addClass('hidden');
                            $("#divbtn").addClass('hidden');
                            $("#divTable").removeClass('hidden');
                            $(".insertUser").show();
                            tablaUsuarios(usuarioAdmin, passAdmin);
                        } else {
                            swal("Oh no!", "Algo salio mal", "error");
                        }

                    }
                });
            } else {
                swal("Campo vacío", "Ingresar por lo menos un grupo", "error");
            }

        });

        $("#btnGuardarEdit").click(function () {
            var arrayGrups = [];
            if ($('#drowGrupo').val() != null) {
                $.each($("#drowGrupo").val(), function (index, value) {
                    arrayGrups.push(value);
                });
                console.log(arrayGrups);
                var arrayString = arrayGrups.join();
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Usuario.aspx/EditarUsuario",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'idPersonal':'" + idPersonal + "','idUsuario':'" + idUsuario + "','idGrupo':'" + arrayString + "','idRol':'" + $("#drowRol").val() + "'}",
                    success: function (response) {
                        console.log(response.d);
                        if (response.d == true) {
                            swal("Edición de usuario exitosa.", "", "success");
                            $("#camposActive").addClass('hidden');
                            $("#divbtn").addClass('hidden');
                            $("#btnAtras").addClass('hidden');
                            $(".insertUser").show();
                            tablaUsuarios(usuarioAdmin, passAdmin);
                        } else {
                            swal("Oh no!", "Algo salio mal", "error");
                        }
                    }
                });
            } else {
                swal("Campo vacío", "Ingresar por lo menos un grupo", "error");
            }
        });

        $("#btnInfor").click(function () {
            if ($("#UsuarioB").val() != "") {
                //for (var i = 0; i <= arrayUsers.length; i++) {
                //    if (arrayUsers[i] == $('#UsuarioB').val()) {
                //        var existe = true;
                //    }
                //}
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Usuario.aspx/consultarUsuarioExiste",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'nombreUsuario':'" + $("#UsuarioB").val() + "'}",
                    success: function (response) {
                        var json = $.parseJSON(response.d);
                        if (json[0].estatus > 0) {
                            swal("Usuario ya activado", "Intentar con nuevo usuario", "error");
                        } else {
                            swal({
                                text: 'Por favor, ingresa tu contraseña:',
                                content: {
                                    element: "input",
                                    attributes: {
                                        //placeholder: "Type your password",
                                        type: "password",
                                    }
                                }
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
                                                    $("#divTable").addClass('hidden');
                                                    select2();
                                                    $('#txtNombres').val(response.d[1])
                                                    $('#txtApellidos').val(response.d[2])
                                                    $("#txtuser").val(response.d[3])
                                                    if (response.d.length == 5) {
                                                        $("#txtCorreo").val(response.d[4])
                                                    } else { $("#txtCorreo").val(response.d[3] + "@hotelescity.com") }
                                                    swal("Usuario encontrado.", "", "success");
                                                    $('#tablaUsuarios').DataTable().destroy();
                                                    $('#tablaUsuarios').empty();
                                                    $("#camposActive").removeClass('hidden');
                                                    $("#divbtn").removeClass('hidden');
                                                    $("#btnGuardar").removeClass('hidden');
                                                    $("#btnGuardarEdit").addClass('hidden');
                                                    $("#atras").removeClass('hidden');
                                                    $("#atrasEdit").addClass('hidden');
                                                    $(".insertUser").hide();
                                                } else {
                                                    swal("Oh no!", "Usuario no encontrado", "error");
                                                }
                                            } else {
                                                swal("Contraseña incorrecta.", "Por favor verifícala e inténtalo de nuevo.", "error");
                                            }
                                        }
                                    });
                                    //swal('hola: '+'<%=Session["nombres"]%>');
                                }
                            })
                        }
                    }
                });
            } else {
                 swal("Campo vacío", "Ingresar un nombre de usuario", "error");
            }
        });
    </script>
</asp:Content>
