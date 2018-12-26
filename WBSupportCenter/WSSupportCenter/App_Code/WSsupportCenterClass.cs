using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using SupportCenter.Negocio;
using SupportCenter.Entidades;
using System.Web.Script.Services;

[System.Web.Script.Services.ScriptService]

public class WSsupportCenterClass : System.Web.Services.WebService {
    
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

    #region Articulos

        //Registrar articulo
        [WebMethod]
        public int WSOpregistrarArt(string nombreArticulo, string contenido, string categorias)
        {
            NGArticulos Articulos = new NGArticulos();
            return Articulos.NG_RegistrarArt(nombreArticulo, contenido, categorias);
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

    #endregion
}

