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

        .select2-selection__rendered {
            line-height: 31px !important;
        }

        .select2-container .select2-selection--single {
            height: 35px !important;
        }

        .select2-selection__arrow {
            height: 34px !important;
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
                        <%--<input type="text" class="form-control" placeholder="Buscar" id="txtsearch" autocomplete="off">
                        <ul class="list-group" id="result"></ul>--%>

                        <select class="form-control js-data-example-ajax" id="buscadorSel" style="width: 90% !important;"></select>
                        <button type="button" class="btn btn-primary" id="btnBuscar"><span class="fa fa-search"></span></button>
                        <%--                            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown"> </button>--%>
                        <%--                            <div class="dropdown-menu" id="DDLCategorias">

                                <a class="dropdown-item" href="#">Link 1</a>
                                <a class="dropdown-item" href="#">Link 2</a>
                                <a class="dropdown-item" href="#">Link 3</a>
                            </div>--%>
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
                            <span id="box-titulo-blog" class="box_table_title" style="margin-bottom: 1rem; font-weight: 700; text-align: center !important; font-size: 2rem;"></span>
                        </div>
                        <div class="row">
                            <div id="box-contenido-blog">
                            </div>
                            <div id="box-historial-blog">
                            </div>
                            <div id="box-historial-detalleArticulo">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 box_table_buttons">
                                <div class="news_post_meta">
                                    <ul class="d-flex flex-row align-items-start justify-content-start">
                                        <li><i class="fa fa-user"></i><a id="box-Botones-blog-autor" href="javascript:void(0)"></a></li>
                                        <li><i class="fa fa-star"></i><a id="box-Botones-blog-estrella" href="javascript:void(0)"></a></li>
                                        <li><i class="fa fa-comment"></i><a id="box-Botones-blog-comentario" href="javascript:void(0)"></a></li>
                                        <li><i class="fa fa-hashtag"></i>Etiquetas: <a id="box-Botones-blog-tags" href="javascript:void(0)"></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6" style="text-align: center !important;">
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
                                <button id="submit" type="button" class="btn btn-success float-right" onclick="registrarValoracionxArt()"><i class="fa fa-comment" aria-hidden="true"></i>Comentar</button>
                                <button type="button" class="btn btn-warning float-right" s onclick="verHistorial()"><i class="fa fa-bookmark" aria-hidden="true"></i>Historial</button>
                                <button type="button" class="btn btn-danger float-right" onclick="window.location.href = 'Index.aspx'"><i class="fa fa-arrow-left" aria-hidden="true"></i>Regresar</button>
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

        //Variables
        var estrellaArticulo = 6;
        var palabraSelect = "";

        $(document).ready(function () {
            $('.js-data-example-ajax').select2({
                language: 'es',
                placeholder: { id: '-1', text: 'Buscador...' },
                allowClear: true,
                ajax: {
                    async: true,
                    type: "POST",
                    url: "Index.aspx/articulosxValidar",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    delay: 250,
                    data: function (param) {
                        palabraSelect = param.term;
                        var palabra = "{'palabra':'" + param.term + "'}";
                        return palabra
                    },
                    processResults: function (data) {
                        $(".select2-results__options").empty();
                        $('.js-data-example-ajax').change();
                        var datos = JSON.parse(data.d);
                        return {
                            results: $.map(datos, function (item) {
                                return {
                                    text: item.nombreArticulo,
                                    id: item.idarticulo
                                }
                            })
                        };
                    },
                    complete: function () {
                        $('ul li').removeClass('select2-results__option--highlighted');
                    },
                    cache: true,
                },
                escapeMarkup: function (markup) {
                    return markup;
                },
                minimumInputLength: 1,
                minimumResultsForSearch: -1,
                theme: 'adwitt'
            });

            $.ajaxSetup({ cache: false });
            $('.contentArticulo').hide();
            $('#tablaArticulos').hide();
            $('#box-blog').hide();
            $('#box-historial-blog').hide();
            $('#box-historial-detalleArticulo').hide();

            //evento al seleccionar
            $('#buscadorSel').on('select2:selecting', function (e) {
                var idArt = e.params.args.data.id;
                idArticuloActual = 0;
                $("#idPostMasVistos").hide();
                $(".easyPaginateNav").remove();
                $("#box-blog").show();
                $("#box-historial-blog").hide();
                $('#box-historial-detalleArticulo').hide();
                $("#box-contenido-blog").show();
                $("#box-titulo-blog, #box-contenido-blog, #box-Botones-blog-autor, #box-Botones-blog-estrella, #box-Botones-blog-comentario,#box-Botones-blog-comentario, #box-Botones-blog-tags").empty();
                $.ajax({
                    type: "POST",
                    url: "Index.aspx/articuloxId",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'idArt':" + idArt + "}",
                    success: function (response) {
                        var posts = $.parseJSON(response.d);
                        $.each(posts, function (i, d) {
                            $("#box-titulo-blog").append(d[1] + '<br><span class="span-blog-categorias">' + d[8].replace(/,/g, ' >> ') + '</span>');
                            $("#box-contenido-blog").append(d[2]);
                            $("#box-Botones-blog-autor").append(" " + d[3]);
                            $("#box-Botones-blog-estrella").append(" " + d[5]);
                            $("#box-Botones-blog-comentario").append(" " + d[4] + " Comentarios");
                            $("#box-Botones-blog-tags").append(" " + d[7]);
                            estrellas(d[6]);
                        });
                        estrellaArticulo = 6;
                        registrarVisita(idArt);
                        consultarComentarios(idArt);
                        idArticuloActual = idArt;
                        showHistorial(idArt);
                    },
                    error: function (response) {
                        swal("Hubo un error al cargar el artículo.", {
                            icon: "error",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                    }
                });
            });

            //al dar enter en el input
            $(document).on('keyup', '.select2-search__field', function (e) {
                var keyEnter = e.keyCode;
                console.log(keyEnter);
                if (keyEnter == 13) {
                    if (palabraSelect != "") {
                        savePalabra(palabraSelect);
                        //loadArticulo(searchField);
                        loadListaArticulosxPalabra(palabraSelect);
                        $('#buscadorSel').val(null).trigger('change');
                        $('#buscadorSel').select2("close");
                        $(".select2-selection__placeholder").text(palabraSelect);
                        $(".select2-selection__rendered").empty();
                        $(".select2-selection__rendered").text(palabraSelect);
                        palabraSelect = "";
                    } else {
                        swal("Favor de ingresar un criterio de búsqueda", {
                            icon: "warning",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                        $('#buscadorSel').val(null).trigger('change');
                        $(".select2-selection__rendered").empty();
                        $(".select2-selection__rendered").text('Buscador...');
                    }

                }
            });

            //Carga lista de articulos en base a una palabra
            function loadListaArticulosxPalabra(palabra) {
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
                        var countPosts = 0;
                        $.each(posts, function (i, d) {
                            $("#idPostMasVistos").append('<div class="news_post magic_fade_in">' +
                                '<div class="news_post_content">' +
                                '<div class="news_post_title"><a href="javascript:loadArticulo(' + d[0] + ')">' + d[1] + '</a><br><span class="span-blog-categorias">' + d[8].replace(/,/g, ' >> ') + '</span></div>' +
                                '<div class="news_post_text">' +
                                d[2] +
                                '</div>' +
                                '<div class="news_post_meta">' +
                                '<ul class="d-flex flex-row align-items-start justify-content-start">' +
                                '<li><i class="fa fa-user"></i><a href="javascript:void(0)"> ' + d[3] + '</a></li>' +
                                '<li><i class="fa fa-star"></i><a href="javascript:void(0)"> ' + d[6] + '</a></li>' +
                                '<li><i class="fa fa-comment"></i><a href="javascript:void(0)"> ' + d[5] + ' Comentarios</a></li>' +
                                '<li><i class="fa fa-hashtag"></i> Etiquetas: <a href="javascript:void(0)">' + d[7] + '</a></li>' +
                                '</ul></div></div></div>');
                            countPosts++;
                        });

                        if (countPosts == 0) {
                            $("#idPostMasVistos").append('<div class="news_post"> <div class="news_post_content"> No se encontraron artículos para el criterio de busqueda <strong>"' + palabra + '"</strong>. </div> </div>');
                            $('#buscadorSel').val(null).trigger('change');
                            $(".select2-selection__rendered").empty();
                            $(".select2-selection__rendered").text('Buscador...');
                            palabraSelect = "";
                        }

                        savePalabra(palabra);
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
            }

            var bandera = false;
            //evento boton buscar
            $("#btnBuscar").click(function () {
                //var palabra = $('.select2-search__field').val();
                if (palabraSelect != "") {
                    savePalabra(palabraSelect);
                    loadListaArticulosxPalabra(palabraSelect);
                    $('#buscadorSel').val(null).trigger('change');
                    $(".select2-selection__rendered").empty();
                    $(".select2-selection__rendered").text(palabraSelect);
                } else {
                    swal("Favor de ingresar un criterio de búsqueda", {
                        icon: "warning",
                        allowOutsideClick: false,
                        closeOnClickOutside: false
                    });
                    $('#buscadorSel').val(null).trigger('change');
                    $(".select2-selection__rendered").empty();
                    $(".select2-selection__rendered").text('Buscador...');
                }

            });
        });
        ////////////$.ajaxSetup({ cache: false });
        ////////////$('.contentArticulo').hide();
        ////////////$('#tablaArticulos').hide();
        ////////////$('#box-blog').hide();
        ////////////$('#box-historial-blog').hide();
        ////////////$('#box-historial-detalleArticulo').hide();
        ////////////$('#txtsearch').keyup(function () {
        ////////////    $('#result').html('');
        ////////////    $('#state').val('');
        ////////////    var searchField = $('#txtsearch').val();
        ////////////    var expression = new RegExp(searchField);

        ////////////    //solicitud datos
        ////////////    if ($('#txtsearch').val() != "") {
        ////////////        $.ajax({
        ////////////            async: false,
        ////////////            type: "POST",
        ////////////            url: "Index.aspx/articulosxValidar",
        ////////////            contentType: "application/json; charset=utf-8",
        ////////////            dataType: "json",
        ////////////            data: "{'palabra':'" + $('#txtsearch').val() + "'}",
        ////////////            success: function (response) {
        ////////////                if (response.d != "") {
        ////////////                    $.each(response, function (item, index) {
        ////////////                        $.each(jQuery.parseJSON(index), function (item, index) {
        ////////////                            $('#result').append('<li class="list-group-item link-class" value="' + index.idarticulo + '"><span class="l"><a href="javascript:void(0)">' + index.nombreArticulo + '</a></span></li>');
        ////////////                        });
        ////////////                    });
        ////////////                }
        ////////////            }
        ////////////        });
        ////////////    }
        ////////////});

        //////////////evento al seleccionar
        ////////////$('#result').on('click', 'li', function () {
        ////////////    $('#txtsearch').val($(this).text());
        ////////////    savePalabra($(this).text());
        ////////////    loadArticulo($(this).val());
        ////////////    $('#txtsearch').val('');
        ////////////    $('#result').empty();
        ////////////});

        //////////////evento al dar enter
        ////////////$('#txtsearch').keypress(function (e) {
        ////////////    if (e.keyCode == 13) {
        ////////////        var palabra = $('#txtsearch').val();

        ////////////        if (palabra != "") {
        ////////////            loadListaArticulosxPalabra(palabra);
        ////////////        }
        ////////////    }
        ////////////});

        //////////////Carga lista de articulos en base a una palabra
        ////////////function loadListaArticulosxPalabra(palabra) {
        ////////////    $("#idPostMasVistos").empty();
        ////////////    $(".easyPaginateNav").remove();
        ////////////    if ($("#box-blog").is(":visible")) {
        ////////////        $("#box-blog").hide();
        ////////////        $("#idPostMasVistos").show();
        ////////////    }
        ////////////    $.ajax({
        ////////////        type: "POST",
        ////////////        url: "Index.aspx/articulosxClick",
        ////////////        contentType: "application/json; charset=utf-8",
        ////////////        dataType: "json",
        ////////////        data: "{'palabra':'" + palabra + "'}",
        ////////////        success: function (response) {
        ////////////            var posts = $.parseJSON(response.d);
        ////////////            var countPosts = 0;
        ////////////            $.each(posts, function (i, d) {
        ////////////                $("#idPostMasVistos").append('<div class="news_post magic_fade_in">' +
        ////////////                                                '<div class="news_post_content">' +
        ////////////                                                    '<div class="news_post_title"><a href="javascript:loadArticulo(' + d[0] + ')">' + d[1] + '</a><br><span class="span-blog-categorias">' + d[8].replace(/,/g, ' >> ') + '</span></div>' +
        ////////////                                                    '<div class="news_post_text">' +
        ////////////                                                       d[2] +
        ////////////                                                    '</div>' +
        ////////////                                                    '<div class="news_post_meta">' +
        ////////////                                                        '<ul class="d-flex flex-row align-items-start justify-content-start">' +
        ////////////                                                            '<li><i class="fa fa-user"></i><a href="javascript:void(0)"> ' + d[3] + '</a></li>' +
        ////////////                                                            '<li><i class="fa fa-star"></i><a href="javascript:void(0)"> ' + d[6] + '</a></li>' +
        ////////////                                                            '<li><i class="fa fa-comment"></i><a href="javascript:void(0)"> ' + d[5] + ' Comentarios</a></li>' +
        ////////////                                                            '<li><i class="fa fa-hashtag"></i> Etiquetas: <a href="javascript:void(0)">' + d[7] + '</a></li>' +
        ////////////                                                        '</ul></div></div></div>');
        ////////////                countPosts++;
        ////////////            });

        ////////////            if (countPosts == 0) {
        ////////////                $("#idPostMasVistos").append('<div class="news_post"> <div class="news_post_content"> No se encontraron artículos para el criterio de busqueda <strong>"' + palabra + '"</strong>. </div> </div>');
        ////////////            }

        ////////////            savePalabra(palabra);
        ////////////            $('#txtsearch').val('');
        ////////////            $("#result").empty('');
        ////////////            $('#idPostMasVistos').easyPaginate({
        ////////////                paginateElement: '.news_post',
        ////////////                elementsPerPage: 5,
        ////////////                effect: 'climb'
        ////////////            });
        ////////////        },
        ////////////        error: function (response) {
        ////////////            swal("Hubo un error en esta búsqueda", {
        ////////////                icon: "error",
        ////////////                allowOutsideClick: false,
        ////////////                closeOnClickOutside: false
        ////////////            });
        ////////////        }
        ////////////    });
        ////////////}

        ////////////var bandera = false;
        //////////////evento boton buscar
        ////////////$("#btnBuscar").click(function () {
        ////////////    var palabra = $('#txtsearch').val();
        ////////////    if (palabra != "") {
        ////////////        loadListaArticulosxPalabra(palabra);
        ////////////    } else {
        ////////////        swal("Favor de ingresar un criterio de búsqueda", {
        ////////////            icon: "warning",
        ////////////            allowOutsideClick: false,
        ////////////            closeOnClickOutside: false
        ////////////        });
        ////////////    }

        ////////////});
        ////////////});

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

        //Carga articulos por categoria más vista
        function loadArticuloxCategoria(idCategoriaMasVista) {
            $("#idPostMasVistos").empty();
            $(".easyPaginateNav").remove();
            if ($("#box-blog").is(":visible")) {
                $("#box-blog").hide();
                $("#idPostMasVistos").show();
            }
            $.ajax({
                type: "POST",
                url: "Index.aspx/buscarArtMasVistosxCategorias",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idCategorias':" + idCategoriaMasVista + "}",
                success: function (response) {
                    var posts = $.parseJSON(response.d);
                    var countPosts = 0;
                    $.each(posts, function (i, d) {
                        $("#idPostMasVistos").append('<div class="news_post magic_fade_in">' +
                            '<div class="news_post_content">' +
                            '<div class="news_post_title"><a href="javascript:loadArticulo(' + d[0] + ')">' + d[1] + '</a><br><span class="span-blog-categorias">' + d[8].replace(/,/g, ' >> ') + '</span></div>' +
                            '<div class="news_post_text">' +
                            d[2] +
                            '</div>' +
                            '<div class="news_post_meta">' +
                            '<ul class="d-flex flex-row align-items-start justify-content-start">' +
                            '<li><i class="fa fa-user"></i><a href="javascript:void(0)"> ' + d[3] + '</a></li>' +
                            '<li><i class="fa fa-star"></i><a href="javascript:void(0)"> ' + d[6] + '</a></li>' +
                            '<li><i class="fa fa-comment"></i><a href="javascript:void(0)"> ' + d[5] + ' Comentarios</a></li>' +
                            '<li><i class="fa fa-hashtag"></i> Etiquetas: <a href="javascript:void(0)">' + d[7] + '</a></li>' +
                            '</ul></div></div></div>');
                        countPosts++;
                    });

                    if (countPosts == 0) {
                        $("#idPostMasVistos").append('<div class="news_post"> <div class="news_post_content"> No se encontraron artículos para esta categoría. </div> </div>');
                        $('#buscadorSel').val(null).trigger('change');
                        $(".select2-selection__rendered").empty();
                        $(".select2-selection__rendered").text('Buscador...');
                        palabraSelect = "";
                    }
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
        }

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
                    var countPostMasvistos = 0;
                    $.each(posts, function (i, d) {
                        $("#idPostMasVistos").append('<div class="news_post magic_fade_in">' +
                            '<div class="news_post_content">' +
                            '<div class="news_post_title"><a href="javascript:loadArticulo(' + d[0] + ')">' + d[1] + '</a><br><span class="span-blog-categorias">' + d[8].replace(/,/g, ' >> ') + '</span></div>' +
                            '<div class="news_post_text">' +
                            d[2].substring(d[2].indexOf('<p>'), d[2].indexOf('</p>') + 4) +
                            '</div>' +
                            '<div class="news_post_meta">' +
                            '<ul class="d-flex flex-row align-items-start justify-content-start">' +
                            '<li><i class="fa fa-user"></i><a href="javascript:void(0)"> ' + d[3] + '</a></li>' +
                            '<li><i class="fa fa-star"></i><a href="javascript:void(0)"> ' + d[6] + '</a></li>' +
                            '<li><i class="fa fa-comment"></i><a href="javascript:void(0)"> ' + d[5] + ' Comentarios</a></li>' +
                            '<li><i class="fa fa-hashtag"></i> Etiquetas: <a href="javascript:void(0)">' + d[7] + '</a></li>' +
                            '</ul></div></div></div>');
                        countPostMasvistos++;
                    });
                    if (countPostMasvistos == 0) {
                        $("#idPostMasVistos").append('<div class="news_post"> <div class="news_post_content"> No hay artículos registrados. </div> </div>');
                    }
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
            $("#box-historial-blog").hide();
            $('#box-historial-detalleArticulo').hide();
            $("#box-contenido-blog").show();
            $("#box-titulo-blog, #box-contenido-blog, #box-Botones-blog-autor, #box-Botones-blog-estrella, #box-Botones-blog-comentario,#box-Botones-blog-comentario, #box-Botones-blog-tags").empty();
            $.ajax({
                type: "POST",
                url: "Index.aspx/articuloxId",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArt':" + idArt + "}",
                success: function (response) {
                    var posts = $.parseJSON(response.d);
                    $.each(posts, function (i, d) {
                        $("#box-titulo-blog").append(d[1] + '<br><span class="span-blog-categorias">' + d[8].replace(/,/g, ' >> ') + '</span>');
                        $("#box-contenido-blog").append(d[2]);
                        $("#box-Botones-blog-autor").append(" " + d[3]);
                        $("#box-Botones-blog-estrella").append(" " + d[5]);
                        $("#box-Botones-blog-comentario").append(" " + d[4] + " Comentarios");
                        $("#box-Botones-blog-tags").append(" " + d[7]);
                        estrellas(d[6]);
                    });
                    estrellaArticulo = 6;
                    registrarVisita(idArt);
                    consultarComentarios(idArt);
                    idArticuloActual = idArt;
                    showHistorial(idArt);
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

        //Registro de visitas por artículo
        function registrarVisita(idArticulo) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/registrarVisita",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArticulo':" + idArticulo + " }",
                success: function (response) {
                    if (response.d < 0) {

                    }
                }
            });
        }


        function estrellas(num) {
            var estrellaArray = ["star1", "star2", "star3", "star4", "star5"];
            $.each(estrellaArray, function (i, d) {
                if (i < num) {
                    $("#" + d).addClass("starSelected");
                } else {
                    $("#" + d).removeClass("starSelected");
                }
            });
            estrellaArticulo = num;
        }

        //Consulta de comentario por id del artículo
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
                        $("#box-blog-listas-comentarios").append(' <div class="box-blog-coment-contenedor">' +
                            '<div class="box-blog-coment-titulo">' +
                            '<span class="box-blog-coment-titulo-autor">' + d[2] + '</span><span class="box-blog-coment-titulo-fecha">' + d[1] + '</span>' +
                            '</div>' +
                            '<div class="box-blog-coment-contenido">' +
                            d[0] +
                            '</div></div>');
                        countComent++;
                    });
                    if (countComent == 0) {
                        $("#box-blog-listas-comentarios").append('<div class="box-blog-coment-contenedor"> No hay comentarios para este artículo.</div>');
                    }

                    $('#box-blog-listas-comentarios').easyPaginate({
                        paginateElement: '.box-blog-coment-contenedor',
                        elementsPerPage: 3,
                        effect: 'climb'
                    });
                }
            });
        }

        function registrarValoracionArticulo(estrellas, idArticulo, comentario) {

            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/registrarValoracionArticulo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'estrellas':" + estrellas + ", 'idArticulo':" + idArticulo + ", 'comentario':'" + comentario + "'}",
                success: function (response) {
                    if (response.d == 0) {
                        $("#box-blog-txtComentario").val('');
                        consultarComentarios(idArticulo);
                        swal('Valoración registrada.', {
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
            registrarValoracionArticulo(estrellaArticulo, idArticuloActual, comentario);

        }


        /**********************
                                                                HISTORIAL
        **********************/

        //Cambia contenido del blog por el historial o viceversa
        function verHistorial() {
            if ($("#box-contenido-blog").is(":visible")) {
                $("#box-contenido-blog").hide();
                $("#box-historial-blog").show();
            } else {
                $("#box-historial-blog").hide();
                $('#box-historial-detalleArticulo').hide();
                $("#box-contenido-blog").show();
            }
        }

        //Carga el historial
        function showHistorial(id) {
            var html = '';
            $('#box-historial-blog').html('');
            $('#box-historial-detalleArticulo').hide();

            $.ajax({
                type: "POST",
                url: "Historial.aspx/historialxIdArticulo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'idArt':'" + id + "'}",
                success: function (response) {
                    var valNew = response.d.split('$$');
                    var val = [];

                    for (var i = 0; valNew.length; i++) {
                        if (valNew[i] != "" && valNew[i] <= valNew[i] + 1) {
                            val[i] = valNew[i].split('||');
                        } else {
                            break;
                        }
                        window.responseGlobal = valNew[i];

                        html += '<li><label class="text-dark font-weight-bold">Fecha de Creación: </label>';
                        var fechaCreacion = moment(val[i][4], 'DD-MM-YYYY').format('DD-MM-YYYY');
                        html += '<label class="font-italic">' + fechaCreacion + '&nbsp;&nbsp;</label>';
                        html += '<label class="text-dark font-weight-bold">Fecha de Modificación: </label>';
                        var fechaModificacion = moment(val[i][5], 'DD-MM-YYYY').format('DD-MM-YYYY');
                        html += '<label class="font-italic">' + fechaModificacion + '&nbsp;&nbsp;</label>';
                        html += '<label class="text-dark font-weight-bold">Autor: </label>';
                        html += '<label class="font-italic">' + val[i][6] + '&nbsp;&nbsp;</label>';
                        html += '<label class="text-dark font-weight-bold">Versión: </label>';
                        html += '<label class="font-italic">' + val[i][2] + '&nbsp;&nbsp;</label>';
                        html += '<a id="btnVer" class="btn btn-link font-weight-bold" href="javascript:void(0)" onclick="showArticuloHistorial(responseGlobal);" role="button">Ver versión</a></li><br>';

                        $('#box-historial-blog').html(html);
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
            $('#box-historial-blog').hide();
            var valNew = objeto.split('||');
            var html = '';
            $('#box-historial-detalleArticulo').html('');

            html += '<div class="box_table_container_historial">';
            html += '   <div class="row">';
            html += '       <span class="box_table_title"> Vista previa <a id="btnAtras" class="btn btn-warning pull-right" href="javascript:void(0)" onclick="returnHistorial();" role="button"> <i class="fa fa-minus-square" aria-hidden="true"></i> Ocultar vista previa</a></span>';
            // html += '       ';
            html += '   </div>';
            html += '   <br>';
            html += '   <div id="box-contenido-blog">' + valNew[3] + '</div>';
            html += '</div>';

            $('#box-historial-detalleArticulo').show();
            $('#box-historial-detalleArticulo').html(html);
        }

        function returnHistorial() {
            $('#box-historial-detalleArticulo').hide();
            $('#box-historial-blog').show();
        }

    </script>
</asp:Content>
