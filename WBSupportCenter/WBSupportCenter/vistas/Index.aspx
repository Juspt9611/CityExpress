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
                    <div id="idPostMasVistos" class="news_posts">
                    </div>
                    <!-- Page Nav -->
                    <%--<div class="page_nav">
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
                    </div>--%>
                    <div id="box-blog" class="box_table_container">
                        <div class="row">
                            <span id="box-titulo-blog" class="box_table_title" style="margin-bottom:1rem; font-weight:700; text-align:center !important; font-size:2rem;"></span>
                        </div>
                        <div class="row">
                            <div id="box-contenido-blog">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 box_table_buttons">
                                <div class="news_post_meta">
                                    <ul class="d-flex flex-row align-items-start justify-content-start">
                                        <li><i class="fa fa-user"></i><a id="box-Botones-blog-autor" href="#"></a></li>
                                        <li><i class="fa fa-star"></i><a id="box-Botones-blog-estrella" href="#"></a></li>
                                        <li><i class="fa fa-comment"></i><a id="box-Botones-blog-comentario" href="#"></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6" style="text-align:center !important;">
                                <div id="box-blog-star-rating">
                                    <span id="star5" class="fa fa-star star float-right" onclick="estrellas(5)"></span>
                                    <span id="star4" class="fa fa-star star float-right" onclick="estrellas(4)"></span>
                                    <span id="star3" class="fa fa-star star float-right" onclick="estrellas(3)"></span>
                                    <span id="star2" class="fa fa-star star float-right" onclick="estrellas(2)"></span>
                                    <span id="star1" class="fa fa-star star float-right" onclick="estrellas(1)"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="box-comentarios-blog" class="col-lg-12 box_table_buttons">
                                <div class="mb-3">
                                    <label for="box-blog-txtComentario">Comparte tu opinión: </label>
                                    <textarea class="form-control" id="box-blog-txtComentario" placeholder="Ingresa un comentario" required></textarea>
                                    <div class="invalid-feedback">
                                        Ingresar un comentario.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="box-Botones-blog" class="col-lg-12 box_table_buttons">
                                <button id="submit" type="button" class="btn btn-success float-right" onclick="registrarValoracionxArt()"><i class="fa fa-comment" aria-hidden="true"></i> Comentar</button>        
                                <button type="button" class="btn btn-danger float-right" onclick="window.location.href = 'Index.aspx'"><i class="fa fa-arrow-left" aria-hidden="true"></i> Regresar</button>
                            </div>
                        </div>
                        <div class="row">
                            <div id="box-blog-lista-comentarios">
                            <span class="box-blog-lista-comentarios-titulo">Comentarios</span>
                                <div id="box-blog-listas-comentarios">

                                </div>
                            </div>
                        </div>
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
            $('#box-blog').hide();
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
                loadArticulo($(this).val());
                $('#txtsearch').val('');
                $('#result').empty();
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
            //evento boton  /////////////////////////////////////AQUI INSERTA PALABRA
            $("#btnBuscar").click(function () {
                var palabra = $('#txtsearch').val();
                if (palabra != "") {
                    $("#idPostMasVistos").empty();
                    $(".easyPaginateNav").remove();
                    if ($("#box-blog").is(":visible")) {
                        $("#box-blog").hide();
                        $("#idPostMasVistos").show();
                    }
                    $.ajax({
                        type: "POST",
                        url: "Index.aspx/articulosxClick",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'palabra':'" + palabra + "'}",
                        success: function (response) {
                            var posts = $.parseJSON(response.d);
                            $.each(posts, function (i, d) {
                                $("#idPostMasVistos").append('<div class="news_post magic_fade_in">' +
                                                                '<div class="news_post_content">' +
                                                                    '<div class="news_post_title"><a href="javascript:loadArticulo(' + d[0] + ')">' + d[1] + '</a></div>' +
                                                                    '<div class="news_post_text">' +
                                                                       d[2] +
                                                                    '</div>' +
                                                                    '<div class="news_post_meta">' +
                                                                        '<ul class="d-flex flex-row align-items-start justify-content-start">' +
                                                                            '<li><i class="fa fa-user"></i><a href="#"> ' + d[3] + '</a></li>' +
                                                                            '<li><i class="fa fa-star"></i><a href="#"> ' + d[6] + '</a></li>' +
                                                                            '<li><i class="fa fa-comment"></i><a href="#"> ' + d[5] + ' Comentarios</a></li>' +
                                                                        '</ul></div></div></div>');
                            });

                            //artMasVistos = posts;
                            $('#txtsearch').val('');
                            $("#result").empty('');
                            $('#idPostMasVistos').easyPaginate({
                                paginateElement: '.news_post',
                                elementsPerPage: 5,
                                effect: 'climb'
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

        var artMasVistos = [];

        //Carga de Artículos
        function initArtMasVistos() {
            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/buscarArtMasVistos",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'top':" + 5 + "}",
                success: function (response) {
                    var posts = $.parseJSON(response.d);
                    $.each(posts, function (i, d) {
                        $("#idPostMasVistos").append('<div class="news_post magic_fade_in">' +
                                                        '<div class="news_post_content">'+
                                                            '<div class="news_post_title"><a href="javascript:loadArticulo(' + d[0] + ')">' + d[1] + '</a></div>' +
                                                            '<div class="news_post_text">'+
                                                               d[2].substring(d[2].indexOf('<p>'), d[2].indexOf('</p>') + 4) +
                                                            '</div>'+
                                                            '<div class="news_post_meta">'+
                                                                '<ul class="d-flex flex-row align-items-start justify-content-start">'+
                                                                    '<li><i class="fa fa-user"></i><a href="#"> '+d[3]+'</a></li>'+
                                                                    '<li><i class="fa fa-star"></i><a href="#"> '+d[6]+'</a></li>'+
                                                                    '<li><i class="fa fa-comment"></i><a href="#"> '+d[5]+' Comentarios</a></li>'+
                                                                '</ul></div></div></div>');
                    });

                    artMasVistos = posts;
                }
            });
        }
        initArtMasVistos();

        //Metodo para cargar un artículo por ID
        var idArticuloActual;
        function loadArticulo(idArt) {
            idArticuloActual = 0;
            $("#idPostMasVistos").hide();
            $(".easyPaginateNav").remove();
            $("#box-blog").show();
            $("#box-titulo-blog, #box-contenido-blog, #box-Botones-blog-autor, #box-Botones-blog-estrella, #box-Botones-blog-comentario,#box-Botones-blog-comentario").empty();
            $.ajax({
                type: "POST",
                url: "Index.aspx/articuloxId",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArt':" + idArt + "}",
                success: function (response) {
                    var posts = $.parseJSON(response.d);
                    $.each(posts, function (i, d) {
                        $("#box-titulo-blog").append(d[1]);
                        $("#box-contenido-blog").append(d[2]);
                        $("#box-Botones-blog-autor").append(" " + d[3]);
                        $("#box-Botones-blog-estrella").append(" " + d[5]);
                        $("#box-Botones-blog-comentario").append(" " + d[4] + " Comentarios");
                    });
                    registrarVisita(1, idArt);
                    consultarComentarios(idArt);
                    idArticuloActual = idArt;
                },
                error: function (response) {
                    swal("Hubo un error al cargar el artículo.", {
                        icon: "error",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                }
            });
       
        }

        function registrarVisita(idUsuario, idArticulo) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/registrarVisita",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idUsuario':" + idUsuario + ", 'idArticulo':" + idArticulo + " }",
                success: function (response) {
                    if (response.d < 0) {

                    }
                }
            });
        }

        var estrellaArticulo = 6;
        function estrellas(num) {
            var estrellaArray = ["star1", "star2", "star3", "star4", "star5"];
            $.each(estrellaArray, function (i, d) {
                if(i<num){
                    $("#" + d).addClass("starSelected");
                } else {
                    $("#" + d).removeClass("starSelected");
                }
            });
            //estrellaArticulo = num;
        }

        function consultarComentarios(idArticulo) {
            $("#box-blog-listas-comentarios").empty();
            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/consultarComentariosxArt",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArticulo':" + idArticulo + "}",
                success: function (response) {
                    var posts = $.parseJSON(response.d);
                    var countComent = 0;
                    $.each(posts, function (i, d) {
                        $("#box-blog-listas-comentarios").append(' <div class="box-blog-coment-contenedor">'+
                                                                        '<div class="box-blog-coment-titulo">'+
                                                                            '<span class="box-blog-coment-titulo-autor">'+d[2]+'</span><span class="box-blog-coment-titulo-fecha">'+d[1]+'</span>'+
                                                                        '</div>'+
                                                                        '<div class="box-blog-coment-contenido">'+
                                                                            d[0] +
                                                                        '</div></div>');
                        countComent++;
                    });
                    if (countComent == 0) {
                        $("#box-blog-listas-comentarios").append('<div class="box-blog-coment-contenedor"> No hay comentarios para este artículo.</div>');
                    }
                }
            });
        }

        function registrarValoracionArticulo(estrellas, idArticulo, comentario, idUsuario, tipo) {
            var txt = '';
            if (tipo) {
                txt = 'Comentario registrado.';
            } else {
                txt = 'Valoración registrada';
            }

            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/registrarValoracionArticulo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'estrellas':" + estrellas + ", 'idArticulo':" + idArticulo + ", 'comentario':'" + comentario + "', 'idUsuario':" + idUsuario + "}",
                success: function (response) {
                    if (response.d == 0) {
                        swal(txt, {
                            icon: "success",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                    } else {
                        swal("Hubo un error con el registro.", {
                            icon: "error",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                    }
                },
                error: function (response) {
                    swal("Hubo un error con el registro.", {
                        icon: "error",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                }
            });
        }

        function registrarValoracionxArt() {

            var comentario = $("#box-blog-txtComentario").val();
            var calificacionEstrella = estrellaArticulo;
            var type = 0;

            //console.log(idArticuloActual);
            //console.log(comentario);
            //console.log(calificacionEstrella);

            if (comentario.length > 3) {
                type = 1;
            }

            registrarValoracionArticulo(calificacionEstrella, idArticuloActual, comentario, 1, type);
        }

    </script>
</asp:Content>
