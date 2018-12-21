using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;

namespace WBSupportCenter.vistas
{
    public partial class EditarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idArt = Request["idArticulo"];
            System.Diagnostics.Debug.WriteLine("VALOR: " + idArt);

            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataSet ds = new DataSet();
            ds = metodo.WSConsultarArtEdicion(Convert.ToInt32(idArt));

            string tituloArt = (string)ds.Tables[0].Rows[0][0];
            string contenido = (string)ds.Tables[0].Rows[0][2];

            this.hiddenTituloArt.Value = tituloArt;
            this.hiddenContenido.Value = contenido;
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(),"Server Time", "javascript:cargarContenido('" + tituloArt + "','" + contenido + "');", true);

        }
    }
}