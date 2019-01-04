﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;
using Newtonsoft.Json;
using System.Text;

namespace SupportCenter {
    public partial class Index : System.Web.UI.Page {
        static WSsupportCenterClass metodo = new WSsupportCenterClass();

        protected void Page_Load(object sender, EventArgs e) {
            OptenerArt();
            OptenerCatg();
            ArtiFrec();
            cargaCAt();
        }


        public void OptenerArt() {
            DataTable tblArti = new DataTable();
            lstArt.InnerText = "";

            tblArti = ConvertToDataTable(metodo.WSOptenerArt());
            //ejemplo = metodo.WSOptenerArt();
            lstArt.InnerHtml += "<ul>";
            //Forech para ver Articulos

            foreach (DataRow item in tblArti.Rows) {
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

            DTCateg = ConvertToDataTable(metodo.WSOptenerCatg());

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

        public void ArtiFrec() {
            DataTable DTartic = new DataTable();
        //    artiMasVi.InnerHtml = "";

        //    //DTartic = ConvertToDataTable(metodo.WSOptenerCatg());
        //    artiMasVi.InnerHtml += " <div class='news_post magic_fade_in'> ";
        //    artiMasVi.InnerHtml += " <div class='news_post_content'>";
        //    artiMasVi.InnerHtml += " <div class='news_post_title'><a href = '#'> Título de artículo</a></div>";
        //    artiMasVi.InnerHtml += " <div class='news_post_text'> ";
        //    artiMasVi.InnerHtml += " <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.Rem, mollitia libero! Quam iste excepturi veniam unde a, sed quis possimus recusandae maxime obcaecati veritatis vero deserunt ipsa officiis, nisi blanditiis?</p>";
        //    artiMasVi.InnerHtml += " </div>";
        //    artiMasVi.InnerHtml += " <div class='news_post_meta'> ";
        //    artiMasVi.InnerHtml += " <ul class='d-flex flex-row align-items-start justify-content-start'> ";
        //    artiMasVi.InnerHtml += " <li><i class='fa fa-user'></i> <a href ='#'> Autor </ a ></ li>";
        //    artiMasVi.InnerHtml += " <li><i class='fa fa-star'></i> <a href ='#' > 5 </ a ></ li>";
        //    artiMasVi.InnerHtml += " <li><i class='fa fa-comment'></i><a href ='#'> 3 Comentarios</a></li>";
        //    artiMasVi.InnerHtml += " </ul>";
        //    artiMasVi.InnerHtml += " </div>";
        //    artiMasVi.InnerHtml += " </div>";
        //    artiMasVi.InnerHtml += " </div>";
        }


        [WebMethod]
        public static string articulosxValidar(string palabra) {
            DataTable dtTitulo = new DataTable();
            dtTitulo = ConvertToDataTable(metodo.WSBusquedaTitulo(palabra));
            return DataTableToJSONWithStringBuilder(dtTitulo);
        }

        [WebMethod]
        public static string articuloxId(int idArt)
        {
            DataTable dtTitulo = new DataTable();
            dtTitulo = ConvertToDataTable(metodo.WSConsultarArticuloxId(idArt));
            string Conten = ""; 
            foreach (DataRow item in dtTitulo.Rows)
            {
                Conten = item["nombreArticulo"].ToString()+"||"+ item["contenido"].ToString();

            }

            return Conten;
        }

        [WebMethod]
        public static void insertaPalabra(string palabra)
        {
            metodo.WSGuardarPalabraBuscada(palabra);
        }

        [WebMethod]
        public static string articulosxClick(string palabra)
        {
            DataTable dtPalabra = new DataTable();
            dtPalabra = ConvertToDataTable(metodo.WSBusquedaArticulosxClick(palabra));
            return DataTableToJSONWithStringBuilder(dtPalabra);
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


        public void cargaCAt() {

            //DDLCategorias.DataSource = metodo.WSConsultarCategorias(0).Tables["Table1"]; ;
            //DDLCategorias.DataTextField = "nombreCategoria";
            //DDLCategorias.DataValueField = "idCategoria";
            //DDLCategorias.DataBind();
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