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
    public DataSet WSConsultarArticuloxId(int idArt, int idUsuarioConsulta)
    {
        return Busqueda.NG_ConsultaArticuloxId(idArt, idUsuarioConsulta);
    }

    [WebMethod]
    public DataSet WSBusquedaArticulosxClick(string palabra)
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

    [WebMethod]
    public int WSRegistrarCategoria(string nombreCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_RegistrarCategoria(nombreCategoria);
    }

    [WebMethod]
    public int WSRegistrarSubcategoria(int idPadre, string nombreCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_RegistrarSubCategoria(idPadre, nombreCategoria);
    }

    [WebMethod]
    public int WSEditarCategorias(int idCat, string nombreCategoria)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_EditarCategorias(idCat, nombreCategoria);
    }

    [WebMethod]
    public List<CategoriasxSubcategorias> WSEliminarCategorias(int idCat)
    {
        NGCategorias Categorias = new NGCategorias();
        return Categorias.NG_EliminarCategorias(idCat);
    }

    [WebMethod]
    public List<CategoriasxSubcategorias> WSConsultarCategoriasSub()
    {
        NGCategorias categorias = new NGCategorias();
        return categorias.NG_ConsultarCategorias();
    }

    [WebMethod]
    public List<CategoriasxSubcategorias> WSConsultarSubcategorias(int idCat)
    {
        NGCategorias categorias = new NGCategorias();
        return categorias.NG_ConsultarSubcategorias(idCat);
    }


    #endregion


    #region Reporte
    [WebMethod]
    public List<Reporte> WSObtenerArticulo(string fechaInicial, string fechaFinal, string valReporte, string valTop)
    {
        NGReporte ObjetoNG = new NGReporte();

        return ObjetoNG.NGConsultaReportes(fechaInicial, fechaFinal, valReporte, valTop);
    }
    #endregion

    #region Historial

    [WebMethod]
    public List<Historial> WSConsultarHistorialArticulo(int idArt)
    {
        NGHistorial Historial = new NGHistorial();
        return Historial.NG_ConsultarHistorialArticulo(idArt);
    }

    #endregion
}

