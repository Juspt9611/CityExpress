using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using WBSupportCenter.WSsupport1;

namespace WBSupportCenter.vistas
{
    public partial class CrearArticulo : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static int registrarArticulo(string nombreArticulo, string contenido, int[] categorias)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSOpregistrarArt(nombreArticulo, contenido, categorias);
        }

    }
}