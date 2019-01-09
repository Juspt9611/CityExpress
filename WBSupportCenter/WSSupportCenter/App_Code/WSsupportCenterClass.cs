using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using SupportCenter.Negocio;
using SupportCenter.Entidades;
using System.Web.Script.Services;

[System.Web.Script.Services.ScriptService]

public class WSsupportCenterClass : System.Web.Services.WebService {

    #region Busqueda

    readonly NGBusqueda Busqueda = new NGBusqueda();

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Articulos> WSOptenerArt() {
        return Busqueda.NG_ObtenerArt();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<CategoriasxSubcategorias> WSOptenerCatg() {

        return Busqueda.NG_ObtenerCatg();
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<BusquedaTitulo> WSBusquedaTitulo(string palabra) {

        return Busqueda.NG_BusquedaTitulo(palabra);
    }

    [WebMethod]
    public List<Articulos> WSConsultarArticuloxId(int idArt)
    {
        return Busqueda.NG_ConsultaArticuloxId(idArt);
    }

    [WebMethod]
    public List<Articulos> WSBusquedaArticulosxClick(string palabra)
    {
        return Busqueda.NG_BusquedaArticulosxClick(palabra);
    }

    [WebMethod]
    public int WSGuardarPalabraBuscada(string palabra)
    {
        return Busqueda.NG_GuardarPalabraBuscada(palabra);
    }

    [WebMethod]
    public DataSet WSBuscarArtMasVistor(int top)
    {
        return Busqueda.NG_BuscarArtMasVistos(top);
    }

    [WebMethod]
    public int WSregistrarVisita(int idUsuario, int idArticulo)
    {
        return Busqueda.NG_RegistrarVisita(idUsuario, idArticulo);
    }

    [WebMethod]
    public DataSet WSconsultarComentariosxArt(int idArticulo)
    {
        return Busqueda.NG_ConsultarComentariosxArt(idArticulo);
    }

    [WebMethod]
    public int WSregistrarValoracionxArticulo(int estrellas, int idArticulo, string comentario, int idUsuario)
    {
        return Busqueda.NG_RegistraValoracionxArticulo(estrellas, idArticulo, comentario, idUsuario);
    }

    #endregion 

    #region Articulos

    //Registrar articulo
    [WebMethod]
    public int WSOpregistrarArt(string nombreArticulo, string contenido, string categorias, string tags, string grupos)
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_RegistrarArt(nombreArticulo, contenido, categorias, tags, grupos);
    }
    //Consultar articulos por validar
    [WebMethod]
    public DataSet WSOpconsultarArtxValidar()
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_ConsultarArtxValidar();
    }
    //Consultar articulos para edicion
    [WebMethod]
    public DataSet WSConsultarArtEdicion(int idArt)
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_ConsultarArtEdicion(idArt);
    }

    //Consulta categorías
    [WebMethod]
    public DataSet WSConsultarCategorias(int idPadreCat)
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_ConsultarCategorias(idPadreCat);
    }

    //EditarArticulo 
    [WebMethod]
    public int WSEditarArt(int idArticulo, string nombreArticulo, string contenido, string categorias, string tags, string grupos)
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_EditarArt(idArticulo, nombreArticulo, contenido, categorias, tags, grupos);
    }

    //Consultar articulos por validar
    [WebMethod]
    public DataSet WSConsultarArtPorValidar()
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_ConsultarArtPorValidar();
    }

    //Registrar estatus articulo aprobado
    [WebMethod]
    public String WSOguardarEstatusArticuloAprobar(int idArticulo, int estatus, String comentario)
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_guardarEstatusArticuloAprobar(idArticulo, estatus, comentario);
    }

    [WebMethod]
    public DataSet WSConsultarGruposxUsuario(int idUsuario)
    {
        NGArticulos Articulos = new NGArticulos();
        return Articulos.NG_ConsultarGruposxUsuario(idUsuario);
    }

    #endregion

    #region Categorias

    //Consultar las categorias
    [WebMethod]
    public List<CategoriasxSubcategorias> WSconsultarCategorias()
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_consultarCategorias();
    }

    //Consultar las categorias
    [WebMethod]
    public List<CategoriasxSubcategorias> WSgetSinHijos()
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_getSinHijos();
    }

    //Consultar las categorias
    [WebMethod]
    public List<CategoriasxSubcategorias> WSgetSinPadres(int idPadre)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_getSinPadres(idPadre);
    }

    //Consultar las categorias
    [WebMethod]
    public List<CategoriasxSubcategorias> WSgetSize(int idCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_getSize(idCategoria);
    }

    //Consultar las categorias
    [WebMethod]
    public List<CategoriasxSubcategorias> WSgetList(int idCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_getList(idCategoria);
    }

    //Guardar las categorias
    [WebMethod]
    public String WSguardarCategorias(String nombreCategoria, String descripcion)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_guardarCategorias(nombreCategoria, descripcion);
    }

    //Guardar las categorias
    [WebMethod]
    public String WSguardarCategoriasEdit(String nombreCategoria, String descripcion, int idCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_guardarCategoriasEdit(nombreCategoria, descripcion, idCategoria);
    }

    //Guardar las categorias
    [WebMethod]
    public String WSguardarRelacion(String nombreCategoria, int idCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_guardarRelacion(nombreCategoria, idCategoria);
    }


    //Eliminar las categorias
    [WebMethod]
    public String WSeliminarCategorias(int idCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_eliminarCategorias(idCategoria);
    }

    #endregion


    #region Reporte
    [WebMethod]
    public List<Reporte> WSObtenerArticulo(string fechaInicial, string fechaFinal, string valReporte)
    {
        NGReporte ObjetoNG = new NGReporte();

        return ObjetoNG.NGConsultaReportes(fechaInicial, fechaFinal, valReporte);
    }
    #endregion
}

