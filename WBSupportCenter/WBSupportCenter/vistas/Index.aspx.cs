using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;



namespace SupportCenter {
    public partial class Index : System.Web.UI.Page {
        WSsupportCenterClass metodo = new WSsupportCenterClass();

        protected void Page_Load(object sender, EventArgs e) {
            OptenerArt();
            OptenerCatg();
        }


        public void OptenerArt() {
            DataTable ejemplo = new DataTable();
            lstArt.InnerText = "";
            ejemplo = metodo.WSOptenerArt();
            lstArt.InnerHtml += "<ul>";
            //Forech para ver Articulos

            foreach (DataRow item in ejemplo.Rows) {
                lstArt.InnerHtml += "<li>";
                lstArt.InnerHtml += "<a href='#' class='d-flex flex-row align-items-start justify-content-start'>";
                lstArt.InnerHtml += "<div class='sidebar_dot d-flex flex-row align-items-center justify-content-start'>";
                lstArt.InnerHtml += "<i class='fa fa-chevron-right trans_200' aria-hidden='true' style='color:#77DAD5'></i>";
                lstArt.InnerHtml += "<i class='fa fa-chevron-right trans_200' aria-hidden='true' style='color:#77DAD5'></i>";
                lstArt.InnerHtml += "</div>";
                lstArt.InnerHtml += "<div>" + item["nombreArticulo"] + "</div>";
                lstArt.InnerHtml += "</a>";
                lstArt.InnerHtml += "</li>";

            }
            lstArt.InnerHtml += "</ul>";

        }
        public void OptenerCatg() {
            DataTable DTCateg = new DataTable();
            lstCatg.InnerText="";

            DTCateg =metodo.WSOptenerCatg();

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

    }
}