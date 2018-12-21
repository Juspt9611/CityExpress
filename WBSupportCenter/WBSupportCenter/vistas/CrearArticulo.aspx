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
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="nombre_box_form_crearart" class="col-form-label">Título del artículo:</label>
                            <input id="nombre_box_form_crearart"  type="text" class="form-control" />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div id="tree">
                            <ul id="demo">
                              <item
                                class="item col-form-label"
                                :model="treeData">
                              </item>
                            </ul>
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
                    <button id="submit" type="button" class="btn btn-success float-right"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>        
                    <button type="button" class="btn btn-danger float-right" onclick="window.location.href = 'ArticulosRed.aspx'"><i class="fa fa-arrow-left" aria-hidden="true"></i> Cancelar</button>
                </div>
            </div>
     </div>
    </div>

    <script>

        document.querySelector('#submit').addEventListener('click', () => {

            //Variables
            var data = CKEDITOR.instances.editor1.getData();
            var tituloArt = $('#nombre_box_form_crearart').val().trim();
            const categorias = [];

            if ($("#nombre_box_form_crearart").hasClass("form-control-error"))
            {
                $("#nombre_box_form_crearart").removeClass('form-control-error');
            }

            $("input[type='checkbox']:checked").each(function () {
                categorias.push($(this).val());
            });
            
            //Se valida campo del titulo de articulo
            if (tituloArt.length == 0 || tituloArt.length > 51) {
                $("#nombre_box_form_crearart").addClass('form-control-error');
                $.notify('Revisar formato', {
                    className: "error",
                    globalPosition: 'right middle'
                });
            } else {
                $.ajax({
                    type: "POST",
                    url: "CrearArticulo.aspx/registrarArticulo",
                    data: "{'nombreArticulo':'"+tituloArt+"', 'contenido':'"+data+"','categorias':"+JSON.stringify(categorias)+"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        $.notify('Se ha registrado el artículo', {
                            className: "success",
                            globalPosition: 'right middle'
                        });


                    },
                    failure: function (response) {
                        $.notify('No se ha registrado el artículo', {
                            className: "error",
                            globalPosition: 'right middle'
                        });
                    }
                });
            }
     
        });        
    </script>

    <script src="https://cdn.jsdelivr.net/npm/vue"></script>  
    <!-- item template -->
    <script type="text/x-template" id="item-template">
        <li>
        <div
            :class="{bold: isFolder}">
            {{ model.name }}
            <input type="checkbox" :value="model.value">
            <span v-if="isFolder"
             @click="toggle"
            @dblclick="changeType">[{{ open ? '-' : '+' }}]</span>
        </div>
        <ul v-show="open" v-if="isFolder">
            <item
            class="item"
            v-for="(model, index) in model.children"
            :key="index"
            :model="model">
            </item>
        </ul>
        </li>
    </script>


    <script>

        // demo data
        var data = {
            name: 'Categorias', value: 'cat',
            children: [
              {
                  name: 'Pago Express de Comisiones', value: 1,
                  children: [
                    { name: 'Atención a hoteles', value: 2},
                    { name: 'Atención a agencias mayoristas y minoristas', value: 3 },
                    {
                        name: 'Atención a OTAs', value: 4,
                        children: [
                          { name: 'Booking', value: 5 },
                          { name: 'Expedia', value: 6 },
                          { name: 'Despegar', value: 7 },
                          { name: 'Best Day', value: 8 }
                        ]
                    }
                  ]
              },
              { name: 'Canales (Atención a agencias y hoteles)', value: 9 }
            ]
        };

        // define the item component
        Vue.component('item', {
            template: '#item-template',
            props: {
                model: Object
            },
            data: function () {
                return {
                    open: false
                }
            },
            computed: {
                isFolder: function () {
                    return this.model.children && this.model.children.length
                }
            },
            methods: {
                toggle: function () {
                    if (this.isFolder) {
                        this.open = !this.open
                    }
                },
                changeType: function () {
                    if (!this.isFolder) {
                        Vue.set(this.model, 'children', [])
                        this.open = true
                    }
                }
            }
        });

        // boot up the demo
        var demo = new Vue({
            el: '#demo',
            data: {
                treeData: data
            }
        });
    </script>

    <script>
        $("input[value='cat']").remove();
    </script>

</asp:Content>
