<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="WBSupportCenter.vistas.Historial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="box_table_container" id="historialArticulo">
            <div class="row">
                <span class="box_table_title">Historial de Artículo</span>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title" id="titleArticulo"></h3>
                            <div id="historial"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="detalleArticulo"></div>
    <script>
        $(document).ready(function () {
            showHistorial(8);
        });

        function showHistorial(id) {
            var html = '';
            $('#historial').html('');
            $('#detalleArticulo').hide();

            $.ajax({
                async: false,
                type: "POST",
                url: "Historial.aspx/historialxIdArticulo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArt':'" + id + "'}",
                success: function (response) {
                    console.log(response);
                    var valNew = response.d.split('$$');
                    var val = [];

                    for (var i = 0; valNew.length; i++) {
                        if (valNew[i] != "" && valNew[i] <= valNew[i] + 1) {
                            val[i] = valNew[i].split('||');
                            mostrarTitulo(val[i][1]);
                        } else {
                            break;
                        }
                        window.responseGlobal = valNew[i];
                        
                        html += '<li><label class="text-primary font-weight-bold">Fecha de Creación: </label>';
                        var fechaCreacion = moment(val[i][4], 'DD-MM-YYYY').format('DD-MM-YYYY');
                        html += '<label class="font-italic">' + fechaCreacion + '&nbsp;&nbsp;</label>';
                        html += '<label class="text-primary font-weight-bold">Fecha de Modificación: </label>';
                        var fechaModificacion = moment(val[i][5], 'DD-MM-YYYY').format('DD-MM-YYYY');
                        html += '<label class="font-italic">' + fechaModificacion + '&nbsp;&nbsp;</label>';
                        html += '<label class="text-primary font-weight-bold">Autor: </label>';
                        html += '<label class="font-italic">' + val[i][6] + '&nbsp;&nbsp;</label>';
                        html += '<label class="text-primary font-weight-bold">Versión: </label>';
                        html += '<label class="font-italic">' + val[i][2] + '&nbsp;&nbsp;</label>';
                        html += '<a id="btnVer" class="btn btn-link font-weight-bold" href="javascript:void(0)" onclick="showArticuloHistorial(responseGlobal);" role="button">Ver Artículo</a></li><br>';
                        
                        $('#historial').html(html);
                    }
                },
                error: function (response) {
                    swal("Hubo un error con esta búsqueda", {
                        icon: "error",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                }
            });
            
        }

        function showArticuloHistorial(objeto) {
            console.log(objeto);
            var valNew = objeto.split('||');
            var html = '';
            $('#detalleArticulo').html('');

            html += '<div class="box_table_container">';
            html += '   <a id="btnAtras" class="btn btn-warning pull-right" href="javascript:void(0)" onclick="returnHistorial();" role="button">Atrás</a>';
            html += '   <div class="row">';
            html += '       <span class="box_table_title">' + valNew[1] + '</span>';
            html += '   </div>';
            html += '   <br>';
            html += '   <div class="container">' + valNew[3] + '</div>';
            html += '</div>';

            $('#historialArticulo').hide();
            $('#detalleArticulo').show();
            $('#detalleArticulo').html(html);
        }

        function mostrarTitulo(titulo) {
            $('#titleArticulo').html('');
            $('#titleArticulo').html(titulo);
        }

        function returnHistorial() {
            $('#historialArticulo').show();
            $('#detalleArticulo').hide();
        }
    </script>
</asp:Content>
