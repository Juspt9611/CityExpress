using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;

namespace WBSupportCenter.vistas {
    public partial class Personal : System.Web.UI.Page {
        static WSsupportCenterClass metodo = new WSsupportCenterClass();

        protected void Page_Load(object sender, EventArgs e) {

            
        }

        protected void btnGuardar_Click(object sender, EventArgs e) {

            string nombre = textInputNombre.Text.ToString();
            string apPaterno = textInputApellidoP.Text.ToString();
            string apMaterno = textInputApellidoM.Text.ToString();
            string nombreUsuario = textInputUsuario.Text.ToString();
            string contrasena = textInputContra.Text.ToString();
            string valorGrupo = grupoSelect.Value;
            string valorRol = rolSelect.Value;
            string idGrupo = "";
            string idRol = "";

            for(int i = 0; i <= grupoSelect.Items.Count - 1; i++)
            {
                if(grupoSelect.Items[i].Selected)
                {
                    idGrupo += i + 1 +"|";
                }
            }

            for (int i = 0; i <= rolSelect.Items.Count - 1; i++)
            {
                if (rolSelect.Items[i].Selected)
                {
                    idRol += i + 1 + "|";
                }
            }

            idGrupo = idGrupo.TrimEnd('|');
            idRol = idRol.TrimEnd('|');

            //metodo.WSRegistrarPer(nombre, apPaterno, apMaterno, idGrupo, nombreUsuario, contrasena, idRol);
        }

        [WebMethod]
        public static string personal()
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            String result = "";
            //result = DataSetToJSON(metodo.WSConsultarPersonal().Tables[0]); 
            return result;
        }

        public static string DataSetToJSON(DataTable dt)
        {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }
    }
}