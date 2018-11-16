using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using SupportCenter.Negocio;
using SupportCenter.Entidades;



[System.Web.Script.Services.ScriptService]

public class WSsupportCenterClass : System.Web.Services.WebService {
    
    readonly  UsuarioNegocio Negocio = new UsuarioNegocio();

    [WebMethod]
    public List<UsuarioEntidades>  dataMenu(int idrol) {

        return Negocio.DataUsuario();

    }


}

