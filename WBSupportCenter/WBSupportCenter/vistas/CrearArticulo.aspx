<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="CrearArticulo.aspx.cs" Inherits="WBSupportCenter.vistas.CrearArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../scripts/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="box_table_container">
            <div class="row">
                <span class="box_table_title" style="margin-bottom:1rem;">Crear artículo</span>
            </div>
            <div class="row">
                <form>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="nombre-box-form-crearart" class="col-form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombre-box-form-crearart"/>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="categoria-box-form-crearart" class="col-form-label">Categoría:</label>
                            <input type="text" class="form-control" id="categoria-box-form-crearart"/>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="subcat-box-form-crearart" class="col-form-label">Subcategoría:</label>
                            <input type="text" class="form-control" id="subcat-box-form-crearart"/>
                        </div>
                    </div>
                </form> 
            </div>      
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

            <div class="row">
                <div class="col-lg-12 box_table_buttons">
                    <button type="button" class="btn btn-success float-right"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>        
                    <button type="button" class="btn btn-danger float-right" onclick="window.location.href = 'ArticulosRed.aspx'"><i class="fa fa-arrow-left" aria-hidden="true"></i> Cancelar</button>
                </div>
            </div>
     </div>
    </div>

    <script>
        document.querySelector('#submit').addEventListener('click', () => {
            var data = CKEDITOR.instances.editor1.getData();
            console.log(data);
        });
    </script>

</asp:Content>
