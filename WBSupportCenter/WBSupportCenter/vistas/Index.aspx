<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SupportCenter.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



                



    	<div class="news">

            

		<div class="container">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6" style="text-align:center">
                    <div id="form_cent" class="d-flex flex-row align-items-center justify-content-start" style="position:inherit !important">
						<input type="text" class="domain_search_input" placeholder="Buscar un artículo" required="required" style="border: 1px solid #232D3B !important;"/>
						<div class="domain_search_dropdown d-flex flex-row align-items-center justify-content-start">
								<button class="sidebar_search_button d-flex flex-column align-items-center justify-content-center"><img src="../recursos/img/city/search_small.png" alt=""></button>
						</div>
					</div>
                </div>
                <div class="col-lg-3"></div>
            </div>

			<div class="row">
				<div class="col-lg-2 sidebar_col">
					<div class="sidebar">

						<!-- Recent Posts -->
						<div class="recent_posts sidebar_section magic_fade_in">
							<div class="sidebar_title_container">
								<div>Artículos recientes</div>
							</div>
							<div class="sidebar_list">
								<ul>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Nullam lacinia ex eleifend orci...</div>
									</a></li>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Suscipit interdum augue condime...</div>
									</a></li>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Etiam pretium turpis ege...</div>
									</a></li>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Lorem ipsum dolor sit amet...</div>
									</a></li>
								</ul>
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
										<li><i class="fa fa-user"></i> <a href="#"> Autor</a></li>
										<li><i class="fa fa-star"></i> <a href="#"> 5</a></li>
										<li><i class="fa fa-comment"></i><a href="#"> 3 Comentarios</a></li>
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
										<li><i class="fa fa-user"></i> <a href="#"> Autor</a></li>
										<li><i class="fa fa-star"></i> <a href="#"> 4.5</a></li>
										<li><i class="fa fa-comment"></i><a href="#"> 10 Comentarios</a></li>
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
										<li><i class="fa fa-user"></i> <a href="#"> Autor</a></li>
										<li><i class="fa fa-star"></i> <a href="#"> 3</a></li>
										<li><i class="fa fa-comment"></i><a href="#"> 1 Comentarios</a></li>
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
							</a></li>
						</ul>
					</div>
				</div>

				<!-- News Sidebar -->
				<div class="col-lg-2 sidebar_col pull-right">
					<div class="sidebar">

						<!-- Recent Comments -->
						<div class="recent_posts sidebar_section magic_fade_in">
							<div class="sidebar_title_container">
								<div>Categorías</div>
							</div>
							<div class="sidebar_list">
								<ul>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Hotel</div>
									</a></li>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Viajes</div>
									</a></li>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Atención a cliente</div>
									</a></li>
									<li><a href="#" class="d-flex flex-row align-items-start justify-content-start">
										<div class="sidebar_dot d-flex flex-row align-items-center justify-content-start">
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
											<i class="fa fa-chevron-right trans_200" aria-hidden="true"></i>
										</div>
										<div>Promociones</div>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    

   

    
    

</asp:Content>
