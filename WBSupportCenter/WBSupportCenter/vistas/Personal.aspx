<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="WBSupportCenter.vistas.Personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .panel-default {
            border-color: #ddd;
        }

        .panel {
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .panel-default > .panel-heading {
            color: #fcea1d;
            background-color: #0181bb;
            border-color: #ddd;
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
        }

        .panel-heading {
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            font-weight: bold;
        }

        .panel-body {
            padding: 15px;
            border-color: #000000 !important;
            background-color: #f2f4f4;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="panel panel-default col-12">
        <div class="panel-heading">Alta de Personal</div>
        <div class="panel-body">
            <header>
                <div class="row">
                    <div class="col-12 text-right">
                        <a id="btnAgregar" class="btn btn-primary" href="javascript:void(0)" onclick="showContent(2);" role="button"><i class="fas fa-user-plus"></i>&nbsp;Agregar</a>
                        <a id="btnAtrás" class="btn btn-warning" href="javascript:void(0)" onclick="showContent(1);" role="button"><i class="fas fa-arrow-alt-circle-left"></i>&nbsp;Atrás</a>
                    </div>
                </div>
            </header>
            <hr />
            <br />
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <div id="contentCreate" class="hidden">
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <h2>Personal</h2>
                                <div class="form-group text-dark">
                                    <label for="textInputNombre">Nombre</label>
                                    <asp:TextBox ID="textInputNombre" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-dark">
                                    <label for="textInputApellidoP">Apellido Paterno</label>
                                    <asp:TextBox ID="textInputApellidoP" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-dark">
                                    <label for="textInputApellidoM">Apellido Materno</label>
                                    <asp:TextBox ID="textInputApellidoM" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" id="checkBoxEstatus" class="custom-control-input" checked disabled />
                                    <label class="custom-control-label" for="checkBoxEstatus">Estatus</label>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <h2>Grupos</h2>
                                <br>
                                <div class="input-group mb-3 text-dark">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="dropDownGrupos">Opciones</label>
                                    </div>
                                    <select class="selectGrupo" name="grupos[]" multiple="true" id="grupoSelect" style="width: 80%" runat="server">
                                        <option value="1">SupportCenter</option>
                                        <option value="2">Mejora</option>
                                        <option value="3">Marketing</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12 col-mg-6 col-lg-6">
                                <h2>Usuarios</h2>
                                <div class="form-group text-dark">
                                    <label for="textInputUsuario">Usuario</label>
                                    <asp:TextBox ID="textInputUsuario" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-dark">
                                    <label for="textInputContra">Contraseña</label>
                                    <asp:TextBox ID="textInputContra" type="password" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <h2>Roles</h2>
                                <br>
                                <div class="input-group mb-3 text-dark">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="dropDownRoles">Opciones</label>
                                    </div>
                                    <select class="selectRol" name="roles[]" multiple="true" id="rolSelect" style="width: 80%" runat="server">
                                        <option value="1">Administrador</option>
                                        <option value="2">Redactor</option>
                                        <option value="3">Autorizador</option>
                                        <option value="4">Lector</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-right">
                                <asp:LinkButton id="btnGuardar" runat="server" class="btn btn-success" OnClick="btnGuardar_Click"><i class="fas fa-save"></i>&nbsp;Guardar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <div id="contentEdit" class="hidden">
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <h2>Personal</h2>
                                <div class="form-group text-dark">
                                    <label for="textInputNombreEdit">Nombre</label>
                                    <asp:TextBox ID="textInputNombreEdit" runat="server" class="form-control textInputNombreEdit"></asp:TextBox>
                                </div>
                                <div class="form-group text-dark">
                                    <label for="textInputApellidoPEdit">Apellido Paterno</label>
                                    <asp:TextBox ID="textInputApellidoPEdit" runat="server" class="form-control textInputApellidoPEdit"></asp:TextBox>
                                </div>
                                <div class="form-group text-dark">
                                    <label for="textInputApellidoMEdit">Apellido Materno</label>
                                    <asp:TextBox ID="textInputApellidoMEdit" runat="server" class="form-control textInputApellidoMEdit"></asp:TextBox>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" id="checkBoxEstatusEdit" class="custom-control-input" />
                                    <label class="custom-control-label" for="checkBoxEstatusEdit">Estatus</label>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <h2>Grupos</h2>
                                <br>
                                <div class="input-group mb-3 text-dark">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="dropDownGrupos">Opciones</label>
                                    </div>
                                    <select class="selectGrupo" name="grupos[]" multiple="true" id="Select1" style="width: 80%" runat="server">
                                        <option value="1">SupportCenter</option>
                                        <option value="2">Mejora</option>
                                        <option value="3">Marketing</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12 col-mg-6 col-lg-6">
                                <h2>Usuarios</h2>
                                <div class="form-group text-dark">
                                    <label for="textInputUsuarioEdit">Usuario</label>
                                    <asp:TextBox ID="textInputUsuarioEdit" runat="server" class="form-control textInputUsuarioEdit"></asp:TextBox>
                                </div>
                                <div class="form-group text-dark">
                                    <label for="textInputContraEdit">Contraseña</label>
                                    <asp:TextBox ID="textInputContraEdit" type="password" runat="server" class="form-control textInputContraEdit"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <h2>Roles</h2>
                                <br>
                                <div class="input-group mb-3 text-dark">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="dropDownRoles">Opciones</label>
                                    </div>
                                    <select class="selectRol" name="roles[]" multiple="true" id="Select2" style="width: 80%" runat="server">
                                        <option value="1">Administrador</option>
                                        <option value="2">Redactor</option>
                                        <option value="3">Autorizador</option>
                                        <option value="4">Lector</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-right">
                                <asp:LinkButton id="btnModificar" runat="server" class="btn btn-success" OnClick="btnGuardar_Click"><i class="fas fa-pencil-alt"></i>&nbsp;Editar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div id="table" class="row">
                <div class="col-12">
                    <table id="tablePersonal" class="table table-striped table-bordered dt-responsive nowrap text-dark table-light"></table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            showTable();
            $('#contentCreate').hide();
            $('#contentEdit').hide();
            $('#btnAtrás').hide();
            $('.selectGrupo').select2({
                placeholder: "Elige..."
            });
            $('.selectRol').select2({
                placeholder: "Elige..."
            });

            dataTableData();
        });

        function showContent(typeContent, data) {
            if (typeContent == 1) {
                showTable();
            } else if (typeContent == 2) {
                createForm();
            } else if (typeContent == 3) {
                editForm();
            }
        }

        function showTable() {
            $('#contentCreate').hide();
            $('#contentEdit').hide();
            $('#btnAtrás').hide();
            $('#btnAgregar').show();
            $('#btnEditar').show();
            $('#table').show();
        }

        function createForm() {
            $('#table').hide();
            $('#contentCreate').show();
            $('#contentEdit').hide();
            $('#btnAtrás').show();
            $('#btnAgregar').hide();
        }

        function editForm() {
            $('.textInputNombreEdit').val(dataRow[1]);
            $('.textInputApellidoPEdit').val(dataRow[2]);
            $('.textInputApellidoMEdit').val(dataRow[3]);
            $('.textInputUsuarioEdit').val(dataRow[4]);
            $('.textInputContraEdit').val(dataRow[5]);
            if (dataRow[6] == true) {
                $('#checkBoxEstatusEdit').prop("checked", true);
            } else {
                $('#checkBoxEstatusEdit').prop("checked", false);
            }
            $('#table').hide();
            $('#contentEdit').show();
            $('#contentCreate').hide();
            $('#btnAtrás').show();
            $('#btnEditar').hide();
            $("btnAgregar").show();
        }
    
        var dataRow;
        function dataTableData() {
            var datos = null;
            $.ajax({
				type: 'POST',
				url: 'Personal.aspx/personal',
				dataType: "json",
				contentType: "application/json; charset=utf-8",
                success: function (response) {
					datos = response.d;
                    var json = $.parseJSON(datos);
					dataTable = $('#tablePersonal').DataTable({
						data: json,
						lengthChange: false,
						columns: [
							{ title: "Id", visible: false },
                            { title: "Nombre" },
                            { title: "Apellido Paterno" },
                            { title: "Apellido Materno" },
                            { title: "Usuario" },
                            { title: "Contraseña", visible: false },
                            { title: "Estatus", visible: false },
                            { title: "Fecha" },
                            {
                                title: "Acción",
                                data: null,
                                sortable: false,
                                render: function (data, type, row) {
                                    dataRow = row;
                                    //console.log("data: " + data);
                                    //console.log("type: " + type);
                                    //console.log("row: " + row);
                                    return '<center><a id="btnEditar" class="btn btn-success" href="javascript:void(0)" onclick="showContent(3);" role="button"><i class="fas fa-pencil-alt"></i>&nbsp;Editar</a></center>';
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
    </script>
</asp:Content>
