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
        protected void Page_Load(object sender, EventArgs e) {

        }

        [WebMethod]
        public static String consultarCategorias() {
            String daresult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dt = new DataTable();
            dt = ConvertToDataTable(metodo.WSconsultarCategorias());
            daresult = DataTableToJSONWithStringBuilder(dt);
            return daresult;

        }



        [WebMethod]
        public static String getSinHijos() {
            String daresult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dt = new DataTable();
            dt = ConvertToDataTable(metodo.WSgetSinHijos());
            daresult = DataTableToJSONWithStringBuilder(dt);
            return daresult;
        }

        [WebMethod]
        public static String getSinPadres(int idPadre) {
            String daresult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dt = new DataTable();
            dt = ConvertToDataTable(metodo.WSgetSinPadres(idPadre));
            daresult = DataTableToJSONWithStringBuilder(dt);
            return daresult;
        }


        [WebMethod]
        public static String getSize(int idCategoria) {
            String daresult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dt = new DataTable();
            dt = ConvertToDataTable(metodo.WSgetSize(idCategoria));
            daresult = DataTableToJSONWithStringBuilder(dt);
            return daresult;
        }


        [WebMethod]
        public static String getList(int idCategoria) {
            String daresult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dt = new DataTable();
            dt = ConvertToDataTable(metodo.WSgetList(idCategoria));
            daresult = DataTableToJSONWithStringBuilder(dt);
            return daresult;
        }

        [WebMethod]
        public static String guardarCategorias(String nombreCategoria, String descripcion) {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSguardarCategorias(nombreCategoria, descripcion);
        }

        [WebMethod]
        public static String guardarCategoriasEdit(String nombreCategoria, String descripcion, int idCategoria) {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSguardarCategoriasEdit(nombreCategoria, descripcion, idCategoria);
        }


        [WebMethod]
        public static String guardarRelacion(String nombreCategoria, int idCategoria) {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSguardarRelacion(nombreCategoria, idCategoria);
        }



        [WebMethod]
        public static String eliminarCategorias(int idCategoria) {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSeliminarCategorias(idCategoria);
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
    }
}