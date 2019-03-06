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
        public List<Articulos> DT_ObtenerArt(int idUsuario) {

            SqlConnection connection = null;
            DataTable dtArt = new DataTable();
            List<Articulos> lstArti = new List<Articulos>();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                SqlDataReader consulta;
                connection.Open();

                    var parametros = new[]{
                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)
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
        public List<CategoriasxSubcategorias> DT_ObtenerCatg(int idUsuario) {
            SqlConnection connection = null;
            DataTable dtCatg = new DataTable();
            List<CategoriasxSubcategorias> lstCat = new List<CategoriasxSubcategorias>();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input),
                    };
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_CategoriasMasVistas ", parametros);
                    dtCatg.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow item in dtCatg.Rows) {
                    CategoriasxSubcategorias obj = new CategoriasxSubcategorias();
                    obj.idCategoria = Int32.Parse(item["idCategoria"].ToString());
                    obj.nombreCategoria = item["nombreCategoria"].ToString();
                    lstCat.Add(obj);
                }



            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return lstCat;
        }
        public List<BusquedaTitulo> DT_BusquedaTitulo(string palabra, int idUsuario) {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            List<BusquedaTitulo> lsttitulo = new List<BusquedaTitulo>();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]{
                        ParametroAcceso.CrearParametro("@palabra", SqlDbType.VarChar, palabra , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)
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

        public DataSet DT_ConsultarArticuloxId(int idArt, int idUsuarioConsulta)        {            DataSet ds = new DataSet();            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    var paramCat = new[]                    {                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input),                        ParametroAcceso.CrearParametro("@idUsuarioConsulta", SqlDbType.Int, idUsuarioConsulta , ParameterDirection.Input)                    };                    connection.Open();                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultaArticulosxId", paramCat);                    dt.Load(consulta);                    connection.Close();                    ds.Tables.Add(dt);                }            }            catch (Exception ex)            {                Console.WriteLine(ex);            }            return ds;        }
        public DataSet DT_BusquedaArticulosxClick(string palabra, int idUsuario)        {            DataSet ds = new DataSet();            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]{                        ParametroAcceso.CrearParametro("@palabra", SqlDbType.VarChar, palabra , ParameterDirection.Input),                        ParametroAcceso.CrearParametro("idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_Buscador", parametros);                    dt.Load(consulta);                    connection.Close();                    ds.Tables.Add(dt);                }            }            catch (Exception ex)            {                Console.WriteLine(ex);            }            return ds;        }
        public int DT_GuardarPalabraBuscada(string palabra)        {            int error = 0;            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]                    {                        ParametroAcceso.CrearParametro("@palabraBuscada", SqlDbType.VarChar, palabra, ParameterDirection.Input)                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarPalabrasBuscadas", parametros);                    dt.Load(consulta);                    connection.Close();                }            }            catch (Exception ex)            {                error = -1;                Console.WriteLine(ex);            }            return error;        }

        public DataSet DT_BuscarArtMasVistos(int top, int idUsuario)
        {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@top", SqlDbType.Int, top , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ArticulosMasVistos", parametros);
                    dt.Load(consulta);
                    connection.Close();

                    ds.Tables.Add(dt);

                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex);
            }

            return ds;
        }

        public int DT_RegistrarVisita(int idUsuario, int idArticulo)        {            int error = 0;            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]                    {                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario, ParameterDirection.Input),                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArticulo, ParameterDirection.Input)                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarVisita", parametros);                    dt.Load(consulta);                    connection.Close();                }            }            catch (Exception ex)            {                error = -1;                Console.WriteLine(ex);            }            return error;        }

        public DataSet DT_ConsultarComentariosxArt(int idArticulo)
        {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArticulo , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarComentariosxArt", parametros);
                    dt.Load(consulta);
                    connection.Close();

                    ds.Tables.Add(dt);

                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex);
            }

            return ds;
        }

        public int DT_RegistraValoracionxArticulo(int estrellas, int idArticulo, string comentario, int idUsuario)        {            int error = 0;            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]                    {                        ParametroAcceso.CrearParametro("@estrella", SqlDbType.Int, estrellas, ParameterDirection.Input),                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArticulo, ParameterDirection.Input),                        ParametroAcceso.CrearParametro("@comentario", SqlDbType.Text, comentario, ParameterDirection.Input),                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario, ParameterDirection.Input)                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarValoracionxArticulo", parametros);                    dt.Load(consulta);                    connection.Close();                }            }            catch (Exception ex)            {                error = -1;                Console.WriteLine(ex);            }            return error;        }

        public int DT_RegistrarAcceso(int idUsuario)        {            int error = 0;            SqlConnection connection = null;            DataTable dt = new DataTable();            try            {                using (connection = Conexion.ObtieneConexion("ConexionBD"))                {                    SqlDataReader consulta;                    connection.Open();                    var parametros = new[]                    {                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario, ParameterDirection.Input),                    };                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarAcceso", parametros);                    dt.Load(consulta);                    connection.Close();                }            }            catch (Exception ex)            {                error = -1;                Console.WriteLine(ex);            }            return error;        }

    }
}
