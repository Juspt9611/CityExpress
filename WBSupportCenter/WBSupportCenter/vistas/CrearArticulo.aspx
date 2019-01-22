<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="CrearArticulo.aspx.cs" Inherits="WBSupportCenter.vistas.CrearArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../scripts/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
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
                            <div class="invalid-feedback">
                                Agregar un título entre 1 y 50 caracteres.
                            </div>
                        </div>
                    </div>
                </form> 
            </div> 
            <div class="row">
                <div class="col-lg-6">
                        <div class="form-group">
                            <label for="cat_box_form_crearart" class="col-form-label">Categorías: </label>
                            <select class="form-control" id="cat_box_form_crearart">
                            </select>
                            <div class="invalid-feedback">
                                Registrar una categoría.
                            </div>
                        </div>
                    </div>
                <div class="col-lg-6 align-self-center">
                    <div id="catSpan_box_form_crearart"></div>
                </div>
            </div>  
            <div class="row">
                <div class="col-lg-6 mb-3">
                  <label for="tags_box_form_crearart">Tags:</label>
                  <div class="input-group">
                    <input type="text" class="form-control" id="tags_box_form_crearart" aria-describedby="tags_box_form_crearartButton" required>
                    <div class="input-group-prepend">
                      <button id="tags_box_form_crearartButton" type="button" class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i></button>
                    </div>
                    <div id="tag-invalid-form" class="invalid-feedback">
                        Agregar un tag entre 1 y 50 caracteres.
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                    <div id="tagcontainer_box_form_crearart"></div>
                </div>
            </div>  
            <div class="form-group row" style="margin-bottom:1em;">
                <div class="col-lg-2">Grupos: </div>
                <input type="text" class="form-control" id="inGrupos-form-crearart" style="display: none;" />
                <div class="col-lg-10" id="Grupos-form-crearart">
                    
                </div>
                <div class="invalid-feedback">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Asignar uno o más grupos.
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 mb-3">
                    <label for="img-form-crearart">Agregar una imágen: </label>
                    <div class="input-group">
                        <input type="file" class="form-control-file" id="img-form-crearart" style="width:93.5%;">
                        <div class="input-group-prepend">
                            <button id="submit-img-form-crearart" type="button" class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <form method="post">
                <textarea name="editor1" id="editor1">
                    &lt;p&gt;Ingresar contenido.&lt;/p&gt;
                </textarea>
                <script>
                    CKEDITOR.replace('editor1', {
                        //filebrowserUploadUrl: 'upload.ashx',
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

    </form>
    <script>
        var cat = [];
        var tags = [];

        /********** JS functions 
        ************************/

    //Cargar categorias a select
        function initCategorias(idPAdreCat) {
            $("#cat_box_form_crearart").empty();
            $("#cat_box_form_crearart").append('<option value="cat">Selecciona una categoría</option>');
            $.ajax({
                type: "POST",
                url: "CrearArticulo.aspx/consultarCat",
                data: "{ 'idPadreCat': '" + idPAdreCat + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var opts = $.parseJSON(data.d);
                    $.each(opts, function (i, d) {
                        $("#cat_box_form_crearart").append('<option value="' + d[0] + '">' + d[1] + '</option>');
                    });
                }
            });
        }

    //Evento para boton de enviar
        document.querySelector('#submit').addEventListener('click', function () {

            var grupos = [];

            var i = 0;
            $("input[type='checkbox']:checked").each(function () {
                grupos.push(this.value);
                i++;
            });

            //Variables
            var data = CKEDITOR.instances.editor1.getData();
            var tituloArt = $('#nombre_box_form_crearart').val().trim();

            if ($("#nombre_box_form_crearart").hasClass("is-invalid")) {
                $("#nombre_box_form_crearart").removeClass('is-invalid');
            }

            if ($("#cat_box_form_crearart").hasClass("is-invalid")) {
                $("#cat_box_form_crearart").removeClass('is-invalid');
            }

            if ($("#inGrupos-form-crearart").hasClass("is-invalid")) {
                $("#inGrupos-form-crearart").removeClass('is-invalid');
            }

            if ($("#tags_box_form_crearart").hasClass("is-invalid")) {
                $("#tags_box_form_crearart").removeClass('is-invalid'); ///////////////////////////////
            }
            
            if (tituloArt.length == 0 || tituloArt.length > 51) {  //Se valida campo del titulo de articulo

                $("#nombre_box_form_crearart").addClass('is-invalid');
                
            } else if (cat.length == 0) {   // Se valida que se haya ingresado una cetegoria
                $("#cat_box_form_crearart").addClass('is-invalid');
            } else if (i == 0) {
                $("#inGrupos-form-crearart").addClass('is-invalid');
            } else {

                var articuloNuevo = {};
                articuloNuevo.nombreArticulo = tituloArt;
                articuloNuevo.contenido = data;
                articuloNuevo.categorias = cat.join();
                articuloNuevo.tags = (tags.length == 0 ? "" : tags.join());
                articuloNuevo.grupos = grupos.join();

                $.ajax({
                    type: "POST",
                    url: "CrearArticulo.aspx/registrarArticulo",
                    data: JSON.stringify(articuloNuevo),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        //Se limpian campos de formulario
                        $('#nombre_box_form_crearart').val("");
                        cat.length = 0;
                        initCategorias(0);
                        $("#catSpan_box_form_crearart").empty();
                        tags.length = 0;
                        $('#tags_box_form_crearart').val("");
                        $('#tagcontainer_box_form_crearart').empty();
                        CKEDITOR.instances.editor1.setData("<p>Ingresar contenido.</p>");

                        if (response.d==0) {
                            swal("Aritículo registrado", {
                                icon: "success",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            });
                            $(".swal-button").click(function () {
                                //closeSite();
                            });

                        } else {

                            swal("Hubo un error con el registro", {
                                icon: "error",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            });
                            $(".swal-button").click(function () {
                                //closeSite();
                            });
                        }

                    },
                    error: function (response) {

                        swal("Hubo un error con el registro", {
                            icon: "error",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                        $(".swal-button").click(function () {
                            //closeSite();
                        });
                    }
                });
            }

        });
    
    //Metodo para actualizar select           
        $("#cat_box_form_crearart").change(function () {
            var valCatSelect = $(this).find('option:selected').val();
            var textCatSelect = $(this).find('option:selected').text();
            $("#catSpan_box_form_crearart").append("<span  onclick='spanClickCat(" + valCatSelect + ");'> >> <i style='cursor: pointer;'> " + textCatSelect + "</i></span>");
            initCategorias(valCatSelect);
            cat.push(valCatSelect);
        });
    
    //Metodo para eliminar elementos del select
        function spanClickCat(id) {

            if(cat.indexOf(id.toString()) == 0){
                initCategorias(0);
            } else {
                initCategorias( cat[ cat.indexOf( id.toString() ) - 1 ] );
            }

            for (i = 0; i < (cat.length - cat.indexOf(id.toString())) ; i++) {
                $("#catSpan_box_form_crearart span:last-child").remove()
            }
            cat.splice(cat.indexOf(id.toString()), cat.length);

        }
    
    //Funcion para eliminar tags
        function borrarTag(stTag) {
            var id = "#idTag" + stTag;
            $(id).remove();
            tags.splice(tags.indexOf(stTag), 1);
        }

    //Accion para agregar Tags a la lista
        $("#tags_box_form_crearartButton").click(function () {

            var tag = $("#tags_box_form_crearart").val().trim().toUpperCase().replace(/\s/g, '');

            if ($("#tags_box_form_crearart").hasClass("is-invalid")) {
                $("#tags_box_form_crearart").removeClass('is-invalid');
            }

            if (tag.length == 0 || tag.length > 51) {  //Se valida campo del titulo de articulo
                $("#tag-invalid-form").empty();
                $("#tag-invalid-form").append("Agregar un tag entre 1 y 50 caracteres");
                $("#tags_box_form_crearart").addClass('is-invalid');

            } else {

                if (tags.indexOf(tag.toString()) >= 0) {
                    $("#tag-invalid-form").empty();
                    $("#tag-invalid-form").append("El tag ya esta registrado.");
                    $("#tags_box_form_crearart").addClass('is-invalid');
                }else{

                    tags.push(tag);
                    $("#tagcontainer_box_form_crearart").append("<button type='button' id=idTag" + tag + " class='btn btn-info' style='margin:0.2rem;' onclick='borrarTag(\"" + tag.toString() + "\");'>" + tag + "</button>");
                    $('#tags_box_form_crearart').val("");
                }
            }
            
        });

        //Cargar imagen
        $("#submit-img-form-crearart").click(function () {

            var fd = new FormData();
            var files = $('#img-form-crearart')[0].files[0];
            fd.append('file', files);

            if (files != null) {

                $.ajax({
                    type: 'POST',
                    url: 'fileUploader.ashx',
                    data: fd,
                    success: function (status) {
                        console.log('img' + status);
                        if (status != 'error') {
                            swal("Imagen cargada en " + status, {
                                icon: "success",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            });
                        } else {
                            swal("Error al subir imagen.", {
                                icon: "error",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            });
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function () {
                        swal("Error al subir imagen.", {
                            icon: "error",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        });
                    }
                });

            } else {
                var cursorPosition = $('#editor1').prop("selectionStart");
                console.log(cursorPosition);
                console.log("No hay archivo");
                $('#exampleModalCenter').modal('show');
                //exampleModal
            }
        });

        /*********** JS init
        *********************/
        $("input[value='cat']").remove();
        initCategorias(0);

        function cargarGrupos() {
            $.ajax({
                type: "POST",
                url: "CrearArticulo.aspx/consultarGruposxUsuario",
                //data: "{ 'idUsuario': " + 1 + " }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var opts = $.parseJSON(data.d);
                    $.each(opts, function (i, d) {
                        $("#Grupos-form-crearart").append('<div class="form-check">' +
                            '<input class="form-check-input" type="checkbox" id="gridCheck1" value='+ d[0] +'>' +
                            '<label class="form-check-label" for="gridCheck1">' +
                                d[1] +
                            '</label></div>');
                    });
                }
            });
        }

        cargarGrupos();
 
    </script>

</asp:Content>