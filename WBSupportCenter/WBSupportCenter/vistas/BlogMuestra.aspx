

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
                <form method="post">
                    <textarea name="editor1" id="editor1">
                        &lt;h2 style="text-align: center;"&gt;&lt;strong&gt;The three greatest things you learn from traveling&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;Like all the great things on earth traveling teaches us by example. Here are some of the most precious lessons I&rsquo;ve learned over the years of traveling.&lt;/p&gt;&lt;p style="text-align: center;"&gt;&lt;img alt="Three Monks walking on ancient temple." src="../../assets/img/umbrellas.jpg" /&gt;&lt;/p&gt;&lt;p style="text-align: center;"&gt;&lt;em&gt;Leaving your comfort zone might lead you to such beautiful sceneries like this one.&lt;/em&gt;&lt;/p&gt;&lt;h2&gt;Appreciation of diversity&lt;/h2&gt;&lt;p&gt;Getting used to an entirely different culture can be challenging. While it&rsquo;s also nice to learn about cultures online or from books, nothing comes close to experiencing cultural diversity in person. You learn to appreciate each and every single one of the differences while you become more culturally fluid.&lt;/p&gt;&lt;blockquote&gt;&lt;p&gt;The real voyage of discovery consists not in seeking new landscapes, but having new eyes.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Marcel Proust&lt;/strong&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h3&gt;Improvisation&lt;/h3&gt;&lt;p&gt;Life doesn&#39;t allow us to execute every single plan perfectly. This especially seems to be the case when you travel. You plan it down to every minute with a big checklist; but when it comes to executing it, something always comes up and you&rsquo;re left with your improvising skills. You learn to adapt as you go. Here&rsquo;s how my travel checklist looks now:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;buy the ticket&lt;/li&gt;&lt;li&gt;start your adventure&lt;/li&gt;&lt;/ul&gt;&lt;h3&gt;Confidence&lt;/h3&gt;&lt;p&gt;Going to a new place can be quite terrifying. While change and uncertainty makes us scared, traveling teaches us how ridiculous it is to be afraid of something before it happens. The moment you face your fear and see there was nothing to be afraid of, is the moment you discover bliss.&lt;/p&gt;
                    </textarea>
                    <script>
                        CKEDITOR.replace('editor1');
                        CKEDITOR.config.height = '35em';
                    </script>
                </form>
                <br />
                <input class="btn btn-primary" id="submit" type="button" value="Guardar">

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