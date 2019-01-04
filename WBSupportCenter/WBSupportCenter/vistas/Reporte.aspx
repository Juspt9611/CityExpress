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
            height: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="panel panel-default col-12" id="contenido">
        <div class="panel-heading">Articulos mas vistos</div>
        <div class="panel-body" style="border-color: #000 !important;">
            Seleccionar Fecha:
            <div class="row">
                <div class="col-4">
                    <select class="form-control" id="tipoReporte">
                        <option value="palabras">Palabras Mas Buscadas</option>
                        <option value="valorados">Articulos Mas Valorados</option>
                        <option value="vistos">Articulos Mas Vistos</option>
                        <option value="vistas">Categorias Mas Vistas</option>
                    </select>
                </div>
                <div class="col-4">
                    <div class="input-group input-daterange">
                        <div class="input-group-addon">De: &nbsp;</div>
                        <input type="text" class="form-control" id="fechaInicial" placeholder="Fecha de Inicio" runat="server">
                        <div class="input-group-addon">a: &nbsp;</div>
                        <input type="text" class="form-control" id="fechaFinal" placeholder="Fecha Final" runat="server">
                    </div>
                </div>
                <div class="col-4">
                    <button type="button" class="btn btn-success" id="buttonBuscar">Buscar</button>
                </div>
            </div>
        </div>
        <table id="tableArticulos" class="table table-striped table-bordered dt-responsive nowrap text-dark table-light"></table>

        <div id="chartdiv"></div>

    </div>

    <script type="text/javascript">
        'use strict'

        var arrayGrafic = new Array();
        var reporteSelect = "palabras";
        var repetirBusqueda = false;
        var successResp;

        var date = new Date();

        var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
        var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);

        function padLeft(n) {
            return ("00" + n).slice(-2);
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
            $('#chartdiv').hide();

            //$.datepicker.regional['es'] = {
            //    closeText: 'Cerrar',
            //    prevText: '< Ant',
            //    nextText: 'Sig >',
            //    currentText: 'Hoy',
            //    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            //    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            //    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            //    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
            //    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
            //    weekHeader: 'Sm',
            //    dateFormat: 'dd/mm/yy',
            //    firstDay: 1,
            //    isRTL: false,
            //    showMonthAfterYear: false,
            //    yearSuffix: ''
            //};
            //$.datepicker.setDefaults($.datepicker.regional['es']);


            //$('.datepicker').datepicker({
            //    duration: '',
            //    changeMonth: false,
            //    changeYear: false,
            //    yearRange: '2010:2020',
            //    showTime: false,
            //    time24h: true
            //});

            //$.datepicker.regional['cs'] = {
            //    closeText: 'Zavřít',
            //    prevText: '&#x3c;Dříve',
            //    nextText: 'Později&#x3e;',
            //    currentText: 'Nyní',
            //    monthNames: ['leden', 'únor', 'březen', 'duben', 'květen', 'červen', 'červenec', 'srpen',
            //        'září', 'říjen', 'listopad', 'prosinec'
            //    ],
            //    monthNamesShort: ['led', 'úno', 'bře', 'dub', 'kvě', 'čer', 'čvc', 'srp', 'zář', 'říj', 'lis', 'pro'],
            //    dayNames: ['neděle', 'pondělí', 'úterý', 'středa', 'čtvrtek', 'pátek', 'sobota'],
            //    dayNamesShort: ['ne', 'po', 'út', 'st', 'čt', 'pá', 'so'],
            //    dayNamesMin: ['ne', 'po', 'út', 'st', 'čt', 'pá', 'so'],
            //    weekHeader: 'Týd',
            //    dateFormat: 'dd/mm/yy',
            //    firstDay: 1,
            //    isRTL: false,
            //    showMonthAfterYear: false,
            //    yearSuffix: ''
            //};

            //$.datepicker.setDefaults($.datepicker.regional['cs']);

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
                    console.log(selectedOption.value);
                });

            $('#buttonBuscar').click(function () {
                if (repetirBusqueda == true) {
                    $('#tableArticulos').DataTable().destroy();
                    $('#tableArticulos').empty();
                    arrayGrafic = [];
                    $('#chartdiv').hide();
                }
                dataTableData();
                if (successResp != null) {
                    showChart();
                }
                

            });

        });


        function dataTableData() {
            $.ajax({
                async: false,
                type: 'POST',
                url: 'Reporte.aspx/ObtenerDatos',
                //data: "{'fechaInicial': '" + moment($('#ContentPlaceHolder1_fechaInicial').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "', 'fechaFinal': '" + moment($('#ContentPlaceHolder1_fechaFinal').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "' }",
                data: "{'fechaInicial': '" + moment($('#ContentPlaceHolder1_fechaInicial').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "', 'fechaFinal': '" + moment($('#ContentPlaceHolder1_fechaFinal').val(), 'DD-MM-YYYY').format('YYYY-MM-DD') + "' , 'valReporte': '" + reporteSelect + "' }",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    successResp = jsonReporte;
                    console.log(jsonReporte);
                    console.log(reporteSelect);

                    if (jsonReporte != null) {

                        if (reporteSelect == "palabras") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.palabraBuscada,
                                    visits: parseInt(index.numeroDeBusquedas, 10)
                                })
                            });

                            console.log(arrayGrafic);

                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                columns: [
                                    { data: "palabraBuscada", title: 'Palabra Buscada' },
                                    { data: "numeroDeBusquedas", title: 'Numero De Busquedas' }
                                ]
                            });
                        }
                        else if (reporteSelect == "valorados") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.nombreArticulo,
                                    visits: parseInt(index.calificacionTotal, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                columns: [
                                    { data: "idArticulo", title: 'Id del Articulo', visible: false },
                                    { data: "nombreArticulo", title: 'Nombre del Articulo' },
                                    { data: "categoria", title: 'Categoria' },
                                    { data: "promedioCalificacion", title: 'Promedio de Calificación' },
                                    { data: "calificacionTotal", title: 'Calificación Total' }
                                ]
                            });
                        }
                        else if (reporteSelect == "vistos") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.nombreArticulo,
                                    visits: parseInt(index.visitas, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                columns: [
                                    { data: "idArticulo", title: 'Id del Articulo', visible: false },
                                    { data: "nombreArticulo", title: 'Nombre del articulo' },
                                    { data: "categoria", title: 'Categoria' },
                                    { data: "visitas", title: 'Visitas' }
                                ]
                            });
                        }
                        else if (reporteSelect == "vistas") {
                            $.each(jsonReporte, function (item, index) {
                                arrayGrafic.push({
                                    country: index.categoria,
                                    visits: parseInt(index.categoriaMasVista, 10)
                                })
                            });
                            console.log(arrayGrafic);
                            $('#tableArticulos').DataTable({
                                data: jsonReporte,
                                orderCellsTop: true,
                                fixedHeader: true,
                                destroy: true,
                                columns: [
                                    { data: "categoria", title: 'Categoria' },
                                    { data: "categoriaMasVista", title: 'Categoria Mas Vista' }
                                ]
                            });
                        }

                        repetirBusqueda = true;
                        jsonReporte = [];

                    } else {
                        swal("No se encontraron datos para esta busqueda.", {
                            icon: "success",
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
                    console.log(response);
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
            valueAxis.title.text = "Visitas";
            valueAxis.title.fontWeight = "bold";

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
