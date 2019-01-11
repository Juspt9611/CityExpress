<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="ArticulosRed.aspx.cs" Inherits="WBSupportCenter.vistas.ArticulosRed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pull-left {
            float: left !important;
        }

        .pull-right {
            float: right !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="box_table_container">
            <div class="row">
                <span class="box_table_title">Artículos en autorización</span>
            </div>
            <div class="row">
                <div class="col-lg-12 box_table_buttons">
                    <%--<button type="button" class="btn btn-success float-right" onclick="window.location.href = 'CrearArticulo.aspx'"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp Crear</button>--%>
                </div>
            </div>
            <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Fecha</th>
                        <th>Título</th>
                        <th>Estatus</th>
                        <th>Comentarios</th>
                        <th>Editar</th>
                    </tr>
                </thead>
            </table>
            <br />
        </div>
    </div>

    <script>
        //var info = [[2, "2018-11-22T00:00:00", "Comidas City", "Pendiente ", "Pendiente de revisar"], [3, "2018-11-22T00:00:00", "Desayunos City", "Pendiente ", "Pendiente de revisar"], [4, "2018-06-21T15:52:56", "Ofertas City", "Pendiente ", "Pendiente de revisar"], [5, "2018-06-21T15:52:56", "Puntos City", "Pendiente ", "Pendiente de revisar"], [6, "2018-06-21T15:52:56", "Promociones City", "Pendiente ", "Pendiente de revisar"], [7, "2018-06-21T15:52:56", "PRUEBA", "Pendiente ", "Pendiente de revisar"], [8, "2018-06-21T15:52:56", "PRUEBA", "Pendiente ", "Pendiente de revisar"], [9, "2018-12-20T18:34:44.127", "Vero", "Pendiente ", "Pendiente de revisar"], [10, "2018-12-20T18:35:25.693", "juan", "Pendiente ", "Pendiente de revisar"], [11, "2018-12-20T18:46:54.873", "juan manuel", "Pendiente ", "Pendiente de revisar"], [12, "2018-12-20T18:50:58.37", "Rodrigo Peña", "Pendiente ", "Pendiente de revisar"], [13, "2018-12-20T18:53:56.58", "Rodrigo Peña", "Pendiente ", "Pendiente de revisar"], [14, "2018-12-20T19:11:13.463", "jajajaj", "Pendiente ", "Pendiente de revisar"], [15, "2018-12-20T19:13:24.047", "Lore", "Pendiente ", "Pendiente de revisar"], [16, "2018-12-20T19:16:24.68", "x", "Pendiente ", "Pendiente de revisar"], [17, "2018-12-21T10:08:20.47", "fdfd", "Aprobado", "Pendiente de revisar"], [18, "2018-12-21T10:08:21.143", "fdfd", "Aprobado", "Pendiente de revisar"], [19, "2018-12-21T10:08:21.343", "fdfd", "Aprobado", "Pendiente de revisar"], [20, "2018-12-21T10:08:21.523", "fdfd", "Aprobado", "Pendiente de revisar"], [21, "2018-12-21T10:08:21.703", "fdfd", "Aprobado", "Pendiente de revisar"], [22, "2018-12-21T10:08:21.88", "fdfd", "Aprobado", "Pendiente de revisar"], [23, "2018-12-21T10:08:22.03", "fdfd", "Aprobado", "Pendiente de revisar"], [24, "2018-12-21T10:11:53.6", "vxvxxvvx", "Aprobado", "Pendiente de revisar"], [25, "2018-12-21T10:12:14.32", "coyo", "Aprobado", "Pendiente de revisar"], [26, "2018-12-21T10:17:34.08", "JUAN", "Aprobado", "Pendiente de revisar"], [27, "2018-12-21T10:19:35.967", "kaka", "Aprobado", "Pendiente de revisar"], [28, "2018-12-21T10:19:40.03", "kaka", "Aprobado", "Pendiente de revisar"], [29, "2018-12-21T10:21:17.49", "lala", "Aprobado", "Pendiente de revisar"], [30, "2018-12-21T10:21:29.56", "lala", "Aprobado", "Pendiente de revisar"], [31, "2018-12-21T10:21:38.487", "ddsds", "Aprobado", "Pendiente de revisar"], [32, "2018-12-21T10:22:35.743", "lal", "Aprobado", "Pendiente de revisar"], [33, "2018-12-21T10:33:36.377", "kjkj", "Aprobado", "Pendiente de revisar"], [34, "2018-12-21T10:38:12.883", "koko", "Aprobado", "Pendiente de revisar"], [35, "2018-12-21T11:22:01.873", "juan", "Aprobado", "Pendiente de revisar"], [36, "2018-12-21T11:22:05.393", "juan", "Aprobado", "Pendiente de revisar"]];

        var infoDatatable = function () {
            var tmp = null;
            $.ajax({
                async: false,
                type: "POST",
                url: "ArticulosRed.aspx/articulosxValidar",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    tmp = response.d;
                },
                failure: function (response) {
                    console.log(response);
                }
            });
            return tmp;
        }();

        var table = $('#example').DataTable({
            data: $.parseJSON(infoDatatable),
            lengthChange: false,
            dom: '<"pull-left"f><"pull-right">tip',
            columnDefs: [{
                "targets": -1,
                "data": null,
                "className": "text-center",
                "defaultContent": "<button type='button' class='btn btn-warning'><i class='fa fa-pencil' aria-hidden='true'></i> Editar</button>"
            }]
        });

        $("<button type='button' class='btn btn-success float-right' style='margin-bottom:1em;' onclick=\"window.location.href = 'CrearArticulo.aspx'\" id='crear'><i class='fa fa-plus' aria-hidden='true'></i>&nbsp Crear</button>").appendTo('div.pull-right'); 

        $('#crear').on('click', 'button', function () {
            window.location.href = 'CrearArticulo.aspx';
        });

        $('#example tbody').on('click', 'button', function () {
            var data = table.row($(this).parents('tr')).data();
            window.location.href = 'EditarArticulo.aspx?idArticulo=' + data[0];
        });
    </script>

</asp:Content>
