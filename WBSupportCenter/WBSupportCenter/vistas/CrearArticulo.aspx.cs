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

namespace WBSupportCenter.vistas
{
    public partial class CrearArticulo : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                try
                {
                    string usuariosValidos = "Administrador,Redactor,Autorizador";
                    string auth = HttpContext.Current.Session["Autenticacion"].ToString();
                    string nombreRol = HttpContext.Current.Session["nomRol"].ToString();
                    if (auth.Equals("false") || (usuariosValidos.IndexOf(nombreRol) < 0))
                    {
                        Session.Clear();
                        Response.Redirect("../default.aspx");
                    }
                }
                catch (Exception exp)
                {
                    Session.Clear();
                    Response.Redirect("../default.aspx");
                }

                return;
            }

        }

        [WebMethod]
        public static int registrarArticulo(string nombreArticulo, string contenido, string categorias, string tags, string grupos)
        {
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSOpregistrarArt(nombreArticulo, contenido, categorias, tags, grupos, idUsuario);
        }

        [WebMethod]
        public static string consultarCat(int idPadreCat)
        {
            string dataResult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            dataResult = DataSetToJSON(metodo.WSConsultarCategorias(idPadreCat).Tables[0]);
            return dataResult;
        }

        [WebMethod]
        public static string consultarGruposxUsuario()
        {
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            string dataResult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            dataResult = DataSetToJSON(metodo.WSConsultarGruposxUsuario(idUsuario).Tables[0]);
            return dataResult;
        }

        public static string DataSetToJSON(DataTable dt)
        {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }

    }
}