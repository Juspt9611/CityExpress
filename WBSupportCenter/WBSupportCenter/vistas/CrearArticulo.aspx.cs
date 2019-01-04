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

namespace WBSupportCenter.vistas
{
    public partial class CrearArticulo : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static int registrarArticulo(string nombreArticulo, string contenido, int[] categorias, string tags, int[] grupos)
        {
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            return metodo.WSOpregistrarArt(nombreArticulo, contenido, string.Join(",", categorias), tags, string.Join(",", grupos));
        }

        [WebMethod]
        public static string consultarCat(int idPadreCat)
        {
            string dataResult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            dataResult = DataSetToJSON(metodo.WSConsultarCategorias(idPadreCat).Tables[0]);
            return dataResult;
        }

        [WebMethod]
        public static string consultarGruposxUsuario(int idUsuario)
        {
            string dataResult = "";
            WSsupportCenterClass metodo = new WSsupportCenterClass();
            dataResult = DataSetToJSON(metodo.WSConsultarGruposxUsuario(idUsuario).Tables[0]);
            return dataResult;
        }

        public static string DataSetToJSON(DataTable dt)
        {
            return JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r.ItemArray));
        }

    }
}