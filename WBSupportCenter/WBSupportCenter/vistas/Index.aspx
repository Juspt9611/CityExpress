<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SupportCenter.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #result {
            position: absolute;
            margin-top: 37px;
            width: 88%;
            max-width: 870px;
            cursor: pointer;
            overflow-y: auto;
            max-height: 200px;
            box-sizing: border-box;
            z-index: 1001;
            overflow: auto;
        }

        #result::-webkit-scrollbar {
            width: 12px;
            background-color: transparent;
        }

        #result::-webkit-scrollbar-thumb {
            border-radius: 10px;
            /*-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);*/
            background-color: transparent;
        }

        .link-class:hover {
            background-color: #f1f1f1;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
        <div class="news">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <br />
                </div>
                <div class="col-lg-6" style="text-align: center">

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Buscar" id="txtsearch" autocomplete="off">
                        <ul class="list-group" id="result"></ul>

                        <div class="input-group-append">
                            <button type="button"  class="btn btn-primary"id="btnBuscar"><span class="fa fa-search"></span></button>
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
                            </button>
                            <div class="dropdown-menu" id="DDLCategorias">

                                <a class="dropdown-item" href="#">Link 1</a>
                                <a class="dropdown-item" href="#">Link 2</a>
                                <a class="dropdown-item" href="#">Link 3</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3"></div>
            </div>
            <div class="row">
                <div id="sidebarArticulo" class="col-lg-2 sidebar_col">
                    <div class="sidebar listasOcultar">
                        <!-- Recent Posts -->
                        <div class="recent_posts sidebar_section magic_fade_in">
                            <div class="sidebar_title_container">
                                <div>Artículos más vistos</div>
                            </div>
                            <div class="sidebar_list" runat="server" id="lstArt">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- News Content -->
                <div id="listArticulos" class="col-lg-8">
                    <div class="news_posts">
                        <!-- News Post -->
                        <div class="news_post magic_fade_in">
                            <div class="news_post_content">
                                <div class="news_post_title"><a href="#">Título de artículo</a></div>
                                <div class="news_post_text">
                                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem, mollitia libero! Quam iste excepturi veniam unde a, sed quis possimus recusandae maxime obcaecati veritatis vero deserunt ipsa officiis, nisi blanditiis?</p>
                                </div>
                                <div class="news_post_meta">
                                    <ul class="d-flex flex-row align-items-start justify-content-start">
                                        <li><i class="fa fa-user"></i><a href="#">Autor</a></li>
                                        <li><i class="fa fa-star"></i><a href="#">5</a></li>
                                        <li><i class="fa fa-comment"></i><a href="#">3 Comentarios</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- News Post -->
                        <div class="news_post magic_fade_in">
                            <div class="news_post_content">
                                <div class="news_post_title"><a href="#">Título de artículo</a></div>
                                <div class="news_post_text">
                                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem, mollitia libero! Quam iste excepturi veniam unde a, sed quis possimus recusandae maxime obcaecati veritatis vero deserunt ipsa officiis, nisi blanditiis?</p>
                                </div>
                                <div class="news_post_meta">
                                    <ul class="d-flex flex-row align-items-start justify-content-start">
                                        <li><i class="fa fa-user"></i><a href="#">Autor</a></li>
                                        <li><i class="fa fa-star"></i><a href="#">4.5</a></li>
                                        <li><i class="fa fa-comment"></i><a href="#">10 Comentarios</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- News Post -->
                        <div class="news_post magic_fade_in">
                            <div class="news_post_content">
                                <div class="news_post_title"><a href="#">Título de artículo</a></div>
                                <div class="news_post_text">
                                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem, mollitia libero! Quam iste excepturi veniam unde a, sed quis possimus recusandae maxime obcaecati veritatis vero deserunt ipsa officiis, nisi blanditiis?</p>
                                </div>
                                <div class="news_post_meta">
                                    <ul class="d-flex flex-row align-items-start justify-content-start">
                                        <li><i class="fa fa-user"></i><a href="#">Autor</a></li>
                                        <li><i class="fa fa-star"></i><a href="#">3</a></li>
                                        <li><i class="fa fa-comment"></i><a href="#">1 Comentarios</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page Nav -->
                    <div class="page_nav">
                        <ul class="d-flex flex-row align-items-center justify-content-start">
                            <li class="active"><a href="#">01.</a></li>
                            <li><a href="#">02.</a></li>
                            <li><a href="#">03.</a></li>
                            <li><a href="#" class="d-flex flex-row align-items-center justify-content-start">
                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- News Sidebar -->
                <div id="sidebarCategoria" class="col-lg-2 sidebar_col pull-right">
                    <div class="sidebar listasOcultar">
                        <!-- Recent Comments -->
                        <div class="recent_posts sidebar_section magic_fade_in">
                            <div class="sidebar_title_container">
                                <div>Categorías más vistas</div>
                            </div>
                            <div class="sidebar_list" runat="server" id="lstCatg">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="contentArticulo" class="container contentArticulo" runat="server">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 id="titleCard"></h5>
                                </div>
			                    <div class="card-body">
                                    <div id="cuerpoCard"></div>
			                    </div>
                                <div class="card-footer text-muted"></div>
		                    </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div id="tableIndex" class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <table id="tableArticulos" class="table table-striped table-bordered dt-responsive nowrap text-dark table-light"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $.ajaxSetup({ cache: false });
            $('.contentArticulo').hide();
            $('#tablaArticulos').hide();
            $('#txtsearch').keyup(function () {
                $('#result').html('');
                $('#state').val('');
                var searchField = $('#txtsearch').val();
                var expression = new RegExp(searchField);

                //solicitud datos
                if ($('#txtsearch').val() != "") {
                    $.ajax({
                        async: false,
                        type: "POST",
                        url: "Index.aspx/articulosxValidar",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'palabra':'" + $('#txtsearch').val() + "'}",
                        success: function (response) {
                            if (response.d != "") {
                                $.each(response, function (item, index) {
                                    $.each(jQuery.parseJSON(index), function (item, index) {
                                        $('#result').append('<li class="list-group-item link-class" value="' + index.idarticulo + '"><span class="l"><a href="javascript:void(0)">' + index.nombreArticulo + '</a></span></li>');
                                    });
                                });
                            }
                        }
                    });
                }
            });
        
            //evento al seleccionar
            $('#result').on('click', 'li', function () {
                $('#txtsearch').val($(this).text());
                var palabra = $('#txtsearch').val();
                showArticle($(this).val());
                savePalabra(palabra);
                $("#result").html('');
                $('#sidebarArticulo').hide();
                $('#sidebarCategoria').hide();
                $('#listArticulos').hide();
                $('.contentArticulo').show();
                $('#tableIndex').hide();
            });

            //evento al dar enter
            $('#txtsearch').keypress(function (e) {
                if (e.keyCode == 13) {
                    var palabra = $('#txtsearch').val();

                    if (palabra != "") {
                        $('#sidebarArticulo').hide();
                        $('#sidebarCategoria').hide();
                        $('#listArticulos').hide();
                        $('#tableIndex').show();
                        $('#txtsearch').val('');
                        $("#result").html('');
                        $('.contentArticulo').hide();

                        if (bandera == true) {
                            $('#tableArticulos').DataTable().destroy();
                            showTableNews(palabra);
                            savePalabra(palabra);
                        } else {
                            showTableNews(palabra);
                            savePalabra(palabra);
                            bandera = true;
                        }
                    }
                }
            });

            var bandera = false;

            //evento boton 
            $("#btnBuscar").click(function () {
                var palabra = $('#txtsearch').val();

                if (palabra != "") {
                    $('#sidebarArticulo').hide();
                    $('#sidebarCategoria').hide();
                    $('#listArticulos').hide();
                    $('#tableIndex').show();
                    $('#txtsearch').val('');
                    $("#result").html('');
                    $('.contentArticulo').hide();

                    if (bandera == true) {
                        $('#tableArticulos').DataTable().destroy();
                        showTableNews(palabra);
                        savePalabra(palabra);
                    } else {
                        showTableNews(palabra);
                        savePalabra(palabra);
                        bandera = true;
                    }
                } else {
                    swal("Favor de ingresar un criterio de búsqueda", {
                        icon: "warning",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                }
                
            });
        });

        function showArticle(id) {
            $('#titleCard').html('');
            $('#cuerpoCard').html('');

            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/articuloxId",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArt':'" + id + "'}",
                success: function (response) {
                    var valNew = response.d.split('||');
                    $('#titleCard').html(valNew[0]);
                    $('#cuerpoCard').html(valNew[1]);
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

        function showTableNews(palabra) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/articulosxClick",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'palabra':'" + palabra + "'}",
                success: function (response) {
                    var jsonReporte = $.parseJSON(response.d);
                    $('#tableArticulos').DataTable({
                        data: jsonReporte,
                        lengthChange: false,
                        columns: [
                            { data: "idarticulo", visible: false },
                            { data: "nombreArticulo", title: 'Artículo' },
                            { data: "autor", visible: false },
                            { data: "contenido", visible: false },
                            { data: "idEstatusArticulo", visible: false },
                            { data: "version", visible: false },
                            { data: "fechaCreacion", visible: false },
                            { data: "nombreCategoria", title: "Categoría" },
                            {
                                title: "Acción",
                                data: null,
                                sortable: false,
                                render: function (data, type, row) {
                                    return '<center><a id="btnVer" class="btn btn-primary" href="javascript:void(0)" onclick="showArticleByTable(' + row.idarticulo + ');" role="button">Ver</a></center>';
                                }
                            },
                            {
                                title: "Acción",
                                data: null,
                                sortable: false,
                                render: function (data, type, row) {
                                    return '<center><a id="btnHistorial" class="btn btn-warning" href="javascript:void(0)" role="button">Historial</a></center>';
                                }
                            }
					    ]
                    });

                },
                error: function (response) {
                    swal("Hubo un error en esta búsqueda", {
                        icon: "error",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                }
            });
        }

        function showArticleByTable(id) {
            $('#titleCard').html('');
            $('#cuerpoCard').html('');
            $('#tableIndex').hide();
            $('.contentArticulo').show();

            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/articuloxId",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArt':'" + id + "'}",
                success: function (response) {
                    var valNew = response.d.split('||');
                    $('#titleCard').html(valNew[0]);
                    $('#cuerpoCard').html(valNew[1]);
                },
                error: function (response) {
                    swal("Hubo un error en esta búsqueda", {
                        icon: "error",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                }
            });
        }

        function savePalabra(palabra) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/insertaPalabra",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'palabra':'" + palabra + "'}",
                success: function (response) {
                }
            });
        }
    </script>
</asp:Content>
