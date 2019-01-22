using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Entidades;
using SupportCenter.Framework.AccesoDatos;

namespace SupportCenter.Datos {
    public class DTPersonal {

        public DataSet DTLlenaGrupo() {
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {
                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarGrupos");
                    dt.Load(consulta);
                    connection.Close();
                    ds.Tables.Add(dt);

                }

            } catch (Exception ex) {

                Console.WriteLine(ex);
            }

            return ds;
        }
        public DataSet DTLlenaRoles() {
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {
                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarRoles");
                    dt.Load(consulta);
                    connection.Close();
                    ds.Tables.Add(dt);

                }

            } catch (Exception ex) {

                Console.WriteLine(ex);
            }

            return ds;
        }
        public bool DTInsertarPers(string Nombres, string Apellido, string Usuario, string grupos, string rol)
        {
            SqlConnection connection = null;
            bool resp = false;
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {
                    SqlDataReader consulta;
                    connection.Open();
                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@nombre", SqlDbType.VarChar, Nombres , ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@apellidos", SqlDbType.VarChar, Apellido, ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@idGrupo", SqlDbType.VarChar, grupos , ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@nombreUsuario", SqlDbType.VarChar, Usuario , ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@idRol", SqlDbType.VarChar, rol , ParameterDirection.Input),
                    };

                    resp=Ejecuta.EjecutarSpSinRetorno(connection, parametros, "SP_InsertarPersonal");

                    connection.Close();
                }

            } catch (Exception ex) {

                Console.WriteLine(ex);
            }

            return resp;
        }
        public DataSet DTRolUser(string Usuario)
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
                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@nombreUsuario", SqlDbType.VarChar, Usuario , ParameterDirection.Input),
                    };

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_RolesxUsuario", parametros);
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

        public List<UsuarioEntidades> DT_ConsultarUsuariosxAdmin(string usuario)
        {
            SqlConnection connection = null;            DataTable dt = new DataTable();            List<UsuarioEntidades> listaUsuarios = new List<UsuarioEntidades>();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;

                    var param = new[]                    {                        ParametroAcceso.CrearParametro("@nombreUsuario", SqlDbType.VarChar, usuario , ParameterDirection.Input)                    };

                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarUsuariosSesiones", param);
                    dt.Load(consulta);                    connection.Close();
                }

                foreach (DataRow item in dt.Rows)                {
                   UsuarioEntidades obj = new UsuarioEntidades();
                    obj = new UsuarioEntidades();                    obj.nombre = item["nombre"].ToString();                    obj.apellidos = item["apellidos"].ToString();                    obj.nombreUsuario = item["nombreUsuario"].ToString();                    obj.nombreRol = item["nombreRol"].ToString();                    obj.nombreGrupo = item["nombreGrupo"].ToString();                    listaUsuarios.Add(obj);                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return listaUsuarios;
        }
    }
}
