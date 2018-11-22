<%@ Page Title="" Language="C#" MasterPageFile="~/general.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="WBSupportCenter.vistas.Personal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="widget-grid" class="">
	<!-- row -->
    <div class="row">
		<!-- NEW WIDGET ROW START -->
		<div class="col-sm-12">
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-0" data-widget-colorbutton="false"	data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-sortable="false">
				<header>
					<h2>Articulo</h2>
				</header>

				<!-- widget div-->

				<div>
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						<input class="form-control" type="text">
					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body">
						<fieldset>
							<legend>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Agregar</button>
                                    <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                                    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
                                </div>
							</legend>
							<div class="form-group">
                                
                                
                                								
                                <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
											<thead>			                
												<tr>
													<th data-hide="phone">ID</th>
													<th data-class="expand"><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Nombre</th>
													<th data-hide="phone,tablet"><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> Categoria</th>
													<th data-hide="phone,tablet"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha Creacion</th>
													<th data-hide="phone,tablet">Autor</th>
													<th data-hide="phone,tablet"><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Jennifer</td>
													<td>1-342-463-8341</td>
													<td>Et Rutrum Non Associates</td>
													<td>35728</td>
													<td>Fogo</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Clark</td>
													<td>1-516-859-1120</td>
													<td>Nam Ac Inc.</td>
													<td>7162</td>
													<td>Machelen</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Brendan</td>
													<td>1-724-406-2487</td>
													<td>Enim Commodo Limited</td>
													<td>98611</td>
													<td>Norman</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Warren</td>
													<td>1-412-485-9725</td>
													<td>Odio Etiam Institute</td>
													<td>10312</td>
													<td>Sautin</td>
												</tr>
												<tr>
													<td>5</td>
													<td>Rajah</td>
													<td>1-849-642-8777</td>
													<td>Neque Ltd</td>
													<td>29131</td>
													<td>Glovertown</td>
												</tr>
											</tbody>
										</table>								
							</div>
						</fieldset>
					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->
		</div>
		<!-- WIDGET ROW END -->
	</div>
	<!-- end row -->
</section>
</asp:Content>
