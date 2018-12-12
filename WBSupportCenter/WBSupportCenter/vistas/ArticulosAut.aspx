<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="ArticulosAut.aspx.cs" Inherits="WBSupportCenter.vistas.ArticulosAut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="box_table_container">
            <div class="row">
                <span class="box_table_title">Artículos pendientes por autorizar</span>
            </div>
            <div class="row">
                <div class="col-lg-12 box_table_buttons">       
                </div>
            </div>
            <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%">
            <thead>
                <tr>
                    <th>#Código</th>
                    <th>Nombre</th>
                    <th>Fecha</th>
                    <th>Estatus</th>
                    <th>Detalle</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>Vacaciones</td>
                    <td>05/11/2018</td>
                    <td>Nuevo</td>
                    <td class="text-center"><button type="button" class="btn btn-info"><i class="fa fa-eye" aria-hidden="true"></i> Visualizar</button></td>
                </tr>
                <tr>
                    <td>002</td>
                    <td>Vacaciones</td>
                    <td>03/11/2018</td>
                    <td>Editado</td>
                    <td class="text-center"><button type="button" class="btn btn-info"><i class="fa fa-eye" aria-hidden="true"></i> Visualizar</button></td>
                </tr>
                <tr>
                    <td>010</td>
                    <td>Promociones</td>
                    <td>10/11/2018</td>
                    <td>Editado</td>
                    <td class="text-center"><button type="button" class="btn btn-info"><i class="fa fa-eye" aria-hidden="true"></i> Visualizar</button></td>
                </tr>
            </tbody>
            <tfoot>
            </tfoot>
        </table>
     </div>
    </div>

</asp:Content>
