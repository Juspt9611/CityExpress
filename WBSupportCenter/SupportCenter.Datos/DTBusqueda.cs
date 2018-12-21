using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Framework.AccesoDatos;
using System.Data;
using SupportCenter.Entidades;

namespace SupportCenter.Datos {
    public class DTBusqueda {
        public List<Articulos> DT_ObtenerArt() {

            SqlConnection connection = null;
            DataTable dtArt = new DataTable();
            List<Articulos> lstArti = new List<Articulos>();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                SqlDataReader consulta;
                connection.Open();

                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@NombreUsuario", SqlDbType.VarChar, "mdiaz" , ParameterDirection.Input),
                    };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ObtenerArticulosMasVistos", parametros);
                    dtArt.Load(consulta);
                connection.Close();

                }
                foreach (DataRow item in dtArt.Rows) {
                    Articulos obj = new Articulos();

                    obj.idarticulo = Convert.ToInt32(item["idarticulo"].ToString());
                    obj.nombreArticulo = item["nombreArticulo"].ToString();

                    lstArti.Add(obj);

                }


            } catch (Exception ex) {

                Console.WriteLine(ex);
            }

            return lstArti;
        }
        public List<CategoriasxSubcategorias> DT_ObtenerCatg() {
            SqlConnection connection = null;
            DataTable dtCatg = new DataTable();
            List<CategoriasxSubcategorias> lstCat = new List<CategoriasxSubcategorias>();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@NombreUsuario", SqlDbType.VarChar, "mdiaz" , ParameterDirection.Input),
                    };
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_CategoriasMasVistas ", parametros);
                    dtCatg.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow item in dtCatg.Rows) {
                    CategoriasxSubcategorias obj = new CategoriasxSubcategorias();

                    obj.nombreCategoria = item["nombreCategoria"].ToString();
                    lstCat.Add(obj);
                }



            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return lstCat;
        }
        public List<BusquedaTitulo> DT_BusquedaTitulo(string palabra) {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            List<BusquedaTitulo> lsttitulo = new List<BusquedaTitulo>();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@palabra", SqlDbType.VarChar, palabra , ParameterDirection.Input),
                    };
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_BusquedaxTitulo", parametros);
                    dt.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow item in dt.Rows) {
                    BusquedaTitulo obj = new BusquedaTitulo();
                    obj.idarticulo = Convert.ToInt32(item["idarticulo"].ToString());
                    obj.nombreArticulo = item["nombreArticulo"].ToString();
                    lsttitulo.Add(obj);
                }

            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return lsttitulo;
        }

    }
}
