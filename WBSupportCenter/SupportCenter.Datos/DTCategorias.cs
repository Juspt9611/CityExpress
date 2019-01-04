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
        public List<CategoriasxSubcategorias> DT_consultarCategorias() {
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

                foreach (DataRow row in dt.Rows) {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();
                  
                    reg.idCategorias = Convert.ToInt32(row["idCategoria"]);
                    reg.idPadre = Convert.ToInt32(row["idPadre"]);
                    reg.idHijo = Convert.ToInt32(row["idHijo"]);
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    reg.descripcionCategoria = row["descripcionCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }


        public List<CategoriasxSubcategorias> DT_getSinHijos() {
            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarCategoriaSinHijos");
                    dt.Load(consulta);
                    connection.Close();

                    Console.WriteLine("************");
                    Console.WriteLine(dt);


                }

                foreach (DataRow row in dt.Rows) {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.idCategorias = Convert.ToInt32(row["idCategoria"]);
                    reg.idPadre = Convert.ToInt32(row["idPadre"]);
                    reg.idHijo = Convert.ToInt32(row["idHijo"]);
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    reg.descripcionCategoria = row["descripcionCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }


        public List<CategoriasxSubcategorias> DT_getSinPadres(int idPadre) {
            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idPadre", SqlDbType.Int, idPadre , ParameterDirection.Input)
                    };

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarCategoriaSinPadres", parametros);
                    dt.Load(consulta);
                    connection.Close();

                    Console.WriteLine("************");
                    Console.WriteLine(dt);


                }

                foreach (DataRow row in dt.Rows) {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.idCategorias = Convert.ToInt32(row["idCategoria"]);
                    reg.idPadre = Convert.ToInt32(row["idPadre"]);
                    reg.idHijo = Convert.ToInt32(row["idHijo"]);
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    reg.descripcionCategoria = row["descripcionCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }


        public List<CategoriasxSubcategorias> DT_getSize(int idCategoria) {
            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCategoria , ParameterDirection.Input)
                    };

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarCategoriaSize", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }

                foreach (DataRow row in dt.Rows) {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.idCategorias = Convert.ToInt32(row["idCategoria"]);
                    reg.idPadre = Convert.ToInt32(row["idPadre"]);
                    reg.idHijo = Convert.ToInt32(row["idHijo"]);
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    reg.descripcionCategoria = row["descripcionCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }



        public List<CategoriasxSubcategorias> DT_getList(int idCategoria) {
            List<CategoriasxSubcategorias> ListaCategoriasxSubcategorias = new List<CategoriasxSubcategorias>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();
                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idPadre", SqlDbType.Int, idCategoria , ParameterDirection.Input)
                    };

                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ConsultarCategoriaList", parametros);
                    dt.Load(consulta);
                    connection.Close();

                    Console.WriteLine("************");
                    Console.WriteLine(dt);


                }

                foreach (DataRow row in dt.Rows) {
                    CategoriasxSubcategorias reg = new CategoriasxSubcategorias();

                    reg.idCategorias = Convert.ToInt32(row["idCategoria"]);
                    reg.idPadre = Convert.ToInt32(row["idPadre"]);
                    reg.idHijo = Convert.ToInt32(row["idHijo"]);
                    reg.nombreCategoria = row["nombreCategoria"].ToString();
                    reg.descripcionCategoria = row["descripcionCategoria"].ToString();
                    ListaCategoriasxSubcategorias.Add(reg);
                }

            } catch (Exception ex) {
                Console.WriteLine(ex);
            }

            return ListaCategoriasxSubcategorias;
        }



        public String DT_guardarCategorias(String nombreCategoria, String descripcion) {
            String error = "";
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                            ParametroAcceso.CrearParametro("@nombre", SqlDbType.VarChar, nombreCategoria , ParameterDirection.Input),
                            ParametroAcceso.CrearParametro("@descripcion", SqlDbType.VarChar, descripcion , ParameterDirection.Input)
                        };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarCategoria", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }
                error = "Success";
            } catch (Exception ex) {
                error = "Error";
                Console.WriteLine(ex);
            }

            return error;
        }


        public String DT_guardarCategoriasEdit(String nombreCategoria, String descripcion, int idCategoria) {
            String error = "";
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                            ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCategoria , ParameterDirection.Input),
                            ParametroAcceso.CrearParametro("@nombre", SqlDbType.VarChar, nombreCategoria , ParameterDirection.Input),
                            ParametroAcceso.CrearParametro("@descripcion", SqlDbType.VarChar, descripcion , ParameterDirection.Input)
                        };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarCategoriaEdit", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }
                error = "Success";
            } catch (Exception ex) {
                error = "Error";
                Console.WriteLine(ex);
            }

            return error;
        }


        public String DT_guardarRelacion(String nombreCategoria, int idCategoria) {
            String error = "";
            String[] lista = nombreCategoria.Split(',');
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    for (int i = 0; i < lista.Length; i++) {
                        SqlDataReader consulta;
                        connection.Open();
                        var parametros = new[] {
                            ParametroAcceso.CrearParametro("@idHijo", SqlDbType.Int, lista[i] , ParameterDirection.Input),
                            ParametroAcceso.CrearParametro("@idPadre", SqlDbType.Int, idCategoria , ParameterDirection.Input),
                        };
                        consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_InsertarRelacionCategorias", parametros);
                        connection.Close();
                    } 
                }
                error = "Success";
            } catch (Exception ex) {
                error = "Error";
                Console.WriteLine(ex);
            }

            return error;
        }


        public String DT_eliminarCategorias(int idCategoria) {
            String response = "";
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            try {
                using (connection = Conexion.ObtieneConexion("ConexionBD")) {

                    SqlDataReader consulta;
                    connection.Open();

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@idCategoria", SqlDbType.Int, idCategoria , ParameterDirection.Input)
                    };


                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_EliminarCategorias", parametros);
                    dt.Load(consulta);
                    connection.Close();

                }
                response = "Success";
            } catch (Exception ex) {
                response = "Error";
                Console.WriteLine(ex);
            }

            return response;
        }



    }



}
