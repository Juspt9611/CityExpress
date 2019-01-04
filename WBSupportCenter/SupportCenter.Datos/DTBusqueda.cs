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

        public List<Articulos> DT_ConsultarArticuloxId(int idArt)        {            SqlConnection connection = null;            DataTable dt = new DataTable();            List<Articulos> entidad = new List<Articulos>();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    var paramCat = new[]                    {                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input)                    };                    connection.Open();                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultaArticulosxId", paramCat);                    dt.Load(consulta);                    connection.Close();                }                foreach (DataRow item in dt.Rows)                {                    Articulos obj = new Articulos();                    obj.idarticulo = Convert.ToInt32(item["idarticulo"].ToString());                    obj.nombreArticulo = item["nombreArticulo"].ToString();                    obj.contenido = item["contenido"].ToString();                    entidad.Add(obj);                }            }            catch (Exception ex)            {                Console.WriteLine(ex);            }            return entidad;        }
        public List<Articulos> DT_BusquedaArticulosxClick(string palabra)        {            SqlConnection connection = null;            DataTable dt = new DataTable();            List<Articulos> listaArticulos = new List<Articulos>();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]{                        ParametroAcceso.CrearParametro("@palabra", SqlDbType.VarChar, palabra , ParameterDirection.Input),                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_Buscador", parametros);                    dt.Load(consulta);                    connection.Close();                }                foreach (DataRow item in dt.Rows)                {                    Articulos obj = new Articulos();                    obj.idarticulo = Convert.ToInt32(item["idarticulo"].ToString());                    obj.nombreArticulo = item["nombreArticulo"].ToString();                    obj.nombreCategoria = item["nombreCategoria"].ToString();                    listaArticulos.Add(obj);                }            }            catch (Exception ex)            {                Console.WriteLine(ex);            }            return listaArticulos;        }
        public int DT_GuardarPalabraBuscada(string palabra)        {            int error = 0;            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]                    {                        ParametroAcceso.CrearParametro("@palabraBuscada", SqlDbType.VarChar, palabra, ParameterDirection.Input)                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarPalabrasBuscadas", parametros);                    dt.Load(consulta);                    connection.Close();                }            }            catch (Exception ex)            {                error = -1;                Console.WriteLine(ex);            }            return error;        }

    }
}
