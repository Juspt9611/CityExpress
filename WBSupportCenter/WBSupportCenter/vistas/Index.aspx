<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SupportCenter.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />--%>

    <%--<script src="../scripts/jquery-1.7.min.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div class="news">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <br />
                </div>
                <div class="col-lg-6" style="text-align: center">
                    <%--<input type="text" class="js-example-basic-multiple js-states form-control" id="Buscador"/>--%>
                    <select class="js-example-basic-multiple js-states form-control" id="txtBuscador"></select>
                    <asp:DropDownList ID="DDLCategorias" runat="server">
                    </asp:DropDownList>


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








    <script type="text/javascript">
        $(document).ready(function () {
            var data = [];
            var arreglo=[];

            $.ajax({
                async:false,
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




    </script>




</asp:Content>
