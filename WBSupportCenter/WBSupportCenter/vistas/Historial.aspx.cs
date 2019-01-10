using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;

namespace WBSupportCenter.vistas
{
    public partial class Historial : System.Web.UI.Page
    {
        static WSsupportCenterClass metodo = new WSsupportCenterClass();
        protected void Page_Load(object sender, EventArgs e)
        {

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