using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;
using System.Web.Services;
using Newtonsoft.Json;
using System.Text;
using System.ComponentModel;

namespace WBSupportCenter.vistas
{
    public partial class Reporte : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                try
                {
                    string usuariosValidos = "Administrador,Autorizador";
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
        public static string ObtenerDatos(string fechaInicial, string fechaFinal, string valReporte, string valTop)
        {

            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dtTitulo = new DataTable();
            dtTitulo = metodo.WSObtenerArticulo(fechaInicial, fechaFinal, valReporte, valTop).Tables[0];
            return DataTableToJSONWithStringBuilder(dtTitulo);
          
        }

        public static string DataSetToJSON(DataTable dt)
        {
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