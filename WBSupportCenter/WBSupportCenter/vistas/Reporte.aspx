<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="WBSupportCenter.vistas.Reporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />--%>


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
            color: #333;
            background-color: #f5f5f5;
            border-color: #ddd;
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
        }

        .panel-heading {
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }

        .panel-body {
            padding: 15px;
        }

        .table {
            padding: 15px;
        }

        #chartdiv {
            width: 100%;
            height: 500px;
        }

        /*estilos param los botones de exportar*/
        /*:after, :before {
            box-sizing: border-box;
        }

        a {
            color: #337ab7;
            text-decoration: none;
        }

        i {
            margin-bottom: 4px;
        }*/

        .btn {
            display: inline-block;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-app {
            color: white;
            box-shadow: none;
            border-radius: 3px;
            position: relative;
            padding: 10px 15px;
            margin: 0;
            min-width: 60px;
            max-width: 80px;
            text-align: center;
            border: 1px solid #ddd;
            background-color: #f4f4f4;
            font-size: 12px;
            transition: all .2s;
            background-color: steelblue !important;
        }

            .btn-app > .fa, .btn-app > .glyphicon, .btn-app > .ion {
                font-size: 20px;
                display: block;
            }

            .btn-app:hover {
                border-color: #aaa;
                transform: scale(1.1);
            }

        .pdf {
            color: white !important;
            background: #dc2f2f !important;
        }

        .excel {
            color: white !important;
            background: #3ca23c !important;
        }


        /*Esto es opcional pero sirve para que todos los botones de exportacion se distribuyan de manera equitativa usando flexbox*/

        /*.flexcontent {
            display: flex;
            justify-content: space-around;
        }*/

        /*Estilos param las estrellas*/

        .stars-outer {
            display: inline-block;
            position: relative;
            font-family: FontAwesome;
        }

            .stars-outer::before {
                content: "\f006 \f006 \f006 \f006 \f006";
            }

        .stars-inner {
            position: absolute;
            top: 0;
            left: 0;
            white-space: nowrap;
            overflow: hidden;
            /*width: 50%;*/
        }

            .stars-inner::before {
                content: "\f005 \f005 \f005 \f005 \f005";
                color: #f8ce0b;
            }

        .pull-left {
            float: left !important;
        }

        .pull-right {
            float: right !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" id="contenidoTabla">
        <div class="box_table_container">
            <div class="row">
                <span class="box_table_title">Reportes</span>
            </div>
            <div class="panel-body" style="border-color: #000 !important;">
                <div class="row">
                    <div class="col-3">
                        <select class="form-control" id="tipoReporte">
                            <option value="palabras">Palabras más buscadas</option>
                            <option value="valorados">Artículos más valorados</option>
                            <option value="vistos">Artículos más vistos</option>
                            <option value="vistas">Categorías más vistas</option>
                            <option value="accesos">Accesos al sitio</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <div class="input-group input-daterange">
                            <div class="input-group-addon">De: &nbsp;</div>
                            <input type="text" class="form-control" id="fechaInicial" placeholder="Fecha de inicio" runat="server">
                            <div class="input-group-addon">a: &nbsp;</div>
                            <input type="text" class="form-control" id="fechaFinal" placeholder="Fecha final" runat="server">
                        </div>
                    </div>
                    <div class="col-2">
                        <input type="number" class="form-control" min="1" id="numberTop" placeholder="Top resultados">
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-success" id="buttonBuscar"><i class="fa fa-search" aria-hidden="true"></i>&nbsp Buscar</button>
                    </div>
                    <br />
                    <br />
                    <br />
                    <%--<span class="box_table_title"></span>--%>
                </div>
            </div>
            <table id="tableArticulos" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%"></table>
            <br />
            <br />
            <br />
            <div id="chartdiv"></div>
        </div>
    </div>

    <script type="text/javascript">
        'use strict'

        var arrayGrafic = new Array();
        var reporteSelect = "palabras";
        var reporteGrafica = "No. de búsquedas";
        var reporteGraficaX = "Palabra";
        var repetirBusqueda = false;
        var successResp;
        var topResult;

        var date = new Date();

        var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
        var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);

        function padLeft(n) {
            return ("00" + n).slice(-2);
        }

        function formatDateActual() {
            var d = new Date,
                dformatActual = [padLeft(d.getDate()),
                padLeft(d.getMonth() + 1),
                d.getFullYear()
                ].join('/');
            return dformatActual
        }

        function formatDateI() {
            var d = new Date,
                dformat = [padLeft(primerDia.getDate()),
                padLeft(d.getMonth() + 1),
                d.getFullYear()
                ].join('/');
            return dformat
        }

        function formatDateF() {
            var d = new Date,
                dformat = [padLeft(ultimoDia.getDate()),
                padLeft(d.getMonth() + 1),
                d.getFullYear()
                ].join('/');
            return dformat
        }

        $(document).ready(function () {
            $('#ContentPlaceHolder1_fechaInicial').val(formatDateI());
            $('#ContentPlaceHolder1_fechaFinal').val(formatDateF());
            // Select your input element.
            var number = document.getElementById('numberTop');

            // Listen for input event on numInput.
            number.onkeydown = function (e) {
                if (!((e.keyCode > 95 && e.keyCode < 106)
                    || (e.keyCode > 47 && e.keyCode < 58)
                    || e.keyCode == 8)) {
                    return false;
                }
            }

            $('#chartdiv').hide();

            $('.input-daterange input').datepicker({
                format: "dd/mm/yyyy",
                autoclose: true,
                language: 'es'
            });

            var getDate = function (input) {
                return new Date(input.date.valueOf());
            }

            $('#ContentPlaceHolder1_fechaFinal').datepicker({
                startDate: '+6d',
                endDate: '+36d',
            });

            $('#ContentPlaceHolder1_fechaInicial').datepicker({
                startDate: '+5d',
                endDate: '+35d',
            }).on('changeDate',
                function (selected) {
                    $('#ContentPlaceHolder1_fechaFinal').datepicker('clearDates');
                    $('#ContentPlaceHolder1_fechaFinal').datepicker('setStartDate', getDate(selected));
                });

            var select = document.getElementById('tipoReporte');
            select.addEventListener('change',
                function () {
                    var selectedOption = this.options[select.selectedIndex];
                    reporteSelect = selectedOption.value;

                    if (reporteSelect == "palabras") {
                        reporteGrafica = "Número de búsqueda";
                        reporteGraficaX = "Palabra";
                    }
                    else if (reporteSelect == "valorados") {
                        reporteGrafica = "Número de valoraciones";
                        reporteGraficaX = "Número artículo";
                    }
                    else if (reporteSelect == "vistos") {
                        reporteGrafica = "Visitas";
                        reporteGraficaX = "Número artículo";
                    }
                    else if (reporteSelect == "vistas") {
                        reporteGrafica = "Número de vistas";
                        reporteGraficaX = "Categoría";
                    }
                    else if (reporteSelect == "accesos") {
                        reporteGrafica = "Número de Accesos";
                        reporteGraficaX = "Usuario";
                    }
                    //console.log(selectedOption.value);

                    if (repetirBusqueda == true) {

                        if (arrayGrafic.length != 0) {
                            $('#ContentPlaceHolder1_fechaInicial').val(formatDateI());
                            $('#ContentPlaceHolder1_fechaFinal').val(formatDateF());
                            $('#numberTop').val("");
                            $('#tableArticulos').DataTable().destroy();
                            $('#tableArticulos').empty();
                            arrayGrafic = [];
                            $('#chartdiv').hide();
                        }
                    }
                });

            $('#buttonBuscar').click(function () {
                if (repetirBusqueda == true) {
                    if (arrayGrafic.length != 0) {
                        $('#tableArticulos').DataTable().destroy();
                        $('#tableArticulos').empty();
                        arrayGrafic = [];
                        $('#chartdiv').hide();
                    }
                }
                topResult = $('#numberTop').val();
                if ($('#numberTop').val() == null) {
                    topResult = 0;
                }

                dataTableData();
                if (successResp != null) {
                    showChart();
                }
            });

        });

        function dataTableData() {

            if ($('#numberTop').val() == "") {
                topResult = 0;
            }

            $.ajax({
                async: false,
                type: 'POST',
                url: 'Reporte.aspx/ObtenerDatos',
                //data: "{'fechaInicial': '" + moment($('#ContentPlaceHolder1_fechaInicial').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "', 'fechaFinal': '" + moment($('#ContentPlaceHolder1_fechaFinal').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "' }",
                data: "{'fechaInicial': '" + moment($('#ContentPlaceHolder1_fechaInicial').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "', 'fechaFinal': '" + moment($('#ContentPlaceHolder1_fechaFinal').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "', 'valReporte': '" + reporteSelect + "' , 'valTop': '" + topResult + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    successResp = jsonReporte;
                    var nameReport;
                    if (reporteSelect == "palabras") {
                        nameReport = "Palabras más buscadas";
                    }
                    else if (reporteSelect == "valorados") {
                        nameReport = "Articulos más valorados";
                    }
                    else if (reporteSelect == "vistos") {
                        nameReport = "Articulos más vistos";
                    }
                    else if (reporteSelect == "vistas") {
                        nameReport = "Categorias más vistas";
                    }
                    else if (reporteSelect == "accesos") {
                        nameReport = "Accesos por usuario";
                    }
                    if (jsonReporte != null) {

                        if (reporteSelect == "palabras") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.PalabraBuscada,
                                    visits: parseInt(index.NumeroDeBusquedas, 10)
                                })
                            });
                            //console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                //dom: 'Bfrt<"col-md-6 inline"i> <"col-md-6 inline"p>',
                                language: {
                                    //"emptyTable": "No hay información",
                                    "infoEmpty": "Mostrando 0 de 0 entradas",
                                    "zeroRecords": "Sin resultados encontrados",
                                    "oPaginate": {
                                        "sPrevious": "Ant.", // This is the link to the previous page
                                        "sNext": "Sig."
                                    }
                                },
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                        {
                                            extend: 'excelHtml5',
                                            text: '<i class="fa fa-file-excel-o"></i>',
                                            titleAttr: 'Exportar Excel',
                                            className: 'btn btn-app export excel',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                            //message: "Any message for header inside the file. I am not able to put message in next row in excel file but you can use \n"
                                        },
                                        {
                                            extend: 'pdfHtml5',
                                            customize: function (doc) {
                                                doc.defaultStyle.alignment = 'center';
                                                doc.content.splice(0, 1);
                                                //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                                var now = new Date();
                                                var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                                doc.pageMargins = [20,60,20,30];
                                                doc.defaultStyle.fontSize = 7;
                                                doc.styles.tableHeader.fontSize = 7;
                                                doc['header'] = (function () {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'center',
                                                                fontSize: 14,
                                                                text: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });
                                                doc['footer'] = (function (page, pages) {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'left',
                                                                text: ['Creado: ', { text: jsDate.toString() }]
                                                            },
                                                            {
                                                                alignment: 'right',
                                                                text: ['pagina ', { text: page.toString() }, ' de ', { text: pages.toString() }]
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });

                                                var objLayout = {};
                                                objLayout['hLineWidth'] = function (i) { return .5; };
                                                objLayout['vLineWidth'] = function (i) { return .5; };
                                                objLayout['hLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['vLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['paddingLeft'] = function (i) { return 4; };
                                                objLayout['paddingRight'] = function (i) { return 4; };
                                                doc.content[0].layout = objLayout;
                                            },
                                            text: '<i class="fa fa-file-pdf-o"></i>',
                                            titleAttr: 'Exportar PDF',
                                            className: 'btn btn-app export pdf',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                            //exportOptions: {
                                            //    columns: [0, 1]
                                            //},
                                        },
                                    ]
                                },
                                columns: [
                                    { data: "PalabraBuscada", title: 'Palabra buscada' },
                                    { data: "NumeroDeBusquedas", title: 'Número de búsquedas' }
                                ]
                            });
                        }
                        else if (reporteSelect == "valorados") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.idArticulo,
                                    visits: parseInt(index.calificacionTotal, 10)
                                })
                            });
                            //console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                language: {
                                    //"emptyTable": "No hay información",
                                    "infoEmpty": "Mostrando 0 de 0 entradas",
                                    "zeroRecords": "Sin resultados encontrados",
                                    "oPaginate": {
                                        "sPrevious": "Ant.", // This is the link to the previous page
                                        "sNext": "Sig."
                                    }
                                },
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                        {
                                            extend: 'excelHtml5',
                                            text: '<i class="fa fa-file-excel-o"></i>',
                                            titleAttr: 'Exportar Excel',
                                            className: 'btn btn-app export excel',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                        },
                                        {
                                            extend: 'pdfHtml5',
                                            customize: function (doc) {
                                                doc.defaultStyle.alignment = 'center';
                                                doc.content.splice(0, 1);
                                                //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                                var now = new Date();
                                                var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                                doc.pageMargins = [20,60,20,30];
                                                doc.defaultStyle.fontSize = 7;
                                                doc.styles.tableHeader.fontSize = 7;
                                                doc['header'] = (function () {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'center',
                                                                fontSize: 14,
                                                                text: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });
                                                doc['footer'] = (function (page, pages) {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'left',
                                                                text: ['Creado: ', { text: jsDate.toString() }]
                                                            },
                                                            {
                                                                alignment: 'right',
                                                                text: ['pagina ', { text: page.toString() }, ' de ', { text: pages.toString() }]
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });

                                                var objLayout = {};
                                                objLayout['hLineWidth'] = function (i) { return .5; };
                                                objLayout['vLineWidth'] = function (i) { return .5; };
                                                objLayout['hLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['vLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['paddingLeft'] = function (i) { return 4; };
                                                objLayout['paddingRight'] = function (i) { return 4; };
                                                doc.content[0].layout = objLayout;
                                            },
                                            text: '<i class="fa fa-file-pdf-o"></i>',
                                            titleAttr: 'Exportar PDF',
                                            className: 'btn btn-app export pdf',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                            //exportOptions: {
                                            //    columns: [0, 1]
                                            //},
                                        },
                                    ]
                                },
                                columns: [
                                    { data: "idArticulo", title: 'Número del artículo' },
                                    { data: "nombreArticulo", title: 'Nombre del artículo' },
                                    { data: "nombreCategoria", title: 'Categoría' },
                                    { data: "PromedioCalificacion", title: 'Promedio de calificación' },
                                        //data: "promedioCalificacion", id: '1', title: 'Promedio de calificación', render: function (data, type, row) {
                                        //    var starPercentage = data / 5 * 100;
                                        //    var starPercentageRounded = Math.round(starPercentage / 10) * 10 + "%";
                                        //    //$('#1').html('<div class="stars-outer"><div class="stars-inner" style="width: 50%;"></div></div>');
                                        //    //return '<div class="stars-outer"><div class="stars-inner" style="width: ' + starPercentageRounded + ';"></div></div>';
                                        //    //        $('td').attr('id', '1');
                                        //    //$('#1').html('<div class="stars-outer"><div class="stars-inner" style="width: 50%;"></div></div>');
                                        //    var df = '<td id="1" >' + data + '</td>';
                                        //    return df;

                                        //}
                                    { data: "calificacionTotal", title: 'Número de valoraciones' }
                                ]
                            });
                        }
                        else if (reporteSelect == "vistos") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.idArticulo,
                                    visits: parseInt(index.visitas, 10)
                                })
                            });
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                language: {
                                    //"emptyTable": "No hay información",
                                    "infoEmpty": "Mostrando 0 de 0 entradas",
                                    "zeroRecords": "Sin resultados encontrados",
                                    "oPaginate": {
                                        "sPrevious": "Ant.", // This is the link to the previous page
                                        "sNext": "Sig."
                                    }
                                },
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                        {
                                            extend: 'excelHtml5',
                                            text: '<i class="fa fa-file-excel-o"></i>',
                                            titleAttr: 'Exportar Excel',
                                            className: 'btn btn-app export excel',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                        },
                                        {
                                            extend: 'pdfHtml5',
                                            customize: function (doc) {
                                                doc.defaultStyle.alignment = 'center';
                                                doc.content.splice(0, 1);
                                                //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                                var now = new Date();
                                                var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                                doc.pageMargins = [20,60,20,30];
                                                doc.defaultStyle.fontSize = 7;
                                                doc.styles.tableHeader.fontSize = 7;
                                                doc['header'] = (function () {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'center',
                                                                fontSize: 14,
                                                                text: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });
                                                doc['footer'] = (function (page, pages) {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'left',
                                                                text: ['Creado: ', { text: jsDate.toString() }]
                                                            },
                                                            {
                                                                alignment: 'right',
                                                                text: ['pagina ', { text: page.toString() }, ' de ', { text: pages.toString() }]
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });

                                                var objLayout = {};
                                                objLayout['hLineWidth'] = function (i) { return .5; };
                                                objLayout['vLineWidth'] = function (i) { return .5; };
                                                objLayout['hLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['vLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['paddingLeft'] = function (i) { return 4; };
                                                objLayout['paddingRight'] = function (i) { return 4; };
                                                doc.content[0].layout = objLayout;
                                            },
                                            text: '<i class="fa fa-file-pdf-o"></i>',
                                            titleAttr: 'Exportar PDF',
                                            className: 'btn btn-app export pdf',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                            //exportOptions: {
                                            //    columns: [0, 1]
                                            //},
                                        },
                                    ]
                                },
                                columns: [
                                    { data: "idArticulo", title: 'Número del artículo' },
                                    { data: "nombreArticulo", title: 'Nombre del artículo' },
                                    { data: "categoria", title: 'Categoría' },
                                    { data: "visitas", title: 'Visitas' },
                                ]
                            });
                        }
                        else if (reporteSelect == "vistas") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.nombreCategoria,
                                    visits: parseInt(index.CategoriaMasVista, 10)
                                })
                            });
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                language: {
                                    //"emptyTable": "No hay información",
                                    "infoEmpty": "Mostrando 0 de 0 entradas",
                                    "zeroRecords": "Sin resultados encontrados",
                                    "oPaginate": {
                                        "sPrevious": "Ant.", // This is the link to the previous page
                                        "sNext": "Sig."
                                    }
                                },
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                        {
                                            extend: 'excelHtml5',
                                            text: '<i class="fa fa-file-excel-o"></i>',
                                            titleAttr: 'Exportar Excel',
                                            className: 'btn btn-app export excel',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                        },
                                        {
                                            extend: 'pdfHtml5',
                                            customize: function (doc) {
                                                doc.defaultStyle.alignment = 'center';
                                                doc.content.splice(0, 1);
                                                //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                                var now = new Date();
                                                var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                                doc.pageMargins = [20,60,20,30];
                                                doc.defaultStyle.fontSize = 7;
                                                doc.styles.tableHeader.fontSize = 7;
                                                doc['header'] = (function () {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'center',
                                                                fontSize: 14,
                                                                text: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });
                                                doc['footer'] = (function (page, pages) {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'left',
                                                                text: ['Creado: ', { text: jsDate.toString() }]
                                                            },
                                                            {
                                                                alignment: 'right',
                                                                text: ['pagina ', { text: page.toString() }, ' de ', { text: pages.toString() }]
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });

                                                var objLayout = {};
                                                objLayout['hLineWidth'] = function (i) { return .5; };
                                                objLayout['vLineWidth'] = function (i) { return .5; };
                                                objLayout['hLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['vLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['paddingLeft'] = function (i) { return 4; };
                                                objLayout['paddingRight'] = function (i) { return 4; };
                                                doc.content[0].layout = objLayout;
                                            },
                                            text: '<i class="fa fa-file-pdf-o"></i>',
                                            titleAttr: 'Exportar PDF',
                                            className: 'btn btn-app export pdf',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                            //exportOptions: {
                                            //    columns: [0, 1]
                                            //},
                                        },
                                    ]
                                },
                                columns: [
                                    { data: "nombreCategoria", title: 'Categoría' },
                                    { data: "CategoriaMasVista", title: 'Número de vistas' }
                                ]
                            });
                        }
                        else if (reporteSelect == "accesos") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.nombreUsuario,
                                    visits: parseInt(index.Accesos, 10)
                                })
                            });
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                paging: true,
                                dom: '<"pull-left"B><"pull-right">tip',
                                //dom: '<"top"Bf>rt<"bottom"ip><"clear">',
                                language: {
                                    //"emptyTable": "No hay información",
                                    "infoEmpty": "Mostrando 0 de 0 entradas",
                                    "zeroRecords": "Sin resultados encontrados",
                                    "oPaginate": {
                                        "sPrevious": "Ant.", // This is the link to the previous page
                                        "sNext": "Sig."
                                    }
                                },
                                buttons: {
                                    dom: {
                                        container: {
                                            tag: 'div',
                                            className: 'flexcontent'
                                        },
                                        buttonLiner: {
                                            tag: null
                                        }
                                    },
                                    buttons: [
                                        {
                                            extend: 'excelHtml5',
                                            text: '<i class="fa fa-file-excel-o"></i>',
                                            titleAttr: 'Exportar Excel',
                                            className: 'btn btn-app export excel',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                        },
                                        {
                                            extend: 'pdfHtml5',
                                            customize: function (doc) {
                                                doc.defaultStyle.alignment = 'center';
                                                doc.content.splice(0, 1);
                                                //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                                var now = new Date();
                                                var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                                doc.pageMargins = [20, 60, 20, 30];
                                                doc.defaultStyle.fontSize = 7;
                                                doc.styles.tableHeader.fontSize = 7;
                                                doc['header'] = (function () {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'center',
                                                                fontSize: 14,
                                                                text: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });
                                                doc['footer'] = (function (page, pages) {
                                                    return {
                                                        columns: [
                                                            {
                                                                alignment: 'left',
                                                                text: ['Creado: ', { text: jsDate.toString() }]
                                                            },
                                                            {
                                                                alignment: 'right',
                                                                text: ['pagina ', { text: page.toString() }, ' de ', { text: pages.toString() }]
                                                            }
                                                        ],
                                                        margin: 20
                                                    }
                                                });

                                                var objLayout = {};
                                                objLayout['hLineWidth'] = function (i) { return .5; };
                                                objLayout['vLineWidth'] = function (i) { return .5; };
                                                objLayout['hLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['vLineColor'] = function (i) { return '#aaa'; };
                                                objLayout['paddingLeft'] = function (i) { return 4; };
                                                objLayout['paddingRight'] = function (i) { return 4; };
                                                doc.content[0].layout = objLayout;
                                            },
                                            text: '<i class="fa fa-file-pdf-o"></i>',
                                            titleAttr: 'Exportar PDF',
                                            className: 'btn btn-app export pdf',
                                            title: "Support Center | Reporte: " + nameReport + " | Consulta del: " + $('#ContentPlaceHolder1_fechaInicial').val() + " al " + $('#ContentPlaceHolder1_fechaFinal').val() + " | Fecha de ejecución: " + formatDateActual() + "",
                                            //exportOptions: {
                                            //    columns: [0, 1]
                                            //},
                                        },
                                    ]
                                },
                                columns: [
                                    { data: "nombreUsuario", title: 'Nombre de Usuario' },
                                    { data: "Accesos", title: 'Número de Accesos' }
                                ]
                            });
                        }

                        repetirBusqueda = true;
                        jsonReporte = [];

                    } else {
                        swal("No se encontraron datos para esta búsqueda.", {
                            icon: "info",
                            button: "Aceptar",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                        $(".swal-button").click(function () {
                            //closeSite();
                        });
                        repetirBusqueda = false;
                    }

                },
                failure: function (response) {
                    //console.log(response);
                },
                error: function (response) {
                    //console.log(response);
                }
            });
        }

        function showChart() {

            $('#chartdiv').show();

            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // Create chart instance
            var chart = am4core.create("chartdiv", am4charts.XYChart);

            // Add data
            chart.data = arrayGrafic;

            // Create axes
            let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
            categoryAxis.dataFields.category = "country";
            categoryAxis.renderer.labels.template.rotation = 270;
            categoryAxis.renderer.labels.template.hideOversized = false;
            categoryAxis.renderer.minGridDistance = 20;
            categoryAxis.renderer.labels.template.horizontalCenter = "right";
            categoryAxis.renderer.labels.template.verticalCenter = "middle";
            categoryAxis.tooltip.label.rotation = 270;
            categoryAxis.tooltip.label.horizontalCenter = "right";
            categoryAxis.tooltip.label.verticalCenter = "middle";

            let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            valueAxis.title.text = reporteGrafica;
            valueAxis.title.fontWeight = "bold";

            let valueAxisX = chart.xAxes.push(new am4charts.ValueAxis());
            valueAxisX.title.text = reporteGraficaX;
            valueAxisX.title.fontWeight = "bold";

            // Create series
            var series = chart.series.push(new am4charts.ColumnSeries3D());
            series.dataFields.valueY = "visits";
            series.dataFields.categoryX = "country";
            series.name = "Visits";
            series.tooltipText = "{categoryX}: [bold]{valueY}[/]";
            series.columns.template.fillOpacity = .8;

            var columnTemplate = series.columns.template;
            columnTemplate.strokeWidth = 2;
            columnTemplate.strokeOpacity = 1;
            columnTemplate.stroke = am4core.color("#FFFFFF");

            columnTemplate.adapter.add("fill", (fill, target) => {
                return chart.colors.getIndex(target.dataItem.index);
            })

            columnTemplate.adapter.add("stroke", (stroke, target) => {
                return chart.colors.getIndex(target.dataItem.index);
            })

            chart.cursor = new am4charts.XYCursor();
            chart.cursor.lineX.strokeOpacity = 0;
            chart.cursor.lineY.strokeOpacity = 0;

        }

    </script>

</asp:Content>
