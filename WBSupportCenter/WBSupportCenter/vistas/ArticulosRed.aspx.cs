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
            if (!Page.IsPostBack)
            {
                try
                {
                    string usuariosValidos = "Administrador,Redactor, Autorizador";
                    string auth = HttpContext.Current.Session["Autenticacion"].ToString();
                    string nombreRol = HttpContext.Current.Session["nomRol"].ToString();
                    if (auth.Equals("false") || (usuariosValidos.IndexOf(nombreRol) < 0))
                    {
                        Session.Clear();
                        Response.Redirect("sesion.aspx");
                    }
                }
                catch (Exception exp)
                {
                    Session.Clear();
                    Response.Redirect("sesion.aspx");
                }

                return;
            }
        }

        [WebMethod]
        public static string articulosxValidar()
        {
            String daresult = "";
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            daresult = DataSetToJSON(metodo.WSOpconsultarArtxValidar(idUsuario).Tables[0]);
            return daresult;
        }

        public static string DataSetToJSON(DataTable dt)
        {
             return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }
    }
}