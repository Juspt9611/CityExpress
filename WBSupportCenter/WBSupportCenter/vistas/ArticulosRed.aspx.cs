using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;

namespace WBSupportCenter.vistas
{
    public partial class ArticulosRed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static DataTable articulosxValidar()
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.HelloWorldDataSet();
        }
    }
}