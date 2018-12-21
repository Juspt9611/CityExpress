<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="ArticulosRed.aspx.cs" Inherits="WBSupportCenter.vistas.ArticulosRed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../recursos/js/blog/jquery-3.2.1.min.js"></script>
    <script src="../recursos/js/datatables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="box_table_container">
            <div class="row">
                <span class="box_table_title">Artículos en autorización</span>
            </div>
            <div class="row">
                <div class="col-lg-12 box_table_buttons">
                    <button type="button" class="btn btn-success float-right" onclick="window.location.href = 'CrearArticulo.aspx'"><i class="fa fa-plus" aria-hidden="true"></i> Crear</button>        
                </div>
            </div>
            <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%">
<%--                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Fecha</th>
                        <th>Estatus</th>
                        <th>Detalles</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#001</td>
                        <td>01/11/2018</td>
                        <td>Rechazado</td>
                        <td>Comentarios</td>
                        <td class="text-center"><button type="button" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i> Editar</button></td>
                    </tr>
                    <tr>
                        <td>#005</td>
                        <td>01/11/2018</td>
                        <td>Rechazado</td>
                        <td>Comentarios</td>
                        <td class="text-center"><button type="button" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i> Editar</button></td>
                    </tr>
                    <tr>
                        <td>#012</td>
                        <td>01/11/2018</td>
                        <td>Aprobado</td>
                        <td>Comentarios</td>
                        <td class="text-center"><button type="button" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i> Editar</button></td>
                    </tr>
                </tbody>
                <tfoot>
                </tfoot>--%>
            </table>
     </div>
    </div>

    <script>

        function articulosxValidar() {
            var data = '';
            $.ajax({
                type: "POST",
                url: "ArticulosRed.aspx/articulosxValidar",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    data = response;
                },
                failure: function (response) {
                    console.log(response);
                }
            });
            return data;
        }

        $('#example').DataTable({
            data: articulosxValidar(),
            columns: [
                { title: "Código" },
                { title: "Fecha Creación" },
                { title: "Título" },
                { title: "Estatus" },
                { title: "Comentarios" }
            ],
            "lengthChange": false
        });
    </script>

</asp:Content>
