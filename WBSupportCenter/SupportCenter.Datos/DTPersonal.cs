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
    public class DTPersonal
    {
        public int DT_RegistrarPersonal(string nombre, string apPaterno, string apMaterno, string idGrupo, string nombreUsuario, string contrasena, string idRol)
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
                        ParametroAcceso.CrearParametro("@nombre", SqlDbType.VarChar, nombre, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@apPaterno", SqlDbType.VarChar, apPaterno, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@apMaterno", SqlDbType.VarChar, apMaterno, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@idGrupo", SqlDbType.VarChar, idGrupo, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@nombreUsuario", SqlDbType.VarChar, nombreUsuario, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@contrasena", SqlDbType.VarChar, contrasena, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@idRol", SqlDbType.VarChar, idRol, ParameterDirection.Input)
                    };

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarPersonal", parametros);
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

        public DataSet DT_ConsultaPersonal()
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

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarPersonaUsuario");
                    dt.Load(consulta);
                    ds.Tables.Add(dt);
                    connection.Close();
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
