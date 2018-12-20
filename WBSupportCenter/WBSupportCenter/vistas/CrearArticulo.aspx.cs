using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace WBSupportCenter.vistas
{
    public partial class CrearArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string OnSubmit()
        {
            return "it worked";
        }

        [WebMethod]
        public static string registrarArticulo(string nombreArticulo, string contenido)
        {
            System.Diagnostics.Debug.WriteLine(contenido);
            return "it worked";
        }

    }
}