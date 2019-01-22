using SupportCenter.Framework.AccesoDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Datos
{
    public class DTArticulo
    {
        public int DT_RegistrarArticulo(string nombreArticulo, string contenido, string categorias, string tags, string grupos, int idUsuario)
        {
            int error = 0;
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@nombreArticulo", SqlDbType.VarChar, nombreArticulo , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@contenido", SqlDbType.VarChar, contenido , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@categorias", SqlDbType.VarChar, categorias , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@tags", SqlDbType.VarChar, tags , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@grupos", SqlDbType.VarChar, grupos , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@idUsu", SqlDbType.Int, idUsuario , ParameterDirection.Input)
                    };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarArticulos", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }

            }
            catch (Exception ex)
            {
                error = 1;
                Console.WriteLine(ex);
            }

            return error;
        }

        public int DT_EditarArticulo(int idArticulo, string nombreArticulo, string contenido, string categorias, string tags, string grupos)
        {
            int error = 0;
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArticulo , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@nombreArticulo", SqlDbType.VarChar, nombreArticulo , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@contenido", SqlDbType.VarChar, contenido , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@categorias", SqlDbType.VarChar, categorias , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@tags", SqlDbType.VarChar, tags , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@grupos", SqlDbType.VarChar, grupos , ParameterDirection.Input)
                    };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_EditarArticulos", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }

            }
            catch (Exception ex)
            {
                error = 1;
                Console.WriteLine(ex);
            }

            return error;
        }


        public DataSet DT_ConsultarArxtxValidar(int idUsuario)
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
                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultaArticulosPendientesxValidar", parametros);
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

        public DataSet DT_ConsultarArtxCategoria(int idCategoria)
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
                        ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCategoria , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_CategoriaMasVista", parametros);
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

        public DataSet DT_ConsultarArtEdicion(int idArt)
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
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    
                    //Contenido articulo
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReplaceContenidoArticulos", parametros);
                    dt.Load(consulta);
                    connection.Close();

                    ds.Tables.Add(dt);
                    ds.Tables.Add(DT_ConsultarCategoriasxArt(idArt));
                    ds.Tables.Add(DT_ConsultarTagsxArt(idArt));
                    ds.Tables.Add(DT_ConsultarGrupossxArt(idArt));

                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex);
            }

            return ds;
        }

        public static DataTable DT_ConsultarCategoriasxArt(int idArt)
        {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var paramCat = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input)
                    };

                    //Categorias
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_MuestraCategoriasxArticulo", paramCat);
                    dt.Load(consulta);
                    connection.Close();

                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex);
            }

            return dt;
        }

        public static DataTable DT_ConsultarGrupossxArt(int idArt)
        {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var paramCat = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input)
                    };

                    //Categorias
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_MuestraGruposxArticulo", paramCat);
                    dt.Load(consulta);
                    connection.Close();

                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex);
            }

            return dt;
        }

        public static DataTable DT_ConsultarTagsxArt(int idArt)
        {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var paramCat = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input)
                    };

                    //Tags
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_MuestraTagsxArticulo", paramCat);
                    dt.Load(consulta);
                    connection.Close();

                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex);
            }

            return dt;
        }

        public DataSet DT_ConsultarCategorias(int idPadreCat)
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
                        ParametroAcceso.CrearParametro("@idPadre", SqlDbType.Int, idPadreCat , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_MuestraCategorias", parametros);
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

        public DataSet DT_ConsultarArtPorValidar(int idUsuario)
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
                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarArtiPorValidar", parametros);
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

        public String DT_guardarEstatusArticuloAprobar(int idArticulo, int estatus, String comentario)
        {
            String error = "Success";
            SqlConnection connection = null;
            DataTable dt = new DataTable();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;
                    connection.Open();
                    var parametros = new[]
                    { ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArticulo , ParameterDirection.Input),
                      ParametroAcceso.CrearParametro("@estatus", SqlDbType.Int, estatus , ParameterDirection.Input),
                      ParametroAcceso.CrearParametro("@comentario", SqlDbType.VarChar, comentario , ParameterDirection.Input)};
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_EditarEstArtiValidar", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }

            }
            catch (Exception ex)
            {
                error = "Error" + ex;
                Console.WriteLine(ex);
            }

            return error;
        }

        public DataSet DT_ConsultarGruposxUsuario(int idUsuario)
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
                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario , ParameterDirection.Input)
                    };

                    SqlDataReader consulta;

                    //Contenido articulo
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_MuestraGruposxUsuario", parametros);
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

    }
}