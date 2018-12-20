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
        public DataTable DT_ObtenerArt() {

            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                SqlDataReader consulta;
                connection.Open();

                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@NombreUsuario", SqlDbType.VarChar, "mdiaz" , ParameterDirection.Input),
                    };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ObtenerArticulosMasVistos", parametros);
                dt.Load(consulta);
                connection.Close();

                }

            } catch (Exception ex) {

                Console.WriteLine(ex);
            }

            return dt;
        }

        

        public DataTable DT_ObtenerCatg() {

            SqlConnection connection = null;
            DataTable dtCatg = new DataTable();
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

            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return dtCatg;
        }
    }
}
