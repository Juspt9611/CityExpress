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
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataSet ds = new DataSet();
            string idArt = "";
            string tituloArt = "";
            string contenido = "";
            int estatus = 0;
            string categorias = "";
            string tags = "";
            string grupos = "";
            string contenidoNormal = "";

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
                        Response.Redirect("../default.aspx");
                    }
                    else
                    {
                        idArt = Request["idArticulo"];
                        ds = metodo.WSConsultarArtEdicion(Convert.ToInt32(idArt));

                        tituloArt = (string)ds.Tables[0].Rows[0][0];
                        contenidoNormal = (string)ds.Tables[0].Rows[0][1];
                        contenido = (string)ds.Tables[0].Rows[0][2];
                        estatus = (Int32)ds.Tables[0].Rows[0][3];
                        categorias = JsonConvert.SerializeObject(ds.Tables[1].AsEnumerable().Select(r => r.ItemArray));
                        tags = JsonConvert.SerializeObject(ds.Tables[2].AsEnumerable().Select(r => r.ItemArray));
                        grupos = JsonConvert.SerializeObject(ds.Tables[3].AsEnumerable().Select(r => r.ItemArray));

                        this.hiddenTituloArt.Value = tituloArt;
                        this.hiddenContenido.Value = contenido;
                        this.hiddenCategorias.Value = categorias;
                        this.hiddenTags.Value = tags;
                        this.hiddenGrupos.Value = grupos;
                        this.hiddenEstatus.Value = estatus.ToString();
                        this.hiddenContenidoNormal.Value = contenidoNormal;
                    }
                }
                catch (Exception exp)
                {
                    Session.Clear();
                    Response.Redirect("../default.aspx");
                }

                return;
            }

            idArt = Request["idArticulo"];
            ds = metodo.WSConsultarArtEdicion(Convert.ToInt32(idArt));

            tituloArt = (string)ds.Tables[0].Rows[0][0];
            contenidoNormal = (string)ds.Tables[0].Rows[0][1];
            contenido = (string)ds.Tables[0].Rows[0][2];
            estatus = (Int32)ds.Tables[0].Rows[0][3];
            categorias = JsonConvert.SerializeObject(ds.Tables[1].AsEnumerable().Select(r => r.ItemArray));
            tags = JsonConvert.SerializeObject(ds.Tables[2].AsEnumerable().Select(r => r.ItemArray));
            grupos = JsonConvert.SerializeObject(ds.Tables[3].AsEnumerable().Select(r => r.ItemArray));

            this.hiddenTituloArt.Value = tituloArt;
            this.hiddenContenido.Value = contenido;
            this.hiddenCategorias.Value = categorias;
            this.hiddenTags.Value = tags;
            this.hiddenGrupos.Value = grupos;
            this.hiddenEstatus.Value = estatus.ToString();
            this.hiddenContenidoNormal.Value = contenidoNormal;

        }

        [WebMethod]
        public static int editarArticulo(int idArticulo, string nombreArticulo, string contenido, string categorias, string tags, string grupos)
        {
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSEditarArt(idArticulo, nombreArticulo, contenido, categorias, tags, grupos, idUsuario);
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