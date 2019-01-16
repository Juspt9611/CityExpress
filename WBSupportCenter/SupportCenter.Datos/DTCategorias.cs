using SupportCenter.Framework.AccesoDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Entidades;

namespace SupportCenter.Datos
{
    public class DTCategorias
    {
        public int DT_RegistrarCategoria(string nombreCategoria)
        {
            int error = 0;
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;
                    
                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@nombre", SqlDbType.VarChar, nombreCategoria , ParameterDirection.Input)
                    };
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarCategoria", parametros);
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

        public int DT_RegistrarSubCategoria(int idPadre, string nombreCategoria)
        {
            int error = 0;
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idCategoriaEnviada", SqlDbType.Int, idPadre, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@nombre", SqlDbType.VarChar, nombreCategoria , ParameterDirection.Input)
                    };
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarSubCategoria", parametros);
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

        public int DT_EditarCategorias(int idCat, string nombreCategoria)
        {
            int error = 0;
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCat, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@nombreCategoria", SqlDbType.VarChar, nombreCategoria , ParameterDirection.Input)
                    };
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_EditarCategoriasySubcategorias", parametros);
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

        public List<CategoriasxSubcategorias> DT_EliminarCategorias(int idCat)
        {
            int error = 0;
            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCat, ParameterDirection.Input)
                    };
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_EliminarCategorias", parametros);
                    dt.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow row in dt.Rows)
                {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.total = Convert.ToInt32(row["total"].ToString());
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            }
            catch (Exception ex)
            {
                error = 1;
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }

        public List<CategoriasxSubcategorias> DT_ConsultarCategorias()
        {
            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;
                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarCategoria");
                    dt.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow row in dt.Rows)
                {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.idCategoria = Convert.ToInt32(row["idCategoria"].ToString());
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }

        public List<CategoriasxSubcategorias> DT_ConsultarSubcategorias(int idCat)
        {
            SqlConnection connection = null;            DataTable dt = new DataTable();            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;

                    var paramHist = new[]                    {                        ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCat , ParameterDirection.Input)                    };

                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarSubCategoria", paramHist);
                    dt.Load(consulta);                    connection.Close();
                }

                foreach (DataRow row in dt.Rows)
                {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.idCategoria = Convert.ToInt32(row["idCategoria"].ToString());
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }
    }
}
