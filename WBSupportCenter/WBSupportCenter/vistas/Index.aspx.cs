using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;
using Newtonsoft.Json;
using System.Text;

namespace SupportCenter {
    public partial class Index : System.Web.UI.Page {
        static WSsupportCenterClass metodo = new WSsupportCenterClass();

        protected void Page_Load(object sender, EventArgs e) {

            if (!Page.IsPostBack)
            {
                try
                {
                    string auth = HttpContext.Current.Session["Autenticacion"].ToString();
                    if (auth.Equals("false"))
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

            OptenerArt();
            OptenerCatg();
        }


        public void OptenerArt() {
            DataTable tblArti = new DataTable();
            lstArt.InnerText = "";

            tblArti = ConvertToDataTable(metodo.WSOptenerArt());
            //ejemplo = metodo.WSOptenerArt();
            lstArt.InnerHtml += "<ul>";
            //Forech para ver Articulos

            foreach (DataRow item in tblArti.Rows) {
                lstArt.InnerHtml += "<li>";
                lstArt.InnerHtml += "<a href='#' class='d-flex flex-row align-items-start justify-content-start'>";
                lstArt.InnerHtml += "<div class='sidebar_dot d-flex flex-row align-items-center justify-content-start'>";
                lstArt.InnerHtml += "<i class='fa fa-chevron-right trans_200' aria-hidden='true' style='color:#77DAD5'></i>";
                lstArt.InnerHtml += "<i class='fa fa-chevron-right trans_200' aria-hidden='true' style='color:#77DAD5'></i>";
                lstArt.InnerHtml += "</div>";
                lstArt.InnerHtml += "<div onclick='loadArticulo(" + item["idArticulo"] + ")'>" + item["nombreArticulo"] + "</div>";
                lstArt.InnerHtml += "</a>";
                lstArt.InnerHtml += "</li>";

            }
            lstArt.InnerHtml += "</ul>";

        }

        public void OptenerCatg() {
            DataTable DTCateg = new DataTable();
            lstCatg.InnerText="";

            DTCateg = ConvertToDataTable(metodo.WSOptenerCatg());

            lstCatg.InnerHtml += "<ul>";
            //Forech para ver Articulos

            foreach (DataRow item in DTCateg.Rows) {

                lstCatg.InnerHtml += "<li>";
                lstCatg.InnerHtml += "<a href='#' class='d-flex flex-row align-items-start justify-content-start'>";
                lstCatg.InnerHtml += "<div class='sidebar_dot d-flex flex-row align-items-center justify-content-start'>";
                lstCatg.InnerHtml += "<i class='fa fa-chevron-right trans_200' aria-hidden='true' style='color:#77DAD5'></i>";
                lstCatg.InnerHtml += "<i class='fa fa-chevron-right trans_200' aria-hidden='true' style='color:#77DAD5'></i>";
                lstCatg.InnerHtml += "</div>";
                lstCatg.InnerHtml += "<div>" + item["nombreCategoria"] + "</div>";
                lstCatg.InnerHtml += "</a>";
                lstCatg.InnerHtml += "</li>";

            }
            lstCatg.InnerHtml += "</ul>";

        }


        [WebMethod]
        public static string articulosxValidar(string palabra) {
            DataTable dtTitulo = new DataTable();
            dtTitulo = ConvertToDataTable(metodo.WSBusquedaTitulo(palabra));
            return DataTableToJSONWithStringBuilder(dtTitulo);
        }

        [WebMethod]
        public static string articuloxId(int idArt)
        {
            int idUsuarioConsulta = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            return DataSetToJSON(metodo.WSConsultarArticuloxId(idArt, idUsuarioConsulta).Tables[0]);
        }

        [WebMethod]
        public static void insertaPalabra(string palabra)
        {
            metodo.WSGuardarPalabraBuscada(palabra);
        }

        [WebMethod]
        public static string articulosxClick(string palabra)
        {
            string res = DataSetToJSON(metodo.WSBusquedaArticulosxClick(palabra).Tables[0]);
            return res;
        }

        public static DataTable ConvertToDataTable<T>(IList<T> data) {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data) {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;

        }


        public static string DataSetToJSON(DataTable dt) {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }

        public static string DataTableToJSONWithStringBuilder(DataTable table) {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0) {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++) {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++) {
                        if (j < table.Columns.Count - 1) {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        } else if (j == table.Columns.Count - 1) {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1) {
                        JSONString.Append("}");
                    } else {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }


        [WebMethod]
        public static string buscarArtMasVistos(int top)
        {
            return DataSetToJSON(metodo.WSBuscarArtMasVistor(top).Tables[0]);
        }

        [WebMethod]
        public static int registrarVisita(int idArticulo)
        {
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            return metodo.WSregistrarVisita(idUsuario, idArticulo);
        }

        [WebMethod]
        public static string consultarComentariosxArt(int idArticulo)
        {
            return DataSetToJSON(metodo.WSconsultarComentariosxArt(idArticulo).Tables[0]);
        }

        [WebMethod]
        public static int registrarValoracionArticulo(int estrellas, int idArticulo, string comentario)
        {
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            return metodo.WSregistrarValoracionxArticulo(estrellas, idArticulo, comentario, idUsuario);
        }

        [WebMethod]
        public static string historialxIdArticulo(int idArt)
        {
            DataTable dtHistorial = new DataTable();
            dtHistorial = ConvertToDataTable(metodo.WSConsultarHistorialArticulo(idArt));
            string contentJSON = "";

            foreach (DataRow item in dtHistorial.Rows)
            {
                contentJSON += item["idArticulo"] + "||" + item["nombreArticulo"].ToString() +
                    "||" + item["version"].ToString() + "||" + item["contenido"].ToString() +
                    "||" + item["fechaCreacion"] + "||" + item["fechaModificacion"] +
                    "||" + item["nombre"] + "$$";
            }
            return contentJSON;
        }

    }
}