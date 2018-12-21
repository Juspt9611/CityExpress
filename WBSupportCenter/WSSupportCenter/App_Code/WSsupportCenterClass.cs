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

}

