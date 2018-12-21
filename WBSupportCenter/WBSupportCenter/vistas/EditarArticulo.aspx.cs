using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WBSupportCenter.vistas
{
    public partial class EditarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var us = Request["idArticulo"];
            System.Diagnostics.Debug.WriteLine("VALOR: " + us);
        }
    }
}