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
                        <input type="text" class="form-control" placeholder="Search" id="txtsearch" autocomplete="off">
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





                    <%--<input type="text" class="js-example-basic-multiple js-states form-control" id="Buscador"/>--%>
                    <%--<select class="js-example-basic-multiple js-states form-control" id="txtBuscador"></select>
                    <asp:DropDownList ID="DDLCategorias" runat="server" class="form-control">
                    </asp:DropDownList>--%>
                </div>
                <div class="col-lg-3"></div>
            </div>
            <div class="row">
                <div class="col-lg-2 sidebar_col">
                    <div class="sidebar listasOcultar">
                        <!-- Recent Posts -->
                        <div class="recent_posts sidebar_section magic_fade_in">
                            <div class="sidebar_title_container">
                                <div>Artículos recientes</div>
                            </div>
                            <div class="sidebar_list" runat="server" id="lstArt">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- News Content -->
                <div class="col-lg-8">
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
                <div class="col-lg-2 sidebar_col pull-right">
                    <div class="sidebar listasOcultar">
                        <!-- Recent Comments -->
                        <div class="recent_posts sidebar_section magic_fade_in">
                            <div class="sidebar_title_container">
                                <div>Categorías</div>
                            </div>
                            <div class="sidebar_list" runat="server" id="lstCatg">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <script>
        $(document).ready(function () {
            $.ajaxSetup({ cache: false });
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
                                        $('#result').append('<li class="list-group-item link-class"><span class="l">' + index.nombreArticulo + '</span></li>');
                                    });

                                });


                            }




                            //do somthing here
                        }
                    });
                }


            });

            //evento al seleccionar
            $('#result').on('click', 'li', function () {

                //console.log($(this).val());
                $('#txtsearch').val($(this).text());
                $("#result").html('');

            });

            //evento al dar enter
            $('#search').on('keydown', function (e) {
                if (e.which == 13) {
                    console.log($('#txtsearch').val());
                    //e.preventDefault();
                }
            });

            //evento boton 

            $("#btnBuscar").click(function () {
                console.log($('#txtsearch').val());






            });


        });
    </script>



    <%--<script type="text/javascript">
        $(document).ready(function () {
            var data = [];
            var arreglo = [];

            $.ajax({
                async: false,
                type: "POST",
                url: "Index.aspx/articulosxValidar",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'palabra':'" + txtBuscador + "'}",
                success: function (response) {

                    $.each(response, function (item, index) {

                        //arreglo.push(index)
                        //console.log(jQuery.parseJSON(index));
                        $.each(jQuery.parseJSON(index), function (item, index) {
                            data.push({
                                id: index.id,
                                text: index.text
                            })


                        });



                    });


                    //do somthing here
                }
            });

            console.log(data);
            $("#txtBuscador").select2({
                placeholder: "Buscar...",
                minimumInputLength: 1,
                data: data
            });
        });
    </script>--%>
</asp:Content>
