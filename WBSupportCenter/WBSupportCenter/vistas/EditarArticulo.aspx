

<%@ Page Title="" Language="C#" MasterPageFile="~/general.Master" AutoEventWireup="true" CodeBehind="EditarArticulo.aspx.cs" Inherits="SupportCenter.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../scripts/ckeditor/ckeditor.js"></script>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <!DOCTYPE html>

        <html>
        <head>
            <meta charset="utf-8">
            <style type="text/css">
                
            </style>
        </head>
        <body>

            <div class="row">
                <div class="col-lg-12">
                    <div class="jarviswidget" id="wid-id-0" data-widget-colorbutton="false"	data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-sortable="false">
				        <header>
					        <h2>Editar Artículo</h2>
				        </header>

				        <!-- widget div-->

				        <div>
					        <!-- widget edit box -->
					        <div class="jarviswidget-editbox">
						        <!-- This area used as dropdown edit box -->
						        <input class="form-control" type="text">
					        </div>
					        <!-- end widget edit box -->

					        <!-- widget content -->
					        <div class="widget-body">
						        <fieldset>
							        <legend>
                                        <div class="pull-right">
                                            <button id="submit" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Aceptar</button>
                                            <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-cloud-upload"></span>  Cargar imagen o video</button>
                                            <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Cancelar</button>
                                        </div>
							        </legend>
							        <div class="form-group">
                            
                                        <form method="post">
                                            <textarea name="editor1" id="editor1">
                                                &lt;p&gt;Ingresar contenido.&lt;/p&gt;
                                            </textarea>
                                            <script>
                                                CKEDITOR.replace('editor1', {
                                                    on: {
                                                        loaded: function (e) {
                                                            var rules = {
                                                                elements: {
                                                                    table: function (element) {
                                                                        // Add bootstrap table class to ckeditor tables
                                                                        $(element).addClass('table');
                                                                    }
                                                                }
                                                            };
                                                            e.editor.dataProcessor.dataFilter.addRules(rules);
                                                            e.editor.dataProcessor.htmlFilter.addRules(rules);
                                                        }
                                                    }
                                                });
                                                CKEDITOR.config.defaultLanguage = 'es-mx';
                                                CKEDITOR.config.height = '35em';
                                            </script>
                                        </form>
                                        <br />							
							        </div>
						        </fieldset>
					        </div>
					        <!-- end widget content -->

				        </div>
				        <!-- end widget div -->

			        </div>
                </div>
            </div>
            <script>
                document.querySelector('#submit').addEventListener('click', () => {
                    var data = CKEDITOR.instances.editor1.getData();
                    console.log(data);
                });
            </script>
        </body>
        </html>
</asp:Content>
