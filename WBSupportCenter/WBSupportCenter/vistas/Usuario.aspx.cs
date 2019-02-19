using Newtonsoft.Json;
using System;
using System.Collections;
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

namespace WBSupportCenter.vistas {
    public partial class prueba : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack)
            {
                try
                {
                    string usuariosValidos = "Administrador";
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
        public static ArrayList buscaDatos(string Usuario, string contrasena, string UsuarioB) {
            LDAPA AutetiDA = new LDAPA();
            bool resp = false;
            ArrayList listaPropiedades = new ArrayList();

            resp = AutetiDA.BuscaUsuario("", Usuario, contrasena, UsuarioB);
            if (resp!=false)
            {
                listaPropiedades = AutetiDA.getListaBusqueda();
            } else
            {
                listaPropiedades.Add("ErrorContraseña");
            }          

            return listaPropiedades;
        }
        [WebMethod]
        public static string LlenaGrupo() {
            int idUsuario = Int32.Parse(HttpContext.Current.Session["idUsuario"].ToString());
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return DataTableToJSONWithStringBuilder(metodo.WSOptenerGrup(idUsuario).Tables[0]);
        }
        [WebMethod]
        public static string LlenaRol() {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return DataTableToJSONWithStringBuilder(metodo.WSOptenerRols().Tables[0]);
        }
        [WebMethod]
        public static bool InsertarUsuario(int idCreador, string Nombres, string Apellido, string Usuario, string grupos, string rol)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();

            return metodo.WSInsertarPers(idCreador, Nombres, Apellido, Usuario, grupos, rol);
        }

        [WebMethod]
        public static bool EditarUsuario(int idPersonal, int idUsuario, string idGrupo, int idRol)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();

            return metodo.WSEditarPers(idPersonal, idUsuario, idGrupo, idRol);
        }

        [WebMethod]
        public static string consultarUsuariosxAdmin(string usuario)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dtUsuarios = new DataTable();
            dtUsuarios = ConvertToDataTable(metodo.WSConsultarUsuarioxAdmin(usuario));
            return DataTableToJSONWithStringBuilder(dtUsuarios);
        }

        [WebMethod]
        public static string consultarUsuarioExiste(string nombreUsuario)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            DataTable dtUsuarios = new DataTable();
            dtUsuarios = ConvertToDataTable(metodo.WSConsultarUsuarioExist(nombreUsuario));
            return DataTableToJSONWithStringBuilder(dtUsuarios);
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

    }
}