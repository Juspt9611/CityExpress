<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="AprobacionArticulos.aspx.cs" Inherits="WBSupportCenter.vistas.articulosVistos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="container" id="contenidoTabla">
		<br>
		<div class="row">
			<div class="col-sm-12 col-md-3 col-lg-3 col-xlg-3">
				<h5>Filtros</h5>
			</div>
		</div>	 
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
				<table id="tablaAprobacionArticulos" class="table table-striped table-bordered nowrap display dataTable" width="100%">
					<thead>
						<tr>
							<th>#Codigo</th>
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
		<br>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	</div>
	
	<br>
	<div class="container" id="contenidoArticulo" hidden>

		<div class="card text-center">
			<div class="card-header">
				<h5 id="titleCard"></h5>
			</div>
			<div class="card-body">
				<p id="cuerpoCard"></p>
			</div>
			<div class="card-footer text-muted">
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12">
						<button class="btn btn-warning pull-left" style="color: #FFFFFF; border-right: 5px;" id="atras">Regresar</button>

						<button class="btn btn-success pull-right" style="color: #FFFFFF;" id="aceptar">Aceptar</button>
						<button type="button" class="btn btn-danger pull-right" style="color: #FFFFFF; margin-right: 10px;" id="rechazar">Rechazar</button>
				</div>
				</div>
				
			</div>
		</div>
		<br>

	</div>
	

	<div id="dialog-message" title="Comentario de rechazo" hidden>
        <p>
            Se debe agregar un comentario del por que el articulo fue rechazado.
            <br/>
        </p>
		
		<form id="formComentario">
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12 col-xlg-12 form-control">
					<textarea id="comentario" name="comentario" style="resize: none;"  class="form-control"></textarea>
				</div>
			</div>

		</form>
	
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
			bootsVal();
		});

		function init() {

			
			dataTableData();

			$('#tablaAprobacionArticulos thead tr').clone(true).appendTo('#tablaAprobacionArticulos thead');
			$('#tablaAprobacionArticulos thead tr:eq(1) th').each(function (i) {
				var title = $(this).text();
				if (i != 10) {
					$(this).html('<input type="text" class="form-control search" id="' + i + '" style="height: 25px;" placeholder="Buscar ' + title.toLowerCase() + '" />');

				} else {
					$(this).html('<input type="text" disabled class="form-control search" id="' + i + '" style="height: 25px;" placeholder="Buscar ' + title.toLowerCase() + '" />');

				}

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
					title: "¿Esta seguro que desea aceptar este articulo?",
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
						estatus = 1;
						saveEstatusArticulo(idArticulo,estatus);
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
				bootsVal();
				$("#guardarComentario").prop("disabled", false);
				$("#dialog-message").removeAttr('hidden');
					$("#dialog-message").dialog({
						modal: true,
						draggable: false,
						resizable: false,
						position: ['center', 'center'],
						show: 'blind',
						hide: 'blind',
						width: 400,
						open: function (event, ui) {
							$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
							$("#comentario").val("");
							$('#dialog-message').css('overflow', 'hidden');
							$("#guardarComentario").css({
								"background": "#28a745",
								"color": "#fff"
							});

							$("#cancelarComentario").css({
								"background": "#dc3545",
								"color": "#fff"
							});
							

						},
						buttons: [{
							id: "cancelarComentario",
							text: "Cancelar",
							click: function () {
								$('#formComentario').bootstrapValidator('destroy');
								$(this).dialog("close");
							}
						}, {
							id: "guardarComentario",
							text: "Guardar",
							click: function () {
								bootsVal();
								$("#guardarComentario").prop("disabled", true);
								$('#formComentario').data('bootstrapValidator').validate();
								var n = $('#formComentario').data('bootstrapValidator').isValid();
								if (n) {
								$(this).dialog("close");
								estatus = 2;
								comentario = $("#comentario").val();
								
								saveEstatusArticulo(idArticulo, estatus, comentario);
								} else {
									bootsVal();
								}
							}
						}]
					});
				
			});
		}


		function bootsVal() {
			console.log("entra");
			$('#formComentario').bootstrapValidator({
				submitButtons: 'button[id="guardarComentario"]',
				fields: {
					comentario: {
						selector: '#comentario',
						group: '.form-control',
						validators: {
							notEmpty: {
								message: 'Comentario obligatorio'
							},
						}
					}
				},
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
					console.log(json);
					dataTable = $('#tablaAprobacionArticulos').DataTable({
						data: json,
						orderCellsTop: true,
						fixedHeader: true,
						"lengthMenu": [[15, 30, 50, 100], [15, 30, 50, 100]],
						columns: [
							{ title: "#Codigo" },
							{ title: "Nombre" },
							{ title: "Contenido", "visible": false},
							{ title: "EstatusArticulo", "visible": false },
							{ title: "Version", "visible": false },
							{ title: "Fecha" },
							{ title: "idUsuario", "visible": false },
							{ title: "Autorizador", "visible": false },
							{ title: "Validador", "visible": false },
							{	"title": "Estatus",
								"mData": null,
								"bSortable": false,
								"mRender": function (data, type, full) {
									if (data[3] == 1) {
										return '<span class="label label-success">Aprobado</span>';
									} else if (data[3] == 2) {
										return '<span class="label label-danger">Rechazado</span>';
									} else {
										return '<span class="label label-primary">Pendiente</span>';
									}								}
							},
							{	"title": "Detalle",
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

		function addDataCard(data_row) {
			idArticulo = null;
			idArticulo = data_row[0];
			$("#titleCard").empty();
			$("#cuerpoCard").empty();

			$("#titleCard").append("Nombre: " + data_row[1]);
			$("#cuerpoCard").append(data_row[2]);
		}
				
		function saveEstatusArticulo(idArticulo,estatus,comentario) {

			$.ajax({
				async: false,
				type: "POST",
				url: 'AprobacionArticulos.aspx/guardarEstatusArticuloAprobar',
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				data: "{'idArticulo': '"+idArticulo+"', 'estatus': '"+estatus+"','comentario': '"+comentario+"' }",
				success: function (response) {
					console.log(response);
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
