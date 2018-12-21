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
        public int DT_RegistrarArticulo(string nombreArticulo, string contenido, int[] categorias)
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
                        ParametroAcceso.CrearParametro("@contenido", SqlDbType.VarChar, contenido , ParameterDirection.Input)
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


        public DataSet DT_ConsultarArxtxValidar()
        {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultaArticulosPendientesxValidar");
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
