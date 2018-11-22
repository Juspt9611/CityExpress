

<%@ Page Title="" Language="C#" MasterPageFile="~/general.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SupportCenter.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-12">
            <h2 style="text-align:center"><strong>Las tres mejores cosas que aprendes del viaje</strong></h2><p>Como todas las grandes cosas en la tierra, el viaje nos ense&ntilde;a con el ejemplo. Estas son algunas de las lecciones m&aacute;s valiosas que he aprendido a lo largo de los a&ntilde;os de viajes.</p><p style="text-align:center"><img alt="Three Monks walking on ancient temple." src="../../assets/img/umbrellas.jpg" style="height:80%; width:50%" /></p><p style="text-align:center"><em>Dejar su zona de confort podr&iacute;a llevarle a paisajes tan hermosos como este.</em></p><h2>Apreciaci&oacute;n de la diversidad</h2><p>Acostumbrarse a una cultura completamente diferente puede ser un desaf&iacute;o. Si bien tambi&eacute;n es bueno aprender sobre culturas en l&iacute;nea o de libros, nada se compara con experimentar la diversidad cultural en persona. Aprendes a apreciar todas y cada una de las diferencias mientras te vuelves m&aacute;s fluido culturalmente.</p><blockquote><p>El verdadero viaje de descubrimiento no consiste en buscar nuevos paisajes, sino en tener nuevos ojos.</p><p><strong>Marcel Proust</strong></p></blockquote><h3>Improvisaci&oacute;n</h3><p>La vida no nos permite ejecutar cada plan a la perfecci&oacute;n. Esto parece ser especialmente el caso cuando viajas. Lo planeas a cada minuto con una gran lista de verificaci&oacute;n; pero cuando se trata de ejecutarlo, siempre surge algo y te quedan tus habilidades de improvisaci&oacute;n. Aprendes a adaptarte a medida que avanzas. As&iacute; es como se ve mi lista de control de viaje ahora:</p><ul><li>Compra el boleto</li><li>Inicia tu aventura</li></ul><h3>Confianza</h3><p>Ir a un nuevo lugar puede ser bastante aterrador. Mientras que el cambio y la incertidumbre nos asustan, viajar nos ense&ntilde;a lo rid&iacute;culo que es tener miedo de algo antes de que suceda. En el momento en que te enfrentas a tu miedo y ves que no hab&iacute;a nada que temer, es el momento en que descubres la felicidad.</p>
          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Deja un comentario:</h5>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
              </form>
            </div>
          </div>

          <!-- Single Comment -->

            <div class="rating">
                <input type="radio" name="overall" id="overall-5">
                <label for="overall-5"><i class="fa fa-star"></i></label>
                <input type="radio" name="overall" id="overall-4">
                <label for="overall-4"><i class="fa fa-star"></i></label>
                <input type="radio" name="overall" id="overall-3">
                <label for="overall-3"><i class="fa fa-star"></i></label>
                <input type="radio" name="overall" id="overall-2">
                <label for="overall-2"><i class="fa fa-star"></i></label>
                <input type="radio" name="overall" id="overall-1">
                <label for="overall-1"><i class="fa fa-star"></i></label>
                Overall rating
            </div>
        </div>
             <!-- Sidebar Widgets Column -->

          </div>
        </div>
</asp:Content>