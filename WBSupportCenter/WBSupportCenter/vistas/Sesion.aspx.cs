﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;

namespace WBSupportCenter.vistas {
    public partial class Sesion : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack)
            {
                CerrarSesion();
            }
        }

        protected void Button1_Click(object sender, EventArgs e) {

            Session["Autenticacion"] = "false";

            LDAPA AutetiDA = new LDAPA();

            bool result = AutetiDA.autenticado("", Usuario.Text.Trim(), contrasena.Text.Trim());

            if (result != false)
            {

                ArrayList listaPropiedades = AutetiDA.getListaPropiedades();
                WSsupportCenterClass metodo = new WSsupportCenterClass();

                DataSet rol = metodo.WSOptenRol(listaPropiedades[3].ToString());

                foreach (DataTable table in rol.Tables)
                    if (table.Rows.Count != 0)
                    {

                        DataTable tblRol = rol.Tables[0];
                        string idUsuario = "";
                        string idRol = "";
                        string nomRol = "";

                        foreach (DataRow item in tblRol.Rows)
                        {
                            idUsuario = item["idUsuario"].ToString();
                            idRol = item["idRol"].ToString();
                            nomRol = item["nombreRol"].ToString();
                        }

                        Session["Autenticacion"] = "true";
                        Session["nombres"] = listaPropiedades[1];
                        Session["Apellidos"] = listaPropiedades[2];
                        Session["usuario"] = listaPropiedades[3];
                        Session["idRol"] = idRol;
                        Session["nomRol"] = nomRol;
                        Session["idUsuario"] = idUsuario;
                        Session["pass"] = contrasena.Text;
                        
                        Usuario.Text = "";
                        contrasena.Text = "";
                               
                        Response.Redirect("index.aspx");

                    }
                    else
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "swal('¡Lo sentimos!', 'Por favor verifica tus accesos o contacta a tu coordinador', 'error')", true);
                    }



            }
            else
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "swal('¡Lo sentimos!', 'Por favor verifica tus accesos o contacta a tu coordinador', 'error')", true);

            }
        }

        public static void CerrarSesion()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }


    }
}