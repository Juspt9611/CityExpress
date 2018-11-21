

<%@ Page Title="" Language="C#" MasterPageFile="~/general.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SupportCenter.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../scripts/ckeditor/ckeditor.js"></script>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <!DOCTYPE html>

        <html>
        <head>
            <meta charset="utf-8">
            <title>CKEditor 5 – Classic editor</title>
            <style type="text/css">
                
            </style>
        </head>
        <body>

            <div class="row">
                <div class="col-lg-12">
                    <form method="post">
                        <textarea name="editor1" id="editor1">
                            &lt;h2 style="text-align: center;"&gt;&lt;strong&gt;Las tres mejores cosas que aprendes del viaje&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;
                            Como todas las grandes cosas en la tierra, el viaje nos enseña con el ejemplo. Estas son algunas de las lecciones más valiosas que he aprendido a lo largo de los años de viajes.&lt;/p&gt;&lt;p style="text-align: center;"&gt;&lt;img alt="Three Monks walking on ancient temple." src="../../assets/img/umbrellas.jpg" style="height:80%; width:50%" /&gt;&lt;/p&gt;&lt;p style="text-align: center;"&gt;&lt;em&gt;
                            Dejar su zona de confort podría llevarle a paisajes tan hermosos como este.&lt;/em&gt;&lt;/p&gt;&lt;h2&gt;
                            Apreciación de la diversidad&lt;/h2&gt;&lt;p&gt;Acostumbrarse a una cultura completamente diferente puede ser un desafío. Si bien también es bueno aprender sobre culturas en línea o de libros, nada se compara con experimentar la diversidad cultural en persona. Aprendes a apreciar todas y cada una de las diferencias mientras te vuelves más fluido culturalmente.&lt;/p&gt;&lt;blockquote&gt;&lt;p&gt;
                            El verdadero viaje de descubrimiento no consiste en buscar nuevos paisajes, sino en tener nuevos ojos.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Marcel Proust&lt;/strong&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h3&gt;Improvisación&lt;/h3&gt;&lt;p&gt;La vida no nos permite ejecutar cada plan a la perfección. Esto parece ser especialmente el caso cuando viajas. Lo planeas a cada minuto con una gran lista de verificación; pero cuando se trata de ejecutarlo, siempre surge algo y te quedan tus habilidades de improvisación. Aprendes a adaptarte a medida que avanzas. Así es como se ve mi lista de control de viaje ahora:
                            &lt;/p&gt;&lt;ul&gt;&lt;li&gt;Compra el boleto&lt;/li&gt;&lt;li&gt;Inicia tu aventura&lt;/li&gt;&lt;/ul&gt;&lt;h3&gt;Confianza&lt;/h3&gt;&lt;p&gt;
                            Ir a un nuevo lugar puede ser bastante aterrador. Mientras que el cambio y la incertidumbre nos asustan, viajar nos enseña lo ridículo que es tener miedo de algo antes de que suceda. En el momento en que te enfrentas a tu miedo y ves que no había nada que temer, es el momento en que descubres la felicidad.&lt;/p&gt;
                        </textarea>
                        <script>
                            CKEDITOR.replace('editor1');
                            CKEDITOR.config.height = '35em';
                        </script>
                    </form>
                    <br />
                    <input class="btn btn-primary" id="submit" type="button" value="Guardar">
                </div>
            </div>
            <script>
        
                //$("#submit").click(function () {
                //    var data = CKEDITOR.instances.editor1.getData();
                //    console.log(data);
                //});

                document.querySelector('#submit').addEventListener('click', () => {
                    var data = CKEDITOR.instances.editor1.getData();
                    console.log(data);
                });
            </script>
        </body>
        </html>
</asp:Content>