using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;
using Newtonsoft.Json;
using System.Web.Services;

namespace WBSupportCenter.vistas
{
    public partial class EditarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                try
                {
                    string usuariosValidos = "Administrador,Redactor";
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

            string idArt = Request["idArticulo"];
            System.Diagnostics.Debug.WriteLine("VALOR: " + idArt);

            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataSet ds = new DataSet();
            ds = metodo.WSConsultarArtEdicion(Convert.ToInt32(idArt));

            string tituloArt = (string)ds.Tables[0].Rows[0][0];
            string contenido = (string)ds.Tables[0].Rows[0][2];
            int estatus = (Int32)ds.Tables[0].Rows[0][3];
            string categorias = JsonConvert.SerializeObject(ds.Tables[1].AsEnumerable().Select(r => r.ItemArray));
            string tags = JsonConvert.SerializeObject(ds.Tables[2].AsEnumerable().Select(r => r.ItemArray));
            string grupos = JsonConvert.SerializeObject(ds.Tables[3].AsEnumerable().Select(r => r.ItemArray));

            this.hiddenTituloArt.Value = tituloArt;
            this.hiddenContenido.Value = contenido;
            this.hiddenCategorias.Value = categorias;
            this.hiddenTags.Value = tags;
            this.hiddenGrupos.Value = grupos;
            this.hiddenEstatus.Value = estatus.ToString();

        }

        [WebMethod]
        public static int editarArticulo(int idArticulo, string nombreArticulo, string contenido, string categorias, string tags, string grupos)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSEditarArt(idArticulo, nombreArticulo, contenido, categorias, tags, grupos);
        }

        [WebMethod]
        public static string consultarCat(int idPadreCat)
        {
            string dataResult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            dataResult = DataSetToJSON(metodo.WSConsultarCategorias(idPadreCat).Tables[0]);
            return dataResult;
        }

        public static string DataSetToJSON(DataTable dt)
        {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }
    }
}