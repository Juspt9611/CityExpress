using Newtonsoft.Json;
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
        public static string articulosxValidar()
        {
            String daresult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            daresult = DataSetToJSON(metodo.WSOpconsultarArtxValidar().Tables[0]);
            return daresult;
        }

        public static string DataSetToJSON(DataTable dt)
        {
             return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }
    }
}