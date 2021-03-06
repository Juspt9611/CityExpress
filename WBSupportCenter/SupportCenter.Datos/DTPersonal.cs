﻿using System;
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

        public DataSet DTLlenaGrupo(int idUsuario) {
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    var param = new[]                    {                        ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario, ParameterDirection.Input)                    };

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarGrupos", param);
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
        public bool DTInsertarPers(int idCreador, string Nombres, string Apellido, string Usuario, string grupos, string rol)
        {
            SqlConnection connection = null;
            bool resp = false;
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {
                    SqlDataReader consulta;
                    connection.Open();
                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@idCreador", SqlDbType.Int, idCreador , ParameterDirection.Input),
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

        public List<UsuarioEntidades> DT_ConsultarUsuarioExist(string nombreUsuario)
        {
            SqlConnection connection = null;            DataTable dt = new DataTable();            List<UsuarioEntidades> listaHistorial = new List<UsuarioEntidades>();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;

                    var paramHist = new[]                    {                        ParametroAcceso.CrearParametro("@nombreUsuario", SqlDbType.VarChar, nombreUsuario, ParameterDirection.Input)                    };

                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ValidaUsuario", paramHist);
                    dt.Load(consulta);                    connection.Close();
                }

                foreach (DataRow item in dt.Rows)                {                    UsuarioEntidades obj = new UsuarioEntidades();                    obj.estatus = item["estatus"].ToString();                    listaHistorial.Add(obj);                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return listaHistorial;
        }

        public bool DTEditarPers(int idPersonal, int idUsuario, string idGrupo, int idRol)
        {
            SqlConnection connection = null;
            bool resp = false;
            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;
                    connection.Open();
                    var parametros = new[]{
                    ParametroAcceso.CrearParametro("@idPersonal", SqlDbType.Int, idPersonal , ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@idUsuario", SqlDbType.Int, idUsuario, ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@idGrupo", SqlDbType.VarChar, idGrupo , ParameterDirection.Input),
                    ParametroAcceso.CrearParametro("@idRol", SqlDbType.Int, idRol , ParameterDirection.Input),
                    };

                    resp = Ejecuta.EjecutarSpSinRetorno(connection, parametros, "SP_EditarPersonal");

                    connection.Close();
                }

            }
            catch (Exception ex)
            {

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
                    obj = new UsuarioEntidades();                    obj.nombre = item["nombre"].ToString();                    obj.apellidos = item["apellidos"].ToString();                    obj.nombreUsuario = item["nombreUsuario"].ToString();                    obj.nombreRol = item["nombreRol"].ToString();                    obj.nombreGrupo = item["nombreGrupo"].ToString();
                    obj.idPersonal = Convert.ToInt32(item["idPersonal"].ToString());                    obj.idUsuario = Convert.ToInt32(item["idUsuario"].ToString());                    obj.idGrupos = item["idGrupo"].ToString();                    obj.idRol = Convert.ToInt32(item["idRol"].ToString());                    listaUsuarios.Add(obj);                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return listaUsuarios;
        }
    }
}
