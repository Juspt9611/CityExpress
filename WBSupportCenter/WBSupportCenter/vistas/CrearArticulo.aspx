﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="CrearArticulo.aspx.cs" Inherits="WBSupportCenter.vistas.CrearArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../scripts/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">

            <div class="box_table_container">
                <div class="row">
                    <span class="box_table_title" style="margin-bottom: 1rem;">Crear artículo</span>
                </div>
                <div class="row">
                    <form>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre_box_form_crearart" class="col-form-label">Título del artículo:</label>
                                <input id="nombre_box_form_crearart" type="text" class="form-control" />
                                <div class="invalid-feedback">
                                    Agregar un título entre 1 y 100 caracteres.
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
                    <div class="col-lg-6 align-self-center">
                        <div id="tagcontainer_box_form_crearart"></div>
                    </div>
                </div>
                <div class="form-group row" style="margin-bottom: 1em;">
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
                        <button id="submit-multimedia-form-crearart" type="button" class="btn btn-success" data-izimodal-open="#modal" data-izimodal-transitionin="fadeInDown" onclick="limpiamodal()"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp Agregar archivo multimedia</button>
                    </div>
                </div>
                <form method="post">
                    <textarea name="editor1" id="editor1"></textarea>
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
                        <button id="submit" type="button" class="btn btn-success float-right"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp Guardar</button>
                        <button type="button" class="btn btn-danger float-right" onclick="cancelarArticulo()"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp Cancelar</button>
                    </div>
                </div>
            </div>

        </div>

    </form>
    <!-- Modal carga de multimedia -->
    <div id="modal">
        <!-- Modal content -->
        <div>
            <div class="container">
                <div class="row">
                    <span class="box_table_title title-multimedia">Cargar archivo multimedia</span>
                </div>
                <div class="row">
                    <div id="box-contenido-blog" class="contenido-multimedia">
                        <div class="row">
                            <span class="box_table_title-multimedia">Seleccionar ubicación del archivo multimedia</span>
                            <div class="tabs">
                              <a href="javascript:void(0)" onclick="multimediaTab(1)" id="tab-multimedia-1" class="tab">Local</a>
                              <div class="content" id="source-multimedia-1">
                                    <div class="input-group">
                                        <input type="file" class="form-control-file" id="img-form-crearart" style="width: 80%;">
                                        <div class="input-group-prepend">
                                            <button id="submit-img-form-crearart" type="button" class="btn btn-success" onclick="carga()"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                              </div>
  
                              <a href="javascript:void(0)" onclick="multimediaTab(2)" id="tab-multimedia-2" class="tab">URL</a>
                              <div class="content" id="source-multimedia-2">
                                <label for="img-form-crearart">URL: </label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="url-form-crearart">
                                </div>
                              </div>
                            </div>
                        </div>
                        <div class="row">
                            <span id="msnError-multimedia"></span>
                        </div>
                        <br />
                        <div class="row">
                            <span class="box_table_title-multimedia">Seleccionar tipo de archivo multimedia</span>
                            <div class="radio-multimedia-content">
                                <div class="form-check form-check-inline">
                                  <input class="form-check-input" type="radio" id="media-radio-img" value="1" name="tipo" checked="checked">
                                  <label class="form-check-label" for="inlineCheckbox1">Imagen</label>
                                </div>
                                <div class="form-check form-check-inline">
                                  <input class="form-check-input" type="radio" id="media-radio-video" value="2" name="tipo" >
                                  <label class="form-check-label" for="inlineCheckbox2">Video</label>
                                </div>
                                <div class="form-check form-check-inline">
                                  <input class="form-check-input" type="radio" id="media-radio-audio" value="3" name="tipo" >
                                  <label class="form-check-label" for="inlineCheckbox2">Audio</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                                <span class="box_table_title-multimedia">Ingresar dimensiones (%)</span>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="nombre_box_form_crearart" class="col-form-label">Ancho:</label>
                                        <input id="ancho-media-form-crearart" type="number" class="form-control" min="5" max="100" value="50"/>
                                        <div class="invalid-feedback">
                                            El valor no puede ser menor a 5 o mayor a 100.
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="nombre_box_form_crearart" class="col-form-label">Alto:</label>
                                        <input id="alto-media-form-crearart" type="number" class="form-control" min="5" max="100" value="50"/>
                                        <div class="invalid-feedback">
                                            El valor no puede ser menor a 5 o mayor a 100.
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div id="box-Botones-blog" class="col-lg-12 box_table_buttons">
                        <button type="button" class="btn btn-success float-right" onclick="cargaImagen()"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp Agregar</button>
                        <button type="button" class="btn btn-danger float-right" onclick="" data-izimodal-close="" data-izimodal-transitionout="bounceOutDown"><i class="fa fa-times" aria-hidden="true"></i>&nbsp Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        var cat = [];
        var tags = [];
        var urlLocal;

        function cancelarArticulo() {
            swal({
                    title: "¿Salir de la ventana de edición?",
                    text: "Se perderan los cambios realizados.",
                    icon: "warning",
                    closeOnClickOutside: false,
                    buttons: {
                        cancel: {
                            text: "Cancelar",
                            value: null,
                            visible: !0,
                            className: "btn btn-default",
                            closeModal: !0
                        },
                        confirm: {
                            text: "Salir",
                            value: !0,
                            visible: !0,
                            className: "btn btn-info",
                            closeModal: !0
                        }
                    }
                }).then((willDelete) => {
                    $(".swal-button swal-button--confirm btn btn-info").click(function () {
                        $(".swal-button swal-button--confirm btn btn-info").attr("disabled", true);
                    })
                    if (willDelete) {
                        window.location.href = 'ArticulosRed.aspx';
                    } else {
                        $(".swal-button swal-button--confirm btn btn-info").attr("disabled", false);
                    }
                });
        }

        var isValidUrl = function(string){
            try {
                new URL(string);
                return true;
            } catch (_) {
                return false;
            }
        }

        //Genera la cadena multimedia para ser agregada en la instancia de CKEditor
        function cadengaGenerada() {

            var cadena = '';
            var tipo = $("input[name='tipo']:checked").val();
            //console.log(tipo);
            switch (tipo) {
                case '1':
                    cadena = "<img src=" + urlLocal + " alt='' style='height:" + $("#alto-media-form-crearart").val() + "%; width:" + $("#ancho-media-form-crearart").val() + "%'/>";
                    break;
                case '2':
                    cadena = "<video width='" + $("#ancho-media-form-crearart").val() + "%' height='" + $("#alto-media-form-crearart").val() + "%' controls><source src=" + urlLocal + " >Este navegador no soporta el elemento de video.</video>";
                    break;
                case '3':
                    cadena = "<audio controls><source src=" + urlLocal +">Este navegador no soporta el elemento de audio.</audio>";
                    break;
                default:
                    console.log("Default");
            }
            //console.log(cadena);
            return cadena;

        }
        //Valida los campos del formulario de carga de multimedia
        function cargaImagen() {
            var verifica = 0;
            $("#msnError-multimedia").empty();

            if ($("#tab-multimedia-1").hasClass("activo")) {
                //Se va a cargar una imagen de local
                if (urlLocal == undefined) {
                    $("#msnError-multimedia").append("<i class='fa fa-times' aria-hidden='true'></i> Agregar un archivo.").addClass("error-media");
                    verifica = 1;
                } else {
                    if (urlLocal.length > 5) {

                        if ($("input[name='tipo']:checked").val() == undefined) {
                            verifica = 1;
                        } else {
                            //Se carga una imagen de local
                            var imgHtml = CKEDITOR.dom.element.createFromHtml(cadengaGenerada());
                            CKEDITOR.instances.editor1.insertElement(imgHtml);
                            urlLocal = '';
                            $('#modal').iziModal('close');
                        }

                    } else {
                        $("#msnError-multimedia").append("<i class='fa fa-times' aria-hidden='true'></i> Agregar un archivo.").addClass("error-media");
                        verifica = 1;
                    }
                }

            } else {
                //Se carga una imagen de URL
                if (isValidUrl($("#url-form-crearart").val())) {
                    urlLocal = $("#url-form-crearart").val();

                    var imgHtml = CKEDITOR.dom.element.createFromHtml(cadengaGenerada());
                    CKEDITOR.instances.editor1.insertElement(imgHtml);
                    urlLocal = '';
                    $('#modal').iziModal('close');
                    
                } else {
                    $("#msnError-multimedia").append("<i class='fa fa-times' aria-hidden='true'></i> Ingresar una url valida.").addClass("error-media");
                    verifica = 1;
                }
            }

        }

        //Velifica el tab de carga local o por url
        function multimediaTab(tipo) {
            $("#msnError-multimedia").empty();
            $("#tab-multimedia-1").removeClass("activo");
            $("#tab-multimedia-2").removeClass("activo");
            $("#source-multimedia-1").hide();
            $("#source-multimedia-2").hide();
            $("#source-multimedia-" + tipo).show();
            $("#tab-multimedia-" + tipo).addClass("activo");
        }

        /********** JS functions 
        ************************/

        //Cargar categorias a select
        function initCategorias(idPAdreCat) {

            $("#cat_box_form_crearart").empty();
            if (idPAdreCat == 0) {
                $("#cat_box_form_crearart").append('<option id="invalidOption" value="cat">Selecciona una categoría</option>');
            } else {
                $("#cat_box_form_crearart").append('<option id="invalidOption" value="cat">Selecciona una subcategoría</option>');
            }
            
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

            if (tituloArt.length == 0 || tituloArt.length > 100) {  //Se valida campo del titulo de articulo

                $("#nombre_box_form_crearart").addClass('is-invalid');
                $('#nombre_box_form_crearart').focus();
                $('html,body').scrollTop(0);

            } else if (cat.length == 0) {   // Se valida que se haya ingresado una cetegoria
                $("#cat_box_form_crearart").addClass('is-invalid');
                $('html,body').scrollTop(0);

            } else if (i == 0) {
                $("#inGrupos-form-crearart").addClass('is-invalid');
                $('#inGrupos-form-crearart').focus();
                $('html,body').scrollTop(200);
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
                        $('input[type=checkbox]').prop('checked', false);
                        $('#nombre_box_form_crearart').val("");
                        cat.length = 0;
                        initCategorias(0);
                        $("#catSpan_box_form_crearart").empty();
                        tags.length = 0;
                        $('#tags_box_form_crearart').val("");
                        $('#tagcontainer_box_form_crearart').empty();
                        CKEDITOR.instances.editor1.setData("<p>Ingresar contenido.</p>");

                        if (response.d == 0) {
                            swal("Aritículo registrado", {
                                icon: "success",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            });
                            $(".swal-button").click(function () {
                                //closeSite();
                                window.location.href = 'ArticulosRed.aspx';
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

            if (cat.indexOf(id.toString()) == 0) {
                initCategorias(0);
            } else {
                initCategorias(cat[cat.indexOf(id.toString()) - 1]);
            }

            for (i = 0; i < (cat.length - cat.indexOf(id.toString())); i++) {
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
                } else {

                    tags.push(tag);
                    $("#tagcontainer_box_form_crearart").append("<button type='button' id=idTag" + tag + " class='btn btn-info' style='margin:0.2rem;' onclick='borrarTag(\"" + tag.toString() + "\");'>" + tag + "</button>");
                    $('#tags_box_form_crearart').val("");
                }
            }

        });

        //Cargar de archivos multimedia
        function cargarArchivos(archivo) {
            var url = window.location.href;
            urlLocal = '';
            $.ajax({
                type: 'POST',
                url: 'fileUploader.ashx',
                data: archivo,
                success: function (status) {
                    //console.log(status);
                    if (status == 'error') {
                        $("#msnError-multimedia").append("<i class='fa fa-times' aria-hidden='true'></i> Error al subir el archivo.").addClass("error-media");
                        setTimeout(function () {
                            swal("Error al subir el archivo", {
                                icon: "error",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            })
                        }, 3000);
                    } else if (status == 'invalido') {
                        $("#msnError-multimedia").append("<i class='fa fa-times' aria-hidden='true'></i> Este tipo de archivo no es valido.").addClass("error-media");
                        setTimeout(function () {
                            swal("Tipo de archivo invalido", {
                                icon: "error",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            })
                        }, 3000);
                    } else {
                        $("#msnError-multimedia").append("<i class='fa fa-check' aria-hidden='true'></i> Archivo cargado exitosamente.").addClass("ok-media");
                        urlLocal = '../imgBlog/' + status; // url.substring(0, url.indexOf('/vistas')) + '/WBSupportCenter/imgBlog/' + status;
                        setTimeout(function () {
                            swal("Archivo cargado exitosamente", {
                                icon: "success",
                                allowOutsideClick: false,
                                closeOnClickOutside: false
                            })
                        }, 3000);
                    }
                },
                processData: false,
                contentType: false,
                error: function () {
                    setTimeout(function () {
                        swal("Error al subir archivo.", {
                            icon: "error",
                            allowOutsideClick: false,
                            closeOnClickOutside: false
                        })
                    }, 3000);
                }
            });
        }

        function carga() {
            $("#msnError-multimedia").empty();

            var slider = document.createElement("div");
            $(slider).addClass("loader").append("<div class='loader__bar'></div><div class='loader__bar'></div><div class='loader__bar'></div><div class='loader__bar'></div><div class='loader__bar'></div><div class='loader__ball'></div>Cargando...");

            var fd = new FormData();
            var files = $('#img-form-crearart')[0].files[0];
            fd.append('file', files);

            if (files != null) {

                swal({
                    closeOnClickOutside: false,
                    content: slider,
                    button: false
                });

                cargarArchivos(fd);

            } else {
                $("#msnError-multimedia").append("<i class='fa fa-times' aria-hidden='true'></i> Agregar un archivo.").addClass("error-media");
            }

        }

        /*********** JS init
        *********************/
        $("input[value='cat']").remove();
        initCategorias(0);

        limpiamodal();
        //Se inicializa modal de multimedia
        function limpiamodal() {
            multimediaTab(1);
            $('#img-form-crearart').val(null);
            urlLocal = '';
        }

        $("#modal").iziModal({
            width: '80%'
        });

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
                            '<input class="form-check-input" type="checkbox" id="gridCheck1" value=' + d[0] + '>' +
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
