using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WBSupportCenter
{
    public partial class Blog : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = Session["idRol"].ToString();
            if (id == "2")
            {
                aprobacionArticulos.Attributes["class"] = "hidden";
                usuarios.Attributes["class"] = "hidden";
                reportes.Attributes["class"] = "hidden";
            }
            else if (id == "3")
            {
                usuarios.Attributes["class"] = "hidden";
                articulosRed.Attributes["class"] = "hidden";
                reportes.Attributes["class"] = "hidden";
            }
            else if (id == "4")
            {
                usuarios.Attributes["class"] = "hidden";
                categorias.Attributes["class"] = "hidden";
                aprobacionArticulos.Attributes["class"] = "hidden";
                articulosRed.Attributes["class"] = "hidden";
                reportes.Attributes["class"] = "hidden";
            }

            string Nombre = Session["nombres"].ToString();
            string Apellido = Session["Apellidos"].ToString();
            string varsesion = Nombre.Substring(0, 1) + Apellido.Substring(0, 1).ToString();
            session.InnerHtml = "<a class='text-Cir'>" + varsesion + "</a>".ToString();

        }

        public void DoMyOnClickCall(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}