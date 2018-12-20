using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using SupportCenter.Negocio;
using SupportCenter.Entidades;



[System.Web.Script.Services.ScriptService]

public class WSsupportCenterClass : System.Web.Services.WebService {
    
    readonly NGBusqueda Busqueda = new NGBusqueda();

    [WebMethod]
    public DataTable WSOptenerArt() {
        return Busqueda.NG_ObtenerArt();
    }

    [WebMethod]
    public DataTable WSOptenerCatg() {

        return Busqueda.NG_ObtenerCatg();
    }


}

