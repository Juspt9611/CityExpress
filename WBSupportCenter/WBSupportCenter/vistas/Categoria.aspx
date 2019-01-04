<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="WBSupportCenter.vistas.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

		<style>
			table.dataTable thead th, table.dataTable thead td {
				border-bottom: 1px solid #ddd !important;
			}

			.select2-container-multi .select2-choices {
				min-height: 38px !important;
			}
			body {
				color: #000000 !important;
			}
		</style>
		<div class="container" id="contenidoTabla">
		<br>
		<div class="row">
			<div class="col-sm-12 col-md-3 col-lg-3 col-xlg-3">
				<h3 class="pull-left">Categorias</h3>
			</div>
			<div class="col-sm-12 col-md-9 col-lg-9 col-xlg-9">
				<button type="button" id="editar" class="btn btn-warning pull-right" style="margin-right: 10px">Editar</button>
				<button type="button" id="eliminar" class="btn btn-danger pull-right" style="margin-right: 10px">Eliminar</button>
				<button type="button" id="nuevo" class="btn btn-primary pull-right" style="margin-right: 10px">Nuevo</button>
			</div>
		</div>	
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
				<table id="tablaCategorias" class="table table-striped table-bordered nowrap display dataTable" width="100%">
					
					<thead>
						<tr>
							<th>Nombre</th> 
							<th>Categoria</th>
							<th>estatus</th> 
							<th>idCategorias</th>
							<th>idHijo</th> 
							<th>idPadre</th>
						</tr>
					</thead>
				</table>
			</div>

		</div>  
		<br>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	</div>



		<div class="container" id="contenidoCard" hidden>
		<br>
		<div class="row">
			<div class="col-sm-0 col-md-1 col-lg-1 col-xlg-1"></div>

			<div class="col-sm-12 col-md-5 col-lg-5 col-xlg-5">
				<div class="card" style="border-radius: 45px;">
				  <img class="card-img-top" style="border-radius: 45px;" src="../recursos/img/cardObscura.jpg" alt="Card image">
				  <div class="card-img-overlay" style="opacity: 0.9;">
					<h1 class="card-title" style="color: #fff; text-align: center;">Categoria</h1>
					 
					<center><button class="btn btn-primary" id="verCat" style="margin-top: 40px">Crear categorias</button></center>

				  </div>
				</div>
			</div>

			<div class="col-sm-12 col-md-5 col-lg-5 col-xlg-5">
				<div class="card" style="border-radius: 45px;">
				  <img class="card-img-top" style="border-radius: 45px;" src="../recursos/img/cardObscura.jpg" alt="Card image">
				  <div class="card-img-overlay" style="opacity: 0.9;">
					<h1 class="card-title" style="color: #fff; text-align: center;">Relación</h1>
					<center><button class="btn btn-primary" id="verSub" style="margin-top: 40px">Crear subcategorias</button></center>
				</div>
			</div>

			<div class="col-sm-0 col-md-1 col-lg-1 col-xlg-1"></div>

		</div>	

		</div>
		<br> 
			<div class="row">
				<div class="col-sm-0 col-md-1 col-lg-1 col-xlg-1"></div>

				<div class="col-sm-12 col-md-11 col-lg-11 col-xlg-11">
					<button type="button" id="regresarCard" class="btn btn-warning pull-left" style="color: #fff;">Regresar</button>
				</div>

			</div>

			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	</div>	



	<div class="container" id="contenidoCategoria" hidden>
		<br>
		<h3>Crear categoria</h3>
		<form id="formCategoria">    
			<div class="row">
				<div class="col-sm-12 col-md-6 col-lg-6 col-xlg-6 div" >
					<label for="nombreCat">Nombre: </label>
					<input type="text" class="form-control" id="nombreCat" name="nombreCat"  placeholder="Ingresar nombre de categoria">
				</div>	
				<div class="col-sm-12 col-md-6 col-lg-6 col-xlg-6 div">
					<label for="descripcionCat">Descripción: </label>
					 <input type="text" class="form-control" id="descripcionCategoria" name="descripcionCat" placeholder="Ingresar la descripción de la categoria">
					 <input type="text" class="form-control" id="idCategoria" name="idCategoria" placeholder="Ingresar la descripción de la categoria" hidden>

				</div>	
			</div>
			<br>
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
					<button type="button" id="regresarCat" class="btn btn-warning pull-left" style="color: #fff;">Regresar</button>
					<button type="button" id="guardarCat" class="btn btn-primary pull-right" >Guardar</button>
					<button type="button" id="regresarCatEdit" class="btn btn-warning pull-left" style="color: #fff;" hidden>Regresar</button>
					<button type="button" id="guardarCatEdit" class="btn btn-primary pull-right" hidden>Guardar</button>

				</div>
			</div>
		</form>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	</div>	

	<div class="container" id="contenidoSubcategoria" hidden>
		<br>
		<h3>Relación</h3>
		<form id="formSubcategoria">    
			<div class="row">
				<div class="col-sm-12 col-md-4 col-lg-4 col-xlg-4">
					<label for="nombreCat">Padre: </label>
					<select class="form-control" id="selectCat"></select>
				</div>	
				<div class="col-sm-12 col-md-4 col-lg-4 col-xlg-4">
					<label for="descripcionCat">Hijos: </label>
					<select multiple class="select2" id="descripcionCat" style="width: 100%;"></select>
				</div>	


				<div class="col-sm-12 col-md-4 col-lg-4 col-xlg-4">
					<label for="tablaList">Relación: </label>
					<table id="tablaList" class="table table-striped table-bordered " width="100%">
					
					<thead class="thead-dark">
						<tr>
							<th id="tituloTabla">Categoria</th>
						</tr>
					</thead>
					<tbody id="cuerpoList">
					
						
					</tbody>
				</table>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
					<button type="button" id="regresarSub" class="btn btn-warning pull-left" style="color: #fff;">Regresar</button>
					<button type="button" id="guardarSub" class="btn btn-primary pull-right" >Guardar</button>
				</div>
			</div>
		</form>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	</div>	


	<br>
	<script>
		$(document).ready(function () {

			var datos = new Array();
			var dataTable;
			var idCategoria;
			var list = new Array();
			var selected = [];
			console.log("ready");
			init();

			function init() {
				dataTableData();
				$('#descripcionCat').select2();
				$("#descripcionCat").prop("disabled", true);


				$("#descripcionCat").live('change', function () {
					selected = [];
					$("#cuerpoList").empty();
					$('#descripcionCat :selected').each(function () {
						$("#cuerpoList").append("<tr><td>"+$(this).text()+"</td></tr>");
						selected.push($(this).val());
						list.push($(this).val());
					});
					list = list.unique();
				});


				$("#guardarSub").click(function () {
					$.ajax({
						async: false,
						type: 'POST',
						url: 'Categoria.aspx/guardarRelacion',
						dataType: "json",
						contentType: "application/json; charset=utf-8",
						data: "{'nombreCategoria':'" + list + "', 'idCategoria':'" + idCategoria + "'}",
						success: function (response) {
							if (response = "Success") {
								swal("Operación exitosa", {
									icon: "success",
									allowOutsideClick: false,
									closeOnClickOutside: false
								});
								$("#cuerpoList").empty();
								$("#cuerpoList").append("<tr><td>No hay datos</td></tr>");
								$('#descripcionCat').select2('val', null);
								$("#contenidoSubcategoria").hide();
								$("#contenidoTabla").fadeIn(2000);
								dataTable.destroy();
								dataTableData();
							}
						},
						failure: function (response) {
							console.log(response);
						}
					});
				});

				$("#selectCat").change(function () {
					var arregloSelect2 = new Array();
					var nombreCategoria = $("#selectCat option:selected").text();
					$("#descripcionCat").prop("disabled", false);
					$("#tituloTabla").empty();
					$("#tituloTabla").append(nombreCategoria);
					idCategoria = $("#selectCat option:selected").val();
					getSinPadres(idCategoria);
					$.ajax({
						type: 'POST',
						url: 'Categoria.aspx/getSize',
						dataType: "json",
						contentType: "application/json; charset=utf-8",
						data: "{'idCategoria':'" + idCategoria + "'}",
						success: function (data) {
							var dataFull = data.d;
							var jsonAux = $.parseJSON(dataFull);
							if (jsonAux != null) {
								$("#cuerpoList").empty();
								for (var i = 0; i < jsonAux.length; i++) {
									arregloSelect2.push(jsonAux[i].idCategorias);
									$("#cuerpoList").append("<tr><td>" + jsonAux[i].nombreCategoria + "</td></tr>");
								}
								$('#descripcionCat').select2('val', arregloSelect2);
							} else {
								$("#cuerpoList").empty();
								$("#cuerpoList").append("<tr><td>No hay datos</td></tr>");
								$('#descripcionCat').select2('val', null);
			
							}
						},
						failure: function (response) {
							console.log(response);
						}
					});
				});

				$("#nuevo").click(function () {
					$("#contenidoTabla").hide();
					$("#contenidoCard").removeAttr('hidden').fadeIn(2000);
				});

				$("#verCat").click(function () {
					$("#nombreCat").val("");
					$("#descripcionCategoria").val("");
					$("#guardarCat").removeAttr('hidden').fadeIn(2000);
					$("#guardarCatEdit").hide();

					$("#regresarCat").removeAttr('hidden').fadeIn(2000);
					$("#regresarCatEdit").hide();


					$("#contenidoCard").hide();
					$("#contenidoCategoria").removeAttr('hidden').fadeIn(2000);
					bootsVal();
				});

				$("#verSub").click(function () {
					getSinHijos();
					
					$("#contenidoCard").hide();
					$("#contenidoSubcategoria").removeAttr('hidden').fadeIn(2000);
					bootsVal();
				});

				$("#regresarCatEdit").click(function () {
					$("#contenidoCategoria").hide();
					$("#contenidoTabla").removeAttr('hidden').fadeIn(2000);
					$('#formCategoria').bootstrapValidator('destroy');
					$("#nombreCat").val("");
					$("#descripcionCategoria").val("");
				});

				
				$("#regresarCat").click(function () {
					$("#contenidoCategoria").hide();
					$("#contenidoCard").removeAttr('hidden').fadeIn(2000);
					$('#formCategoria').bootstrapValidator('destroy');
					$("#nombreCat").val("");
					$("#descripcionCategoria").val("");
				});

				$("#regresarSub").click(function () {
					$("#contenidoSubcategoria").hide();
					$("#contenidoCard").removeAttr('hidden').fadeIn(2000);
					$('#formCategoria').bootstrapValidator('destroy');
					$("#cuerpoList").empty();
					$("#cuerpoList").append("<tr><td>No hay datos</td></tr>");
					$('#descripcionCat').select2('val', null);
				});

				$("#regresarCard").click(function () {
					$("#contenidoCard").hide();
					$("#contenidoTabla").removeAttr('hidden').fadeIn(2000);
				});
				

				$("#guardarCat").click(function () {
					bootsVal();
					$('#formCategoria').data('bootstrapValidator').validate();
					var n = $('#formCategoria').data('bootstrapValidator').isValid();
					if (n) {
						guardarCategoria();
					} else {
						bootsVal();
					}
				});

				$("#guardarCatEdit").click(function () {
					bootsValEdit();
					$('#formCategoria').data('bootstrapValidator').validate();
					var n = $('#formCategoria').data('bootstrapValidator').isValid();
					if (n) {
						guardarCategoriaEdit();
					} else {
						bootsValEdit();
					}
				});



				$("#eliminar").click(function (e) {

					var row = $('#tablaCategorias').DataTable().row('.selected').data();

					if (row) {
						e.preventDefault(), swal({
							title: "¿Esta seguro que desea eliminar la categoria: " + row.nombreCategoria + "?",
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
									text: "Aceptar",
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
								eliminarCategoria(row.idCategorias);
							} else {
								$(".swal-button swal-button--confirm btn btn-info").attr("disabled", false);
							}
						});

					}
					else {
						swal("Debes seleccionar un elemento de la tabla", {
							icon: "error",
							allowOutsideClick: false,
							closeOnClickOutside: false
						});
					}


				})



			}

			Array.prototype.unique = function (a) {
				return function () { return this.filter(a) }
			}(function (a, b, c) {
				return c.indexOf(a, b + 1) < 0
			});


			function guardarCategoria() {
				$.ajax({
					async: false,
					type: 'POST',
					url: 'Categoria.aspx/guardarCategorias',
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					data: "{'nombreCategoria':'" + $("#nombreCat").val() + "', 'descripcion':'" + $("#descripcionCategoria").val() + "'}",
					success: function (response) {
						if (response = "Success") {

							swal("Operación exitosa", {
								icon: "success",
								allowOutsideClick: false,
								closeOnClickOutside: false
							});

							$("#contenidoCategoria").hide();
							$("#contenidoTabla").fadeIn(2000);
							dataTable.destroy();
							dataTableData();

						}
					},
					failure: function (response) {
						console.log(response);
					}
				});
			}

			function guardarCategoriaEdit() {
				$.ajax({
					async: false,
					type: 'POST',
					url: 'Categoria.aspx/guardarCategoriasEdit',
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					data: "{'nombreCategoria':'" + $("#nombreCat").val() + "', 'descripcion':'" + $("#descripcionCategoria").val() + "', 'idCategoria':'" + $("#idCategoria").val() + "'}",
					success: function (response) {
						if (response = "Success") {
							swal("Operación exitosa", {
								icon: "success",
								allowOutsideClick: false,
								closeOnClickOutside: false
							});
							$("#contenidoCategoria").hide();
							$("#contenidoTabla").fadeIn(2000);
							dataTable.destroy();
							dataTableData();

						}
					},
					failure: function (response) {
						console.log(response);
					}
				});
			}


			function dataTableData() {
				$.ajax({
					async: false,
					type: 'POST',
					url: 'Categoria.aspx/consultarCategorias',
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (response) {
						datos = response.d;
						var json = $.parseJSON(datos);
						initDataTable(json);
					},
					failure: function (response) {
						console.log(response);
					}
				});
			}

			function dataTableData() {
				$.ajax({
					async: false,
					type: 'POST',
					url: 'Categoria.aspx/consultarCategorias',
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (response) {
						datos = response.d;
						var json = $.parseJSON(datos);
						initDataTable(json);
					},
					failure: function (response) {
						console.log(response);
					}
				});
			}
		

			function eliminarCategoria(idCategoria) {
				$.ajax({
					async: false,
					type: 'POST',
					url: 'Categoria.aspx/eliminarCategorias',
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					data: "{'idCategoria':'" + idCategoria + "'}",
					success: function (response) {
						if (response = "Success") {
							swal("Operación exitosa", {
								icon: "success",
								allowOutsideClick: false,
								closeOnClickOutside: false
							});
							dataTable.destroy();
							dataTableData();
						}
					},
					failure: function (response) {
						console.log(response);
					}
				});
			}

			function initDataTable(json) {
				dataTable = $('#tablaCategorias').DataTable({
					"dom": '<"toolbar">frtip',
					"data": json,
					orderCellsTop: true,
					fixedHeader: true,
					pageLength: 10,
					"columns": [
						{ "data": "nombreCategoria" },
						{ "data": "descripcionCategoria"},
						{ "data": "estatus", visible: false },
						{ "data": "idCategorias", visible: false },
						{ "data": "idHijo", visible: false },
						{ "data": "idPadre", visible: false }
					]
				});

			}

			$('#tablaCategorias tbody').on('click', 'tr', function () {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#tablaCategorias').DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});

			// Evento creado para abrir la ventana de editar al dar doble click sobre un registro
			$('#tablaCategorias tbody').on('dblclick', 'tr', function () {
				$(this).addClass('selected');
				edit();
			});

		});

		$("#editar").click(function (e) {
			var row = $('#tablaCategorias').DataTable().row('.selected').data();

			if (row) {
				bootsVal();

				$("#guardarCat").hide();
				$("#guardarCatEdit").removeAttr('hidden').fadeIn(2000);

				$("#regresarCat").hide();
				$("#regresarCatEdit").removeAttr('hidden').fadeIn(2000);

				$("#contenidoTabla").hide();
				$("#contenidoCategoria").removeAttr('hidden').fadeIn(2000);
				$("#nombreCat").val(row.nombreCategoria);
				$("#descripcionCategoria").val(row.descripcionCategoria);
				$("#idCategoria").val(row.idCategorias);

			}
			else {
				swal("Debes seleccionar un elemento de la tabla", {
					icon: "error",
					allowOutsideClick: false,
					closeOnClickOutside: false
				});
			}

			
		});

		function edit() {
			var row = $('#tablaCategorias').DataTable().row('.selected').data();
			if (row) {
				bootsVal();
				$("#guardarCat").hide();
				$("#guardarCatEdit").removeAttr('hidden').fadeIn(2000);

				$("#regresarCat").hide();
				$("#regresarCatEdit").removeAttr('hidden').fadeIn(2000);
				
				$("#contenidoTabla").hide();
				$("#contenidoCategoria").removeAttr('hidden').fadeIn(2000);
				$("#nombreCat").val(row.nombreCategoria);
				$("#descripcionCategoria").val(row.descripcionCategoria);
				$("#idCategoria").val(row.idCategorias);
				
			}
			else {
				swal("Debes seleccionar un elemento de la tabla", {
					icon: "error",
					allowOutsideClick: false,
					closeOnClickOutside: false
				});
			}

		}

		function bootsValEdit() {
			$('#formCategoria').bootstrapValidator({
				submitButtons: 'button[id="guardarCatEdit"]',
				fields: {
					nombreCat: {
						selector: '#nombreCat',
						group: '.div',
						validators: {
							notEmpty: {
								message: 'Nombre obligatorio'
							},
						}
					},
					descripcionCat: {
						selector: '#descripcionCategoria',
						group: '.div',
						validators: {
							notEmpty: {
								message: 'Descripción obligatoria'
							},
						}
					}
				},
			});
		}

		
		function bootsVal() {
			$('#formCategoria').bootstrapValidator({
				submitButtons: 'button[id="guardarCat"]',
				fields: {
					nombreCat: {
						selector: '#nombreCat',
						group: '.div',
						validators: {
							notEmpty: {
								message: 'Nombre obligatorio'
							},
						}
					},
					descripcionCat: {
						selector: '#descripcionCategoria',
						group: '.div',
						validators: {
							notEmpty: {
								message: 'Descripción obligatoria'
							},
						}
					}
				},
			});
		}

		function getSinHijos() {

			$.ajax({
				async: false,
				type: 'POST',
				url: 'Categoria.aspx/getSinHijos',
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (response) {
					datos = response.d;
					var json = $.parseJSON(datos);
					if (json.length > 0) {
						$('#selectCat').empty();
						$('#selectCat').append($('<option>', {
							value: "",
							text: "Seleccione una opcion"
						}));
						$.each(json, function (i, json) {
							$('#selectCat').append($('<option>', {
								value: json.idCategorias,
								text: json.nombreCategoria
							}));
						});
					} else {
						$('#selectCat').append($('<option>', {
							value: 0,
							text: "No categorias"
						}));
					}
				},
				failure: function (response) {
					console.log(response);
				}
			});

		
		}


		function getSinPadres(idCategoria) {

			$.ajax({
				async: false,
				type: 'POST',
				url: 'Categoria.aspx/getSinPadres',
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				data: "{'idPadre':'" + idCategoria + "'}",
				success: function (response) {
					datos = response.d;
					var json = $.parseJSON(datos);
					if (json.length > 0) {
						$('#descripcionCat').empty();
						$.each(json, function (i, json) {
							$('#descripcionCat').append($('<option>', {
								value: json.idCategorias,
								title: json.nombreCategoria,
								text: json.nombreCategoria
							}));
						});
					}
				},
				failure: function (response) {
					console.log(response);
				}
			});



		}


	</script>
</asp:Content>
