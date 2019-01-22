using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using WBSupportCenter.WSsupport1;
using System.Data;
using Newtonsoft.Json;


namespace WBSupportCenter.vistas {
    public partial class articulosVistos : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack)
            {
                try
                {
                    string auth = HttpContext.Current.Session["Autenticacion"].ToString();
                    string nombreRol = HttpContext.Current.Session["nomRol"].ToString();
                    if (auth.Equals("false") || nombreRol != "Autorizador")
                    {
                        Response.Redirect("sesion.aspx");
                    }
                }
                catch (Exception exp)
                {
                    Response.Redirect("sesion.aspx");
                }

                return;
            }
        }

        [WebMethod]
        public static String consultarArticuloAprobar() {
            String daresult = "";
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            daresult = DataSetToJSON(metodo.WSConsultarArtPorValidar(idUsuario).Tables[0]);
            return daresult;
        }

        [WebMethod]
        public static String guardarEstatusArticuloAprobar(int idArticulo, int estatus, String comentario) {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSOguardarEstatusArticuloAprobar(idArticulo, estatus, comentario);
        }

        public static string DataSetToJSON(DataTable dt) {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }
    }
}