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
using System.ComponentModel;
using System.Text;

namespace WBSupportCenter.vistas {
    public partial class articulosVistos : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack)
            {
                try
                {
                    string usuariosValidos = "Administrador,Autorizador";
                    string auth = HttpContext.Current.Session["Autenticacion"].ToString();
                    string nombreRol = HttpContext.Current.Session["nomRol"].ToString();
                    if (auth.Equals("false") || (usuariosValidos.IndexOf(nombreRol)<0))
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
        public static String consultarArticuloAprobar() {
            String daresult = "";
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            daresult = DataSetToJSON(metodo.WSConsultarArtPorValidar(idUsuario).Tables[0]);
            return daresult;
        }

        [WebMethod]
        public static string consultarArticulosAprobados()
        {
            DataTable dtArticulos = new DataTable();
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            dtArticulos = ConvertToDataTable(metodo.WSConsultarArtAprobados(idUsuario));
            return DataTableToJSONWithStringBuilder(dtArticulos);
        }

        [WebMethod]
        public static void eliminarArticulo(int idArticulo)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            metodo.WSEliminarArticulo(idArticulo);
        }

        [WebMethod]
        public static String guardarEstatusArticuloAprobar(int idArticulo, int estatus, String comentario) {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSOguardarEstatusArticuloAprobar(idArticulo, estatus, comentario);
        }

        public static string DataSetToJSON(DataTable dt) {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }

        public static DataTable ConvertToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;

        }

        public static string DataTableToJSONWithStringBuilder(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }
    }
}