using System;
using WBSupportCenter.WSsupport1;
using System.Web.Services;
using System.Data;
using Newtonsoft.Json;
using SupportCenter.Entidades;
using System.Web.Script.Services;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace WBSupportCenter.vistas {
    public partial class WebForm1 : System.Web.UI.Page {
        static WSsupportCenterClass metodo = new WSsupportCenterClass();
        protected void Page_Load(object sender, EventArgs e) {

        }

        [WebMethod]
        public static void registrarCategoria(string nombreCategoria)
        {
            metodo.WSRegistrarCategoria(nombreCategoria);
        }

        [WebMethod]
        public static void registrarSubcategoria(int idPadre, string nombreSubcategoria)
        {
            metodo.WSRegistrarSubcategoria(idPadre, nombreSubcategoria);
        }

        [WebMethod]
        public static void editarCategorias(int idCat, string nombreCategoria)
        {
            metodo.WSEditarCategorias(idCat, nombreCategoria);
        }

        [WebMethod]
        public static string eliminarCategorias(int idCat)
        {
            DataTable dtTitulo = new DataTable();
            dtTitulo = ConvertToDataTable(metodo.WSEliminarCategorias(idCat));
            return DataTableToJSONWithStringBuilder(dtTitulo);
        }

        [WebMethod]
        public static string consultarSubcategoria(int idCat)
        {
            DataTable dtTitulo = new DataTable();
            dtTitulo = ConvertToDataTable(metodo.WSConsultarSubcategorias(idCat));
            return DataTableToJSONWithStringBuilder(dtTitulo);
        }

        [WebMethod]
        public static string consultarCategoria()
        {
            DataTable dtTitulo = new DataTable();
            dtTitulo = ConvertToDataTable(metodo.WSConsultarCategoriasSub());
            return DataTableToJSONWithStringBuilder(dtTitulo);
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