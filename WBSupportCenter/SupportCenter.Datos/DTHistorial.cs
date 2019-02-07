using SupportCenter.Entidades;
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
    public class DTHistorial
    {
        public List<Historial> DT_ConsultarHistorialArticulo(int idArt)
        {
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            List<Historial> listaHistorial = new List<Historial>();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;

                    var paramHist = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input)
                    };

                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_HistorialArticulo", paramHist);
                    dt.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow item in dt.Rows)
                {
                    Historial obj = new Historial();
                    obj.idArticulo = Convert.ToInt32(item["idArticulo"].ToString());
                    obj.nombreArticulo = item["nombreArticulo"].ToString();
                    obj.version = Convert.ToInt32(item["version"].ToString());
                    obj.contenido = item["contenido"].ToString();
                    obj.fechaCreacion = item["fechaCreacion"].ToString();
                    obj.fechaModificacion = item["fechaModificacion"].ToString();
                    obj.nombre = item["nombre"].ToString();
                    listaHistorial.Add(obj);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return listaHistorial;
        }

        public List<Historial> DT_ConsultarArticuloxVersion(int idArt, int ver)
        {
            SqlConnection connection = null;
            DataTable dt = new DataTable();
            List<Historial> listaHistorial = new List<Historial>();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;

                    var paramHist = new[]
                    {
                        ParametroAcceso.CrearParametro("@idArticulo", SqlDbType.Int, idArt , ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@version", SqlDbType.Int, ver , ParameterDirection.Input)
                    };

                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_HistorialArticuloxVersion", paramHist);
                    dt.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow item in dt.Rows)
                {
                    Historial obj = new Historial();
                    obj.idArticulo = Convert.ToInt32(item["idArticulo"].ToString());
                    obj.nombreArticulo = item["nombreArticulo"].ToString();
                    obj.version = Convert.ToInt32(item["version"].ToString());
                    obj.contenido = item["contenido"].ToString();
                    obj.fechaCreacion = item["fechaCreacion"].ToString();
                    obj.fechaModificacion = item["fechaModificacion"].ToString();
                    obj.nombre = item["nombre"].ToString();
                    listaHistorial.Add(obj);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return listaHistorial;
        }
    }
}
